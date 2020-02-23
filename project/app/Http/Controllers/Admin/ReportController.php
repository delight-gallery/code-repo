<?php

namespace App\Http\Controllers\Admin;

use Datatables;
use Carbon\Carbon;
use App\Models\Order;
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
        	
        $order->where('pay_amount','>',0);

        $datas = $order->orderBy('id','desc')->get();
         //--- Integrating This Collection Into Datatables
         return Datatables::of($datas)
                            ->editColumn('order_number', function(Order $data) {
                                return $data->order_number;
                            })
                            ->editColumn('pay_amount', function(Order $data) {
                                return  $data->pay_amount;
                            })
                            ->editColumn('method', function(Order $data) {
                                return $data->method;
                            })
                            ->editColumn('created_at', function(Order $data) {
                                return $data->method;
                            })
                            ->editColumn('payment_status', function(Order $data) {
                                return $data->method;
                            })
                            // ->rawColumns(['id', 'status', 'action'])
                            ->toJson(); //--- Returning Json Data To Client Side
    }

}
