<?php

namespace App\Http\Controllers\Admin;

use Datatables;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Generalsetting;
use App\Models\User;
use App\Classes\GeniusMailer;
use App\Models\Notification;
use App\Models\Withdraw;
use App\Models\Currency;
use App\Models\UserSubscription;
use Illuminate\Support\Facades\Input;
use Validator;

class VendorController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

	    //*** JSON Request
	    public function datatables(Request $request)
	    {
            $form = array();
            if (!empty($request->form)) {
                parse_str($request->form, $form);
            }
            if (isset($form['status']) && ($form['status'] == '2' || $form['status'] == '1')) {
                $datas = User::where('is_vendor','=',$form['status'])->orderBy('id','desc')->get();
            } else {
	            $datas = User::where('is_vendor','=',2)->orWhere('is_vendor','=',1)->orderBy('id','desc')->get();
            }
	         //--- Integrating This Collection Into Datatables
	         return Datatables::of($datas)
                                ->addColumn('status', function(User $data) {
                                    $class = $data->is_vendor == 2 ? 'drop-success' : 'drop-danger';
                                    $s = $data->is_vendor == 2 ? 'selected' : '';
                                    $ns = $data->is_vendor == 1 ? 'selected' : '';
                                    return '<div class="action-list"><select class="process select vendor-droplinks '.$class.'">'.
                '<option value="'. route('admin-vendor-st',['id1' => $data->id, 'id2' => 2]).'" '.$s.'>Activated</option>'.
                '<option value="'. route('admin-vendor-st',['id1' => $data->id, 'id2' => 1]).'" '.$ns.'>Deactivated</option></select></div>';
                                }) 
	                            ->addColumn('action', function(User $data) {
	                                return '<div class="action-list"><a href="' . route('admin-vendor-show',$data->id) . '" > <i class="fas fa-eye"></i> Details</a><a data-href="' . route('admin-vendor-edit',$data->id) . '" class="edit" data-toggle="modal" data-target="#modal1"> <i class="fas fa-edit"></i>Edit</a><a href="javascript:;" class="send" data-email="'. $data->email .'" data-toggle="modal" data-target="#vendorform"><i class="fas fa-envelope"></i> Notify</a><a href="javascript:;" data-href="' . route('admin-vendor-delete',$data->id) . '" data-toggle="modal" data-target="#confirm-delete" class="delete"><i class="fas fa-trash-alt"></i></a></div>';
	                            }) 
	                            ->rawColumns(['status','action'])
	                            ->toJson(); //--- Returning Json Data To Client Side
	    }

	//*** GET Request
    public function index()
    {
        return view('admin.vendor.index');
    }


    //*** GET Request
    public function subsdatatables()
    {
         $datas = UserSubscription::where('status','=',1)->orderBy('id','desc')->get();
         //--- Integrating This Collection Into Datatables
         return Datatables::of($datas)
                            ->addColumn('name', function(UserSubscription $data) {
                                $name = isset($data->user->owner_name) ? $data->user->owner_name : 'Removed';
                                return  $name;
                            })

                            ->editColumn('txnid', function(UserSubscription $data) {
                                $txnid = $data->txnid == null ? 'Free' : $data->txnid;
                                return $txnid;
                            }) 
                            ->editColumn('created_at', function(UserSubscription $data) {
                                $date = $data->created_at->diffForHumans();
                                return $date;
                            }) 
                            ->addColumn('action', function(UserSubscription $data) {
                                return '<div class="action-list"><a data-href="' . route('admin-vendor-sub',$data->id) . '" class="view details-width" data-toggle="modal" data-target="#modal1"> <i class="fas fa-eye"></i>Details</a></div>';
                            }) 
                            ->rawColumns(['action'])
                            ->toJson(); //--- Returning Json Data To Client Side


    }


	//*** GET Request
    public function subs()
    {

        return view('admin.vendor.subscriptions');
    }

	//*** GET Request
    public function sub($id)
    {
        $subs = UserSubscription::findOrFail($id);
        return view('admin.vendor.subscription-details',compact('subs'));
    }

	//*** GET Request
  	public function status($id1,$id2)
    {
        $user = User::findOrFail($id1);
        $user->is_vendor = $id2;
        $user->update();
        //--- Redirect Section        
        $msg[0] = 'Status Updated Successfully.';
        return response()->json($msg);      
        //--- Redirect Section Ends    

    }

    public function create()
    {
        return view('admin.vendor.create');
    }

	//*** GET Request
    public function edit($id)
    {
        $data = User::findOrFail($id);
        return view('admin.vendor.edit',compact('data'));
    }

	//*** POST Request
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'shop_name'   => 'unique:users,shop_name,'.$id,
           ],[ 
             'shop_name.unique' => 'Shop Name "'.$request->shop_name.'" has already been taken. Please choose another name.'
           ]);
        $user = User::findOrFail($id);
        $data = $request->all();
        $user->update($data);
        $msg = 'Vendor Information Updated Successfully.';
        return response()->json($msg);   
    }

    public function store(Request $request)
    {
        $rules = [
                'name'   => 'required|unique:users',
                'email'   => 'required|email|unique:users'
                ];
        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

            $gs = Generalsetting::findOrFail(1);
            $user = new User;
            $input = $request->all();        
            $input['password'] = bcrypt($request->phone);
            $token = md5(time().$request->name.$request->email);
            $input['verification_link'] = $token;
            $input['affilate_code'] = md5($request->name.$request->email);
            $input['status'] =1;
            $user->fill($input)->save();

              if(!empty($request->vendor))
              {
                $user->is_vendor = 1;
                $user->update();
              }

            if($gs->is_verification_email == 0)
            {
            $user->email_verified = 'Yes';
            $user->update();
            $notification = new Notification;
            $notification->user_id = $user->id;
            $notification->save();
             $msg = 'New Data Added Successfully.';
            return response()->json($msg);    
            
            }
            else {
            $to = $request->email;
            $subject = 'Verify your email address.';
            $msg = "Dear Customer,<br> We noticed that you need to verify your email address. <a href=".url('user/register/verify/'.$token).">Simply click here to verify. </a>";
            //Sending Email To Customer
            if($gs->is_smtp == 1)
            {
            $data = [
                'to' => $to,
                'subject' => $subject,
                'body' => $msg,
            ];

            $mailer = new GeniusMailer();
            $mailer->sendCustomMail($data);
            }
            else
            {
            $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
            mail($to,$subject,$msg,$headers);
            }
            return response()->json('We need to verify your email address. We have sent an email to '.$to.' to verify your email address. Please click link in that email to continue.');
            }   
        //--- Redirect Section Ends    
    }


	//*** GET Request
    public function show($id)
    {
        $data = User::findOrFail($id);
        return view('admin.vendor.show',compact('data'));
    }
    
	//*** GET Request
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->is_vendor = 0;
            $user->is_vendor = 0;
            $user->shop_name = null;
            $user->shop_details= null;
            $user->owner_name = null;
            $user->shop_number = null;
            $user->shop_address = null;
            $user->reg_number = null;
            $user->shop_message = null;
        $user->update();
        if($user->notivications->count() > 0)
        {
            foreach ($user->notivications as $gal) {
                $gal->delete();
            }
        }
            //--- Redirect Section     
            $msg = 'Vendor Deleted Successfully.';
            return response()->json($msg);      
            //--- Redirect Section Ends    
    }

        //*** JSON Request
        public function withdrawdatatables()
        {
             $datas = Withdraw::where('type','=','vendor')->orderBy('id','desc')->get();
             //--- Integrating This Collection Into Datatables
             return Datatables::of($datas)
                                ->addColumn('name', function(Withdraw $data) {
                                    $name = $data->user->name;
                                    return '<a href="' . route('admin-vendor-show',$data->user->id) . '" target="_blank">'. $name .'</a>';
                                }) 
                                ->addColumn('email', function(Withdraw $data) {
                                    $email = $data->user->email;
                                    return $email;
                                }) 
                                ->addColumn('phone', function(Withdraw $data) {
                                    $phone = $data->user->phone;
                                    return $phone;
                                }) 
                                ->editColumn('status', function(Withdraw $data) {
                                    $status = ucfirst($data->status);
                                    return $status;
                                }) 
                                ->editColumn('amount', function(Withdraw $data) {
                                    $sign = Currency::where('is_default','=',1)->first();
                                    $amount = $sign->sign.round($data->amount * $sign->value , 2);
                                    return $amount;
                                }) 
                                ->addColumn('action', function(Withdraw $data) {
                                    $action = '<div class="action-list"><a data-href="' . route('admin-vendor-withdraw-show',$data->id) . '" class="view details-width" data-toggle="modal" data-target="#modal1"> <i class="fas fa-eye"></i> Details</a>';
                                    if($data->status == "pending") {
                                    $action .= '<a data-href="' . route('admin-vendor-withdraw-accept',$data->id) . '" data-toggle="modal" data-target="#confirm-delete"> <i class="fas fa-check"></i> Accept</a><a data-href="' . route('admin-vendor-withdraw-reject',$data->id) . '" data-toggle="modal" data-target="#confirm-delete1"> <i class="fas fa-trash-alt"></i> Reject</a>';
                                    }
                                    $action .= '</div>';
                                    return $action;
                                }) 
                                ->rawColumns(['name','action'])
                                ->toJson(); //--- Returning Json Data To Client Side
        }

        //*** GET Request
        public function withdraws()
        {
            return view('admin.vendor.withdraws');
        }

        //*** GET Request       
        public function withdrawdetails($id)
        {
            $sign = Currency::where('is_default','=',1)->first();
            $withdraw = Withdraw::findOrFail($id);
            return view('admin.vendor.withdraw-details',compact('withdraw','sign'));
        }

        //*** GET Request   
        public function accept($id)
        {
            $withdraw = Withdraw::findOrFail($id);
            $data['status'] = "completed";
            $withdraw->update($data);
            //--- Redirect Section     
            $msg = 'Withdraw Accepted Successfully.';
            return response()->json($msg);      
            //--- Redirect Section Ends   
        }

        //*** GET Request   
        public function reject($id)
        {
            $withdraw = Withdraw::findOrFail($id);
            $account = User::findOrFail($withdraw->user->id);
            $account->affilate_income = $account->affilate_income + $withdraw->amount + $withdraw->fee;
            $account->update();
            $data['status'] = "rejected";
            $withdraw->update($data);
            //--- Redirect Section     
            $msg = 'Withdraw Rejected Successfully.';
            return response()->json($msg);      
            //--- Redirect Section Ends   
        }

        public function exists(Request $request)
        {
            if (!empty($request->name)) {
                if (User::where('name','=',$request->name)->exists()) {
                    return response()->json(false);
                } else {
                    return response()->json(true);
                }
            }
        }

}
