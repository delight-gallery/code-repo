<?php

namespace App\Http\Controllers\Vendor;

use Datatables;
use App\Models\Service;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Validator;
use Auth;
use App\Models\Pincode;
use App\Models\GroupPincode;


class PincodeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    //*** JSON Request
    public function datatables()
    {
        $groupPincode = new GroupPincode;
        
        $datas = $groupPincode->orderBy('id','desc')->get();
        //--- Integrating This Collection Into Datatables
        return Datatables::of($datas)
                            ->addColumn('action', function(GroupPincode $data) {
                                return '<div class="action-list"><a data-href="' . route('vendor-pincode-edit',$data->id). '" class="edit" data-toggle="modal" data-target="#modal1"> <i class="fas fa-edit"></i>Edit</a><a href="javascript:;" data-href="' . route('vendor-pincode-delete',$data->id) . '" data-toggle="modal" data-target="#confirm-delete" class="delete"><i class="fas fa-trash-alt"></i>Delete</a></div>';
                            })
                            ->toJson(); //--- Returning Json Data To Client Side
    }

    //*** GET Request
    public function index()
    {
        return view('vendor.pincode.index');
    }

    //*** GET Request
    public function create()
    {
        $pincodes = Pincode::all();
        return view('vendor.pincode.create',compact('pincodes'));
    }

    //*** POST Request
    public function store(Request $request)
    {
        //--- Validation Section
        $rules = [
            'pincodes' => 'required',
            'group_name' => 'required',
            'shipping_cost' => 'required'
        ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends
        if (!empty($request->id)) {
            $groupPincode = GroupPincode::find($request->id);
            $msg = 'Successfully updated pincode group';
        } else {
            $groupPincode = new GroupPincode();
            $msg = 'Successfully added pincode group';
        }
        
        $groupPincode->pincodes = implode(",", $request->pincodes);
        $groupPincode->group_name = $request->group_name;
        $groupPincode->shipping_cost = $request->shipping_cost;
        $groupPincode->user_id = Auth::user()->id;
        $groupPincode->save();

        
        return response()->json($msg); 
    }

    //*** GET Request
    public function edit($id)
    {
        $pincodes = Pincode::all();
        $data = GroupPincode::findOrFail($id);
        $data->pincodes = explode(",", $data->pincodes);
        return view('vendor.pincode.edit',compact('data','pincodes'));
    }


    //*** GET Request Delete
    public function destroy($id)
    {
        $data = GroupPincode::findOrFail($id);
        
        $data->delete();
        //--- Redirect Section     
        $msg = 'Data Deleted Successfully.';
        return response()->json($msg);      
        //--- Redirect Section Ends     
    }

}
