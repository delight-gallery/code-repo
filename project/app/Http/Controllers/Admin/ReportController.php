<?php

namespace App\Http\Controllers\Admin;

use Datatables;
use Carbon\Carbon;
use App\Models\Order;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;

class ReportController extends Controller
{
	public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function payment()
    {
    	return view('admin.report.payment');
    }

    //*** JSON Request
    public function datatables(Request $request)
    {
         
        $order = new Order;
        
        $order->with('vendororders');
        $order->with('user');
        
        $order->where('pay_amount','>',0);

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

}
