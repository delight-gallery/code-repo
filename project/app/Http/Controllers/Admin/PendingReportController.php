<?php

namespace App\Http\Controllers\Admin;

use Datatables;
use Carbon\Carbon;
use App\Models\Order;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class PendingReportController extends Controller
{
	public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function payment()
    {
    	return view('admin.report.pending-payment');
    }

    //*** JSON Request
    public function datatables(Request $request)
    {
         
        $order = new Order;
        
        $order->with('vendororders');
        $order->with('user');
        
        //$order->where('pay_amount','>',0);
        $order = $order->where('payment_status','Pending');

        if (!empty($request->form)) {
            parse_str($request->form, $form);
        }
        // print_r($form);
        if (empty($form['fromdate']) && empty($form['todate'])) {
            $order = $order->whereRaw('MONTH(created_at) = ?',[date('m')]);
        } else {
            if (!empty($form['fromdate']) && empty($form['todate'])) {
                $order = $order->whereRaw('DATE(created_at) >= ?', [date('Y-m-d',strtotime($form['fromdate']))]);
            } else if (!empty($form['fromdate']) && !empty($form['todate'])) {
                $order = $order->whereDate('created_at', '>=', date('Y-m-d',strtotime($form['fromdate'])));
                $order = $order->whereDate('created_at', '<=', date('Y-m-d',strtotime($form['todate'])));
            }
        }
        

        $datas = $order->orderBy('id','desc')->get();
        
         //--- Integrating This Collection Into Datatables
         return Datatables::of($datas)
                            
                            ->editColumn('vendor', function(Order $data) {
                                if (isset($data->vendororders[0])) {
                                    $vendor = User::find($data->vendororders[0]->user_id)->first();
                                    if (isset($vendor->name)) {
                                        return $vendor->name;
                                    } else {
                                        return '';
                                    }
                                }
                            })
                            ->editColumn('customer', function(Order $data) {
                                if (isset($data->user->name)) {
                                    return $data->user->name;
                                } else {
                                    return '';
                                }
                            })
                            ->editColumn('order_number', function(Order $data) {
                                return $data->order_number;
                            })
                            ->editColumn('invoice_number', function(Order $data) {
                                return sprintf("%'.08d", $data->id);
                            })
                            ->editColumn('pay_amount', function(Order $data) {
                                return  $data->pay_amount;
                            })
                            ->editColumn('method', function(Order $data) {
                                return $data->method;
                            })
                            ->editColumn('created_at', function(Order $data) {
                                return date('d-m-Y', strtotime($data->created_at));
                            })
                            ->editColumn('payment_status', function(Order $data) {
                                return ucfirst($data->payment_status);
                            })
                            // ->rawColumns(['id', 'status', 'action'])
                            ->toJson(); //--- Returning Json Data To Client Side
    }

    public function download()
    {
        $order = new Order;
        
        $order->with('vendororders');
        $order->with('user');
        
        $order->where('pay_amount','>',0);
        $order = $order->where('payment_status','Pending');

        if (!empty($request->form)) {
            parse_str($request->form, $form);
        }
        
        $datas = $order->orderBy('id','desc')->get();
        //--- Integrating This Collection Into Datatables
        
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        $sheet->getColumnDimension('A')->setWidth(20);
        $sheet->getColumnDimension('B')->setWidth(20);
        $sheet->getColumnDimension('C')->setWidth(20);
        $sheet->getColumnDimension('D')->setWidth(30);
        $sheet->getColumnDimension('E')->setWidth(20);
        $sheet->getColumnDimension('F')->setWidth(30);
        $sheet->getColumnDimension('G')->setWidth(20);
        $sheet->getColumnDimension('H')->setWidth(20);

        $column_headings = [
            'Vendor',
            'Order No.',
            'Invoice No.',
            'Customer',
            'Payment Amount',
            'Payment Method',
            'Order Date',
            'Payment Status',
        ];

        $column = "A";
        $line = 1;
        foreach ($column_headings as $key => $column_heading) {
            $sheet->setCellValue($column.$line, $column_heading);
            $column++;
        }
        
        $line++;
        
        foreach ($datas as $key => $data) {
            
            $column = "A";
            $vendor_name = '';
            if (isset($data->vendororders[0])) {
                $vendor = User::find($data->vendororders[0]->user_id)->first();
                if (isset($vendor->name)) {
                    $vendor_name = $vendor->name;
                } else {
                    $vendor_name = '';
                }
            }
            $sheet->setCellValue($column.$line, $vendor_name);
            $column++;

            $order_number = $data->order_number;
            $sheet->setCellValue($column.$line, $order_number);
            $column++;

            $invoice_number = sprintf("%'.08d", $data->id);
            $sheet->setCellValue($column.$line, $invoice_number);
            $column++;

            if (isset($data->user->name)) {
                $customer = $data->user->name;
            } else {
                $customer = '';
            }
            $sheet->setCellValue($column.$line, $customer);
            $column++;
            
            $sheet->setCellValue($column.$line, $data->pay_amount);
            $column++;

            $sheet->setCellValue($column.$line, $data->method);
            $column++;

            $sheet->setCellValue($column.$line, date('d-m-Y', strtotime($data->created_at)));
            $column++;

            $sheet->setCellValue($column.$line, ucfirst($data->payment_status));
            $column++;

            $line++;
        }
        
        $writer = new Xlsx($spreadsheet);
        
        $filename = storage_path('app/Payment Report.xlsx');
        
        $writer->save($filename);

        return response()->download($filename);

    }

}
