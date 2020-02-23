<?php

namespace App\Http\Controllers\Admin;

use Datatables;
use App\Classes\GeniusMailer;
use App\Models\Order;
use App\Models\User;
use App\Models\VendorOrder;
use App\Models\Generalsetting;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    //*** JSON Request
    public function datatables(Request $request,$status)
    {
        $order = new Order;

        // $form = array();
        if (!empty($request->form)) {
            parse_str($request->form, $form);
        }
        if (!empty($form['vendor'])) {
            $order = $order->whereHas('vendororders.user', function ($query) use ($form) {
                $query->where('users.name', 'like', "%{$form['vendor']}%");
            });
        }
        if (!empty($form['status'])) {
            $order = $order->where('status', 'like', "%{$form['status']}%");
        }
        if (!empty($form['orderfromdate']) && empty($form['ordertodate'])) {
            $order = $order->whereDate('created_at', '=', date('Y-m-d',strtotime($form['orderfromdate'])));
        } else if (!empty($form['orderfromdate']) && !empty($form['ordertodate'])) {
            $order = $order->whereDate('created_at', '>=', date('Y-m-d',strtotime($form['orderfromdate'])));
            $order = $order->whereDate('created_at', '<', date('Y-m-d',strtotime($form['ordertodate'])));
        }
        if (!empty($form['customer'])) {
            $order = $order->whereHas('user', function ($query) use ($form) {
                $query->where('name', 'like', "%{$form['customer']}%");
            });
        }
        if (!empty($form['invoiceno'])) {
            $form['invoiceno'] = (int)$form['invoiceno'];
            $order = $order->where('id', '=', $form['invoiceno']);
        }
        
        if($status == 'pending'){
            $datas = Order::where('status','=','pending')->get();
        }
        elseif($status == 'processing') {
            $datas = Order::where('status','=','processing')->get();
        }
        elseif($status == 'completed') {
            $datas = Order::where('status','=','completed')->get();
        }
        elseif($status == 'declined') {
            $datas = Order::where('status','=','declined')->get();
        }
        else{
            $datas = $order->orderBy('id','desc')->get();  
        }
         
         //--- Integrating This Collection Into Datatables
         return Datatables::of($datas)
                            ->editColumn('id', function(Order $data) {
                                $id = '<a href="'.route('admin-order-invoice',$data->id).'">'.sprintf("%'.08d", $data->id).'</a>';
                                return $id;
                            })
                            ->editColumn('pay_amount', function(Order $data) {
                                return $data->currency_sign . round($data->pay_amount * $data->currency_value , 2);
                            })
                            ->addColumn('action', function(Order $data) {
                                $class = strtolower($data->status);
                                $pending = $data->status == 'pending' ? 'selected' : '';
                                $processing = $data->status == 'processing' ? 'selected' : '';
                                $completed = $data->status == 'completed' ? 'selected' : '';
                                $declined = $data->status == 'declined' ? 'selected' : '';
                                $orders = '<select class="process select data-droplinks '.$class.'">'.
'<option value="'. route('admin-order-status',['id1' => $data->id, 'status' => 'pending']).'" '.$pending.'>Pending</option>'.
'<option value="'. route('admin-order-status',['id1' => $data->id, 'status' => 'processing']).'" '.$processing.'>Processing</option>'.
'<option value="'. route('admin-order-status',['id1' => $data->id, 'status' => 'completed']).'" '.$completed.'>Completed</option>'.
'<option value="'. route('admin-order-status',['id1' => $data->id, 'status' => 'declined']).'" '.$declined.'>Cancelled</option>'.'</select>';


                                // $status = $data->status == 'pending' ? 'Pending' : '';
                                // $status = $data->status == 'processing' ? 'Processing' : '';
                                // $status = $data->status == 'completed' ? 'Completed' : '';
                                // $status = $data->status == 'declined' ? 'Cancelled' : '';

                                // $orders = '&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:12px; background:red;color:#fff; padding:1%;font-weight:700;">'.$status.'</span>';

                                return '<div class="action-list"><a href="' . route('admin-order-show',$data->id) . '" > <i class="fas fa-eye"></i> Details</a><a href="javascript:;" class="send" data-email="'. $data->customer_email .'" data-toggle="modal" data-target="#vendorform"><i class="fas fa-envelope"></i> Notify </a>'.$orders.'</div>';
                            }) 
                            ->rawColumns(['id','action'])
                            ->toJson(); //--- Returning Json Data To Client Side
    }
    public function index()
    {
        $categories = \App\Models\Category::all();
        return view('admin.order.index', compact('categories'));
    }
    public function pending()
    {
        return view('admin.order.pending');
    }
    public function processing()
    {
        return view('admin.order.processing');
    }
    public function completed()
    {
        return view('admin.order.completed');
    }
    public function declined()
    {
        return view('admin.order.declined');
    }
    public function show($id)
    {
        $order = Order::findOrFail($id);
        $cart = unserialize(bzdecompress(utf8_decode($order->cart)));
        return view('admin.order.details',compact('order','cart'));
    }
    public function invoice($id)
    {
        $order = Order::findOrFail($id);
        $cart = unserialize(bzdecompress(utf8_decode($order->cart)));
        return view('admin.order.invoice',compact('order','cart'));
    }
    public function emailsub(Request $request)
    {
        $gs = Generalsetting::findOrFail(1);
        if($gs->is_smtp == 1)
        {
            $data = [
                    'to' => $request->to,
                    'subject' => $request->subject,
                    'body' => $request->message,
            ];

            $mailer = new GeniusMailer();
            $mailer->sendCustomMail($data);                
        }
        else
        {
            $data = 0;
            $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
            $mail = mail($request->to,$request->subject,$request->message,$headers);
            if($mail) {   
                $data = 1;
            }
        }

        return response()->json($data);
    }

    public function printpage($id)
    {
        $order = Order::findOrFail($id);
        $cart = unserialize(bzdecompress(utf8_decode($order->cart)));
        return view('admin.order.print',compact('order','cart'));
    }

    public function license(Request $request, $id)
    {
        $order = Order::findOrFail($id);
        $cart = unserialize(bzdecompress(utf8_decode($order->cart)));
        $cart->items[$request->license_key]['license'] = $request->license;
        $order->cart = utf8_encode(bzcompress(serialize($cart), 9));
        $order->update();       
        $msg = 'Successfully Changed The License Key.';
        return response()->json($msg);
    }

    public function status($id,$status)
    {
        $mainorder = Order::findOrFail($id);
        if ($mainorder->status == "completed"){
        //--- Redirect Section        
        $data[0] = 'Order Status Updated Successfully';
        $data[1] = 'completed';
        return response()->json($data);      
        //--- Redirect Section Ends   

        }else{
        if ($status == "completed"){

            foreach($mainorder->vendororders as $vorder)
            {
                $uprice = User::findOrFail($vorder->user_id);
                $uprice->current_balance = $uprice->current_balance + $vorder->price;
                $uprice->update();
            }

            $gs = Generalsetting::findOrFail(1);
            if($gs->is_smtp == 1)
            {
                $data = [
                    'to' => $mainorder->customer_email,
                    'subject' => 'Your order '.$mainorder->order_number.' is Confirmed!',
                    'body' => "Hello ".$mainorder->customer_name.","."\n Thank you for shopping with us. We are looking forward to your next visit.",
                ];

                $mailer = new GeniusMailer();
                $mailer->sendCustomMail($data);                
            }
            else
            {
               $to = $mainorder->customer_email;
               $subject = 'Your order '.$mainorder->order_number.' is Confirmed!';
               $msg = "Hello ".$mainorder->customer_name.","."\n Thank you for shopping with us. We are looking forward to your next visit.";
            $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
               mail($to,$subject,$msg,$headers);                
            }
        }
        if ($status == "declined"){
            $gs = Generalsetting::findOrFail(1);
            if($gs->is_smtp == 1)
            {
                $data = [
                    'to' => $mainorder->customer_email,
                    'subject' => 'Your order '.$mainorder->order_number.' is Cancelled!',
                    'body' => "Hello ".$mainorder->customer_name.","."\n We are sorry for the inconvenience caused. We are looking forward to your next visit.",
                ];
            $mailer = new GeniusMailer();
            $mailer->sendCustomMail($data);
            }
            else
            {
               $to = $mainorder->customer_email;
               $subject = 'Your order '.$mainorder->order_number.' is Cancelled!';
               $msg = "Hello ".$mainorder->customer_name.","."\n We are sorry for the inconvenience caused. We are looking forward to your next visit.";
            $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
               mail($to,$subject,$msg,$headers);
            }

        }
        $stat['status'] = $status;
        $stat['payment_status'] = ucfirst($status);
        $order = VendorOrder::where('order_id','=',$id)->update(['status' => $status]);
        $mainorder->update($stat);
        //--- Redirect Section        
        $data[0] = 'Order Status Updated Successfully';
        $data[1] = strtolower($status);
        return response()->json($data);      
        //--- Redirect Section Ends    

        }
    }
}