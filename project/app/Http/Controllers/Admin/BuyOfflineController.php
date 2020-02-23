<?php

namespace App\Http\Controllers\Admin;
use App\Classes\GeniusMailer;
use Datatables;
use Carbon\Carbon;
use App\Models\Product;
use App\Models\Category;
use App\Models\Currency;
use App\Models\Gallery;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Validator;
use Image;
use Session;
use App\Models\Carts;
use App\Models\Order;
use App\Models\Coupon;
use App\Models\Generalsetting;
use App\Models\PaymentGateway;
use App\Models\Pickup;
use App\Models\User;
use App\Models\Notification;
use App\Models\VendorOrder;
use App\Models\UserNotification;
use Auth;

class BuyOfflineController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    //*** JSON Request
    public function datatables()
    {
         $datas = Product::orderBy('id','desc')->get()->where('user_id','=',0);
         
         //--- Integrating This Collection Into Datatables
         return Datatables::of($datas)
                            ->editColumn('name', function(Product $data) {
                                $name = strlen(strip_tags($data->name)) > 50 ? substr(strip_tags($data->name),0,50).'...' : strip_tags($data->name);
                                $id = '<small>Product ID: <a href="'.route('front.product', $data->slug).'" target="_blank">'.sprintf("%'.08d",$data->id).'</a></small>';
                                return  $name.'<br>'.$id;
                            })
                            ->editColumn('price', function(Product $data) {
                                $sign = Currency::where('is_default','=',1)->first();
                                $price = $sign->sign.$data->price;
                                return  $price;
                            })
                            ->editColumn('stock', function(Product $data) {
                                $stck = (string)$data->stock;
                                if($stck == "0")
                                return "Out Of Stock";
                                elseif($stck == null)
                                return "Unlimited";
                                else
                                return $data->stock;
                            })
                            ->addColumn('status', function(Product $data) {
                                $class = $data->status == 1 ? 'drop-success' : 'drop-danger';
                                $s = $data->status == 1 ? 'selected' : '';
                                $ns = $data->status == 0 ? 'selected' : '';
                                return '<div class="action-list"><select class="process select droplinks '.$class.'"><option data-val="1" value="'. route('admin-prod-status',['id1' => $data->id, 'id2' => 1]).'" '.$s.'>Activated</option><<option data-val="0" value="'. route('admin-prod-status',['id1' => $data->id, 'id2' => 0]).'" '.$ns.'>Deactivated</option>/select></div>';
                            })                             
                            ->addColumn('action', function(Product $data) {
                                return '<div class="action-list"><a href="' . route('admin-buy-now', $data->id) . '" target="_blank"> <i class="fas fa-edit"></i>Buy  Now</a></div>';
                            })
                            ->rawColumns(['name', 'status', 'action'])
                            ->toJson(); //--- Returning Json Data To Client Side
    }

    //*** JSON Request
    public function deactivedatatables()
    {
         $datas = Product::where('status','=',0)->orderBy('id','desc')->get();
         
         //--- Integrating This Collection Into Datatables
         return Datatables::of($datas)
                            ->editColumn('name', function(Product $data) {
                                $name = strlen(strip_tags($data->name)) > 50 ? substr(strip_tags($data->name),0,50).'...' : strip_tags($data->name);
                                $id = '<small>Product ID: <a href="'.route('front.product', $data->slug).'" target="_blank">'.sprintf("%'.08d",$data->id).'</a></small>';
                                return  $name.'<br>'.$id;
                            })
                            ->editColumn('price', function(Product $data) {
                                $sign = Currency::where('is_default','=',1)->first();
                                $price = $sign->sign.$data->price;
                                return  $price;
                            })
                            ->editColumn('stock', function(Product $data) {
                                $stck = (string)$data->stock;
                                if($stck == "0")
                                return "Out Of Stock";
                                elseif($stck == null)
                                return "Unlimited";
                                else
                                return $data->stock;
                            })
                            ->addColumn('status', function(Product $data) {
                                $class = $data->status == 1 ? 'drop-success' : 'drop-danger';
                                $s = $data->status == 1 ? 'selected' : '';
                                $ns = $data->status == 0 ? 'selected' : '';
                                return '<div class="action-list"><select class="process select droplinks '.$class.'"><option data-val="1" value="'. route('admin-prod-status',['id1' => $data->id, 'id2' => 1]).'" '.$s.'>Activated</option><<option data-val="0" value="'. route('admin-prod-status',['id1' => $data->id, 'id2' => 0]).'" '.$ns.'>Deactivated</option>/select></div>';
                            })                             
                            ->addColumn('action', function(Product $data) {
                                return '<div class="action-list"><a href="' . route('admin-prod-edit',$data->id) . '"> <i class="fas fa-edit"></i>Edit</a><a href="javascript" class="set-gallery" data-toggle="modal" data-target="#setgallery"><input type="hidden" value="'.$data->id.'"><i class="fas fa-eye"></i> View Gallery</a><a data-href="' . route('admin-prod-feature',$data->id) . '" class="feature" data-toggle="modal" data-target="#modal2"> <i class="fas fa-star"></i>Highlight</a><a href="javascript:;" data-href="' . route('admin-prod-delete',$data->id) . '" data-toggle="modal" data-target="#confirm-delete" class="delete"><i class="fas fa-trash-alt"></i></a></div>';
                            }) 
                            ->rawColumns(['name', 'status', 'action'])
                            ->toJson(); //--- Returning Json Data To Client Side
    }

    //*** GET Request
    public function index()
    {
        return view('admin.buyoffline.index');
    }

    //*** GET Request
    public function deactive()
    {
        return view('admin.product.deactive');
    }

    //*** GET Request
    public function types()
    {
        return view('admin.product.types');
    }

    //*** GET Request
    public function createPhysical()
    {
        $cats = Category::all();
        $sign = Currency::where('is_default','=',1)->first();
        return view('admin.product.create.physical',compact('cats','sign'));
    }

    //*** GET Request
    public function createDigital()
    {
        $cats = Category::all();
        $sign = Currency::where('is_default','=',1)->first();
        return view('admin.product.create.digital',compact('cats','sign'));
    }

    //*** GET Request
    public function createLicense()
    {
        $cats = Category::all();
        $sign = Currency::where('is_default','=',1)->first();
        return view('admin.product.create.license',compact('cats','sign'));
    }

    //*** GET Request
    public function status($id1,$id2)
    {
        $data = Product::findOrFail($id1);
        $data->status = $id2;
        $data->update();
    }

    //*** POST Request
    public function uploadUpdate(Request $request,$id)
    {
        //--- Validation Section
        $rules = [
          'image' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }

        $data = Product::findOrFail($id);

        //--- Validation Section Ends
        $image = $request->image;
        list($type, $image) = explode(';', $image);
        list(, $image)      = explode(',', $image);
        $image = base64_decode($image);
        $image_name = time().str_random(8).'.png';
        $path = 'assets/images/products/'.$image_name;
        file_put_contents($path, $image);
                if($data->photo != null)
                {
                    if (file_exists(public_path().'/assets/images/products/'.$data->photo)) {
                        unlink(public_path().'/assets/images/products/'.$data->photo);
                    }
                } 
                        $input['photo'] = $image_name;
         $data->update($input);
                if($data->thumbnail != null)
                {
                    if (file_exists(public_path().'/assets/images/thumbnails/'.$data->thumbnail)) {
                        unlink(public_path().'/assets/images/thumbnails/'.$data->thumbnail);
                    }
                } 

        $img = Image::make(public_path().'/assets/images/products/'.$data->photo)->resize(285, 285);
        $thumbnail = time().str_random(8).'.jpg';
        $img->save(public_path().'/assets/images/thumbnails/'.$thumbnail);
        $data->thumbnail  = $thumbnail;   
        $data->update();
        return response()->json(['status'=>true,'file_name' => $image_name]);
    }

    //*** POST Request
    public function store(Request $request)
    {
        //--- Validation Section
        $rules = [
               'photo'      => 'required',
               'file'       => 'mimes:zip'
                ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        //--- Logic Section        
            $data = new Product;
            $sign = Currency::where('is_default','=',1)->first();
            $input = $request->all();

            // Check File
            if ($file = $request->file('file')) 
            {              
                $name = time().$file->getClientOriginalName();
                $file->move('assets/files',$name);           
                $input['file'] = $name;
            } 

            $image = $request->photo;
            list($type, $image) = explode(';', $image);
            list(, $image)      = explode(',', $image);
            $image = base64_decode($image);
            $image_name = time().str_random(8).'.png';
            $path = 'assets/images/products/'.$image_name;
            file_put_contents($path, $image);
            $input['photo'] = $image_name;


            // Check Physical
            if($request->type == "Physical")
            {
            // Check Condition
            if ($request->product_condition_check == ""){
                $input['product_condition'] = 0;
            }

            // Check Shipping Time
            if ($request->shipping_time_check == ""){
                $input['ship'] = null;
            } 

            // Check Size
            if(empty($request->size_check ))
            {
                $input['size'] = null;
                $input['size_qty'] = null;
                $input['size_price'] = null;
            }
            else{
                    if(in_array(null, $request->size) || in_array(null, $request->size_qty))
                    {
                        $input['size'] = null;
                        $input['size_qty'] = null;
                        $input['size_price'] = null;
                    }
                    else 
                    {             
                        $input['size'] = implode(',', $request->size); 
                        $input['size_qty'] = implode(',', $request->size_qty);
                        $input['size_price'] = implode(',', $request->size_price);            
                    }
            }

            // Check Color
            if(empty($request->color_check))
            {
                $input['color'] = null;
            }
            else{
                $input['color'] = implode(',', $request->color); 
            }     

            // Check Measurement
            if ($request->mesasure_check == "") 
             {
                $input['measure'] = null;    
             } 

            }

            // Check Seo
        if (empty($request->seo_check)) 
         {
            $input['meta_tag'] = null;
            $input['meta_description'] = null;         
         }  
         else {
        if (!empty($request->meta_tag)) 
         {
            $input['meta_tag'] = implode(',', $request->meta_tag);       
         }              
         } 

             // Check License

            if($request->type == "License")
            {

                if(in_array(null, $request->license) || in_array(null, $request->license_qty))
                {
                    $input['license'] = null;  
                    $input['license_qty'] = null;
                }
                else 
                {             
                    $input['license'] = implode(',,', $request->license);  
                    $input['license_qty'] = implode(',', $request->license_qty);                 
                }

            }

             // Check Features
            if(in_array(null, $request->features) || in_array(null, $request->colors))
            {
                $input['features'] = null;  
                $input['colors'] = null;
            }
            else 
            {             
                $input['features'] = implode(',', str_replace(',',' ',$request->features));  
                $input['colors'] = implode(',', str_replace(',',' ',$request->colors));                 
            }

            //tags 
            if (!empty($request->tags)) 
             {
                $input['tags'] = implode(',', $request->tags);       
             }  



            // Conert Price According to Currency
             $input['price'] = ($input['price'] / $sign->value);
             $input['previous_price'] = ($input['previous_price'] / $sign->value);    

            // Save Data 
                $data->fill($input)->save();

            // Set SLug
                $prod = Product::find($data->id);
                $prod->slug = str_slug($data->name,'-').'-'.strtolower(str_random(3).$data->id.str_random(3));
            // Set Thumbnail  
                $img = Image::make(public_path().'/assets/images/products/'.$prod->photo)->resize(285, 285);
                $thumbnail = time().str_random(8).'.jpg';
                $img->save(public_path().'/assets/images/thumbnails/'.$thumbnail);
                $prod->thumbnail  = $thumbnail;   
                $prod->update();

            // Add To Gallery If any
                $lastid = $data->id;
                if ($files = $request->file('gallery')){
                    foreach ($files as  $key => $file){
                        if(in_array($key, $request->galval))
                        {
                            $gallery = new Gallery;
                            $name = time().$file->getClientOriginalName();
                            $file->move('assets/images/galleries',$name);
                            $gallery['photo'] = $name;
                            $gallery['product_id'] = $lastid;
                            $gallery->save();
                        }
                    }
                }
        //logic Section Ends

        //--- Redirect Section        
        $msg = 'New Product Added Successfully.<a href="'.route('admin-prod-index').'">View Product Lists.</a>';
        return response()->json($msg);      
        //--- Redirect Section Ends    
    }

 
    //*** GET Request
    public function Buy(Request $request,$id)
    {
        //Session::forget('carts');
        $cats = Category::all();
        $data = Product::findOrFail($id);
        $sign = Currency::where('is_default','=',1)->first();
        //newly added code
        $prod = Product::where('id','=',$id)->first(['id','user_id','slug','name','photo','size','size_qty','size_price','color','price','stock','type','file','link','license','license_qty','measure']);
        if(!empty($prod->license_qty))
        {
        $lcheck = 1;
            foreach($prod->license_qty as $ttl => $dtl)
            {
                if($dtl < 1)
                {
                    $lcheck = 0;
                }
                else
                {
                    $lcheck = 1;
                    break;
                }                    
            }
                if($lcheck == 0)
                {
                    return 0;            
                }
        }
        $size = '';
        if(!empty($prod->size))
        { 
        $size = $prod->size[0];
        }  

        if($prod->user_id != 0){
        $gs = Generalsetting::findOrFail(1);
        $prc = $prod->price + $gs->fixed_commission + ($prod->price/100) * $gs->percentage_commission ;
        $prod->price = round($prc,2);
        }

        $oldcarts = Session::has('carts') ? Session::get('carts') : null;
        
        if (Auth::user()->isAdmin()) {
            $carts = new carts(null);
        } else {
            $carts = new carts($oldcarts);    
        }
       
        //echo "<pre>";
       // print_r($carts->item['id']);die;
       // if(!$carts->items){
        $qty = 0;
        if (isset($request->qty) && !empty($request->qty)) {
            $qty = $request->qty;
        }
        
        $carts->add($prod, $prod->id,$size,$qty);
       //   }
          // print_r($carts->items[$id.$size]['qty']);
        
        if($carts->items[$id.$size]['dp'] == 1)
        {
            return 'digital';
        }
        if($carts->items[$id.$size]['stock'] < 0)
        {
            return 0;
        }
        if(!empty($carts->items[$id.$size]['size_qty']))
        {
            if($carts->items[$id.$size]['qty'] > $carts->items[$id.$size]['size_qty'])
            {
                return 0;
            }
        }
        Session::put('carts',$carts);

        
           
        $gs = Generalsetting::findOrFail(1);
        $dp = 1;
            if (Session::has('currency')) 
            {
              $curr = Currency::find(Session::get('currency'));
            }
            else
            {
                $curr = Currency::where('is_default','=',1)->first();
            }

// If guest checkout is activated then user can go for checkout
            if($gs->guest_checkout == 1)
              {
                $gateways =  PaymentGateway::where('status','=',1)->get();
                $pickups = Pickup::all();
                $oldcarts = Session::get('carts');
                $carts = new carts($oldcarts);
                $products = $carts->items;
                if($gs->multiple_shipping == 1)
                {
                    $user = null;
                    foreach ($carts->items as $prod) {
                            $user[] = $prod['item']['user_id'];
                    }
                    $ship  = 0;
                    $users = array_unique($user);
                    if(!empty($users))
                    {
                       foreach ($users as $user) {
                        if($user != 0){
                              $nship = User::findOrFail($user);
                                 $ship += $nship->shipping_cost;
                        }
                        else {
                             $ship  += $gs->ship;
                        }

                       }
                    }

                }
                else{
                $ship  = $gs->ship;
                }
                foreach ($products as $prod) {
                    if($prod['item']['type'] == 'Physical')
                    {
                        $dp = 0;
                        break;
                    }
                }
                if($dp == 1)
                {
                $ship  = 0;                    
                }
                $total = $carts->totalPrice;
                $coupon = Session::has('coupon') ? Session::get('coupon') : 0;
                if($gs->tax != 0)
                {
                    $tax = ($total / 100) * $gs->tax;
                    $total = $total + $tax;
                }
                if(!Session::has('coupon_total'))
                {
                $total = $total - $coupon;     
                $total = $total + $ship;               
                }
                else {
                $total = Session::get('coupon_total');  
                $total =  str_replace($curr->sign,'',$total) + round($ship * $curr->value, 2); 
                }
                foreach ($products as $prod) {
                    if($prod['item']['type'] != 'Physical')
                    {
                        if(!Auth::guard('web')->check())
                        {
                $ck = 1;
        return view('admin.buyoffline.edit.digital', ['products' => $carts->items, 'totalPrice' => $total, 'pickups' => $pickups, 'totalQty' => $carts->totalQty, 'gateways' => $gateways, 'shipping_cost' => $ship, 'checked' => $ck, 'digital' => $dp, 'curr' => $curr]);  
                        }
                    }
                }
        return view('admin.buyoffline.edit.digital', ['products' => $carts->items, 'totalPrice' => $total, 'pickups' => $pickups, 'totalQty' => $carts->totalQty, 'gateways' => $gateways, 'shipping_cost' => $ship, 'digital' => $dp, 'curr' => $curr]);                 
               }

// If guest checkout is Deactivated then display pop up form with proper error message

                    else{
                $gateways =  PaymentGateway::where('status','=',1)->get();
                $pickups = Pickup::all();
                $oldcarts = Session::get('carts');
                $carts = new carts($oldcarts);
                $products = $carts->items;
                if($gs->multiple_shipping == 1)
                {
                    $user = null;
                    foreach ($carts->items as $prod) {
                            $user[] = $prod['item']['user_id'];
                    }
                    $ship  = 0;
                    $users = array_unique($user);
                    if(!empty($users))
                    {
                       foreach ($users as $user) {
                        if($user != 0){
                              $nship = User::findOrFail($user);
                                 $ship += $nship->shipping_cost;
                        }
                        else {
                             $ship  += $gs->ship;
                        }

                       }
                    }

                }
                else{
                $ship  = $gs->ship;
                }
                $total = $carts->totalPrice;
                $coupon = Session::has('coupon') ? Session::get('coupon') : 0;
                if($gs->tax != 0)
                {
                    $tax = ($total / 100) * $gs->tax;
                    $total = $total + $tax;
                }
                if(!Session::has('coupon_total'))
                {
                $total = $total - $coupon;     
                $total = $total + $ship;               
                }
                else {
                $total = Session::get('coupon_total');  
                $total = $total + round($ship * $curr->value, 2); 
                }
                $ck = 1;
        return view('admin.buyoffline.edit.digital', ['products' => $carts->items, 'totalPrice' => $total, 'pickups' => $pickups, 'totalQty' => $carts->totalQty, 'gateways' => $gateways, 'shipping_cost' => $ship, 'checked' => $ck, 'digital' => $dp, 'curr' => $curr]);                 
                    
        }
}

   public function cashondelivery(Request $request)
    {


        if (!Session::has('carts')) {
            return redirect()->route('front.carts')->with('success',"You don't have any product to checkout.");
        }
            if (Session::has('currency')) 
            {
              $curr = Currency::find(Session::get('currency'));
            }
            else
            {
                $curr = Currency::where('is_default','=',1)->first();
            }
        $gs = Generalsetting::findOrFail(1);
        $oldcarts = Session::get('carts');
        $carts = new carts($oldcarts);
        foreach($carts->items as $key => $prod)
        {
        if(!empty($prod['item']['license']) && !empty($prod['item']['license_qty']))
        {
                foreach($prod['item']['license_qty']as $ttl => $dtl)
                {
                    if($dtl != 0)
                    {
                        $dtl--;
                        $produc = Product::findOrFail($prod['item']['id']);
                        $temp = $produc->license_qty;
                        $temp[$ttl] = $dtl;
                        $final = implode(',', $temp);
                        $produc->license_qty = $final;
                        $produc->update();
                        $temp =  $produc->license;
                        $license = $temp[$ttl];
                         $oldcarts = Session::has('carts') ? Session::get('carts') : null;
                         $carts = new carts($oldcarts);
                         $carts->updateLicense($prod['item']['id'],$license);  
                         Session::put('carts',$carts);
                        break;
                    }                    
                }
        }
        }


        $order = new Order;
        $success_url = action('Admin\BuyOfflineController@index');
        $item_name = $gs->title." Order";
        $item_number = str_random(4).time();
        $order['user_id'] = $request->user_id;
        $order['cart'] = utf8_encode(bzcompress(serialize($carts), 9)); 
        $order['totalQty'] = $request->totalQty;
        $order['pay_amount'] = round($request->total / $curr->value, 2);
        $order['method'] = $request->method;
        $order['shipping'] = $request->shipping;
        $order['pickup_location'] = $request->pickup_location;
        $order['customer_email'] = $request->email;
        $order['customer_name'] = $request->name;
        $order['shipping_cost'] = $request->shipping_cost;
        $order['tax'] = $request->tax;
        $order['customer_phone'] = $request->phone;
        $order['order_number'] = str_random(4).time();
        $order['customer_address'] = $request->address;
        $order['customer_country'] = $request->customer_country;
        $order['customer_city'] = $request->city;
        $order['customer_zip'] = $request->zip;
        $order['shipping_email'] = $request->shipping_email;
        $order['shipping_name'] = $request->shipping_name;
        $order['shipping_phone'] = $request->shipping_phone;
        $order['shipping_address'] = $request->shipping_address;
        $order['shipping_country'] = $request->shipping_country;
        $order['shipping_city'] = $request->shipping_city;
        $order['shipping_zip'] = $request->shipping_zip;
        $order['order_note'] = $request->order_notes;
        $order['coupon_code'] = $request->coupon_code;
        $order['coupon_discount'] = $request->coupon_discount;
        $order['dp'] = $request->dp;
        $order['payment_status'] = "Pending";
        $order['currency_sign'] = $curr->sign;
        $order['currency_value'] = $curr->value;

            if (Session::has('affilate')) 
            {
                $val = $request->total / 100;
                $sub = $val * $gs->affilate_charge;
                $user = User::findOrFail(Session::get('affilate'));
                $user->affilate_income += $sub;
                $user->update();
                $order['affilate_user'] = $user->name;
                $order['affilate_charge'] = $sub;
            }


        $order->save();

        $notification = new Notification;
        $notification->order_id = $order->id;
        $notification->save();
                    if($request->coupon_id != "")
                    {
                       $coupon = Coupon::findOrFail($request->coupon_id);
                       $coupon->used++;
                       if($coupon->times != null)
                       {
                            $i = (int)$coupon->times;
                            $i--;
                            $coupon->times = (string)$i;
                       }
                        $coupon->update();

                    }

        foreach($carts->items as $prod)
        {
            $x = (string)$prod['size_qty'];
            if(!empty($x))
            {
                $product = Product::findOrFail($prod['item']['id']);
                $x = (int)$x;
                $x = $x - $prod['qty'];
                $temp = $product->size_qty;
                $temp[$prod['size_key']] = $x;
                $temp1 = implode(',', $temp);
                $product->size_qty =  $temp1;
                $product->update();               
            }
        }


        foreach($carts->items as $prod)
        {
            $x = (string)$prod['stock'];
            if($x != null)
            {

                $product = Product::findOrFail($prod['item']['id']);
                $product->stock =  $prod['stock'];
                $product->update();  
                if($product->stock <= 5)
                {
                    $notification = new Notification;
                    $notification->product_id = $product->id;
                    $notification->save();                    
                }              
            }
        }

        $notf = null;

        foreach($carts->items as $prod)
        {
            if($prod['item']['user_id'] != 0)
            {
                $vorder =  new VendorOrder;
                $vorder->order_id = $order->id;
                $vorder->user_id = $prod['item']['user_id'];
                $notf[] = $prod['item']['user_id'];
                $vorder->qty = $prod['qty'];
                $vorder->price = $prod['price'];
                $vorder->order_number = $order->order_number;             
                $vorder->save();
            }

        }

        if(!empty($notf))
        {
            $users = array_unique($notf);
            foreach ($users as $user) {
                $notification = new UserNotification;
                $notification->user_id = $user;
                $notification->order_number = $order->order_number;
                $notification->save();    
            }
        }

        Session::forget('carts');
        //Sending Email To Buyer

        if($gs->is_smtp == 1)
        {
        $data = [
            'to' => $request->email,
            'type' => "new_order",
            'cname' => $request->name,
            'oamount' => "",
            'aname' => "",
            'aemail' => "",
            'wtitle' => "",
            'onumber' => "",
        ];

        $mailer = new GeniusMailer();
        $mailer->sendAutoMail($data);            
        }
        else
        {
           $to = $request->email;
           $subject = "Your Order Placed!!";
           $msg = "Hello ".$request->name."!\nYou have placed a new order.\nYour order number is ".$order->order_number.".Please wait for your delivery. \nThank you.";
            $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
           mail($to,$subject,$msg,$headers);            
        }
        //Sending Email To Admin
        if($gs->is_smtp == 1)
        {
            $data = [
                'to' => $gs->email,
                'subject' => "New Order Recieved!!",
                'body' => "Hello Admin!<br>Your store has received a new order.<br>Order Number is ".$order->order_number.".Please login to your panel to check. <br>Thank you.",
            ];

            $mailer = new GeniusMailer();
            $mailer->sendCustomMail($data);            
        }
        else
        {
           $to = $gs->email;
           $subject = "New Order Recieved!!";
           $msg = "Hello Admin!\nYour store has recieved a new order.\nOrder Number is ".$order->order_number.".Please login to your panel to check. \nThank you.";
            $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
           mail($to,$subject,$msg,$headers);
        }
     return redirect($success_url);
    }

    //*** GET Request
    public function feature($id)
    {
            $data = Product::findOrFail($id);
            return view('admin.product.highlight',compact('data'));
    }

    //*** POST Request
    public function featuresubmit(Request $request, $id)
    {
        //-- Logic Section
            $data = Product::findOrFail($id);
            $input = $request->all(); 
            if($request->featured == "")
            {
                $input['featured'] = 0;
            }
            if($request->hot == "")
            {
                $input['hot'] = 0;
            }
            if($request->best == "")
            {
                $input['best'] = 0;
            }
            if($request->top == "")
            {
                $input['top'] = 0;
            }
            if($request->latest == "")
            {
                $input['latest'] = 0;
            }
            if($request->big == "")
            {
                $input['big'] = 0;
            } 
            if($request->trending == "")
            {
                $input['trending'] = 0;
            }    
            if($request->sale == "")
            {
                $input['sale'] = 0;
            }   
            if($request->is_discount == "")
            {
                $input['is_discount'] = 0;
                $input['discount_date'] = null;               
            }  

            $data->update($input);
        //-- Logic Section Ends

        //--- Redirect Section        
        $msg = 'Highlight Updated Successfully.';
        return response()->json($msg);      
        //--- Redirect Section Ends    

    }

    //*** GET Request
    public function destroy($id)
    {

        $data = Product::findOrFail($id);
        if($data->galleries->count() > 0)
        {
            foreach ($data->galleries as $gal) {
                    if (file_exists(public_path().'/assets/images/galleries/'.$gal->photo)) {
                        unlink(public_path().'/assets/images/galleries/'.$gal->photo);
                    }
                $gal->delete();
            }

        }

        if($data->ratings->count() > 0)
        {
            foreach ($data->ratings  as $gal) {
                $gal->delete();
            }
        }
        if($data->wishlists->count() > 0)
        {
            foreach ($data->wishlists as $gal) {
                $gal->delete();
            }
        }
        if($data->clicks->count() > 0)
        {
            foreach ($data->clicks as $gal) {
                $gal->delete();
            }
        }
        if($data->comments->count() > 0)
        {
            foreach ($data->comments as $gal) {
            if($gal->replies->count() > 0)
            {
                foreach ($gal->replies as $key) {
                    $key->delete();
                }
            }
                $gal->delete();
            }
        }


        if (file_exists(public_path().'/assets/images/products/'.$data->photo)) {
            unlink(public_path().'/assets/images/products/'.$data->photo);
        }
        if (file_exists(public_path().'/assets/images/thumbnails/'.$data->thumbnail)) {
            unlink(public_path().'/assets/images/thumbnails/'.$data->thumbnail);
        }

        if($data->file != null){
            if (file_exists(public_path().'/assets/files/'.$data->file)) {
                unlink(public_path().'/assets/files/'.$data->file);
            }
        }
        $data->delete();
        //--- Redirect Section     
        $msg = 'Product Deleted Successfully.';
        return response()->json($msg);      
        //--- Redirect Section Ends    

// PRODUCT DELETE ENDS  
    }
    public function UpdateCart(Request $request)
    {
        // Session::forget('carts');
         $id=$request->pid;
         $cats = Category::all();
         $data = Product::findOrFail($id);
         $sign = Currency::where('is_default','=',1)->first();
        //newly added code
         $prod = Product::where('id','=',$id)->first(['id','user_id','slug','name','photo','size','size_qty','size_price','color','price','stock','type','file','link','license','license_qty','measure']);
        $oldcarts = Session::has('carts') ? Session::get('carts') : null;

        $carts = new carts($oldcarts);
        //$carts->adding($prod, $prod->id,$request->qty, $size_price="");
        $carts->addnum($prod, $prod->id,$request->qty,"", $color="", $size_qty="", $size_price="", $size_key="");
          Session::put('carts',$carts);
        return redirect('/admin/BuyOffline/buy/'.$id);




    }

    public function getCustomer($id=null){
        try {

            if($id != null)
            {
                $user = User::find($id);
            }
            else
            {
                $user= User::select(\DB::raw( 'name,phone,email,id' ) )->get();
               
            }
           
            return response()->json([
                    'msg' => 'Successfully fetched customers',
                    'user' => $user,
                ]);
        } catch (Exception $e) {
             return response()->json([
                'status' => false,
                'msg' => 'Something happend while fetching customers',
                'error' => $e->getMessage()
            ],411);
        }
    }
}
