<?php

namespace App\Http\Controllers\Front;
use App\Classes\GeniusMailer;
use App\Models\Order;
use App\Models\Cart;
use App\Models\Coupon;
use App\Models\Currency;
use App\Models\Generalsetting;
use App\Models\Notification;
use App\Models\Product;
use App\Models\User;
use App\Models\VendorOrder;
use App\Models\UserNotification;
use Config;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\Controller;

class PaymentController extends Controller
{

 public function store(Request $request){
        //  echo  env('RAZOR_KEY_ID');die;

     if (!Session::has('cart')) {
        return redirect()->route('front.cart')->with('success',"You don't have any product to checkout.");
     }
     $oldCart = Session::get('cart');
     $cart = new Cart($oldCart);
            if (Session::has('currency')) 
            {
              $curr = Currency::find(Session::get('currency'));
            }
            else
            {
                $curr = Currency::where('is_default','=',1)->first();
            }
        foreach($cart->items as $key => $prod)
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
                         $oldCart = Session::has('cart') ? Session::get('cart') : null;
                         $cart = new Cart($oldCart);
                         $cart->updateLicense($prod['item']['id'],$license);  
                         Session::put('cart',$cart);
                        break;
                    }                    
                }
        }
        }
     $settings = Generalsetting::findOrFail(1);
     $order = new Order;







     $paypal_email = $settings->paypal_business;
     $return_url = action('Front\PaymentController@payreturn');
     $cancel_url = action('Front\PaymentController@paycancle');
     $notify_url = action('Front\PaymentController@notify');

     $item_name = $settings->title." Order";
     $item_number = str_random(4).time();
     $item_amount = $request->total;

     $querystring = '';

     // Firstly Append paypal account to querystring
     $querystring .= "?business=".urlencode($paypal_email)."&";

     // Append amount& currency (£) to quersytring so it cannot be edited in html

     //The item name and amount can be brought in dynamically by querying the $_POST['item_number'] variable.
     $querystring .= "item_name=".urlencode($item_name)."&";
     $querystring .= "amount=".urlencode($item_amount)."&";
     $querystring .= "item_number=".urlencode($item_number)."&";

    $querystring .= "cmd=".urlencode(stripslashes($request->cmd))."&";
    $querystring .= "bn=".urlencode(stripslashes($request->bn))."&";
    $querystring .= "lc=".urlencode(stripslashes($request->lc))."&";
    $querystring .= "currency_code=".urlencode(stripslashes($request->currency_code))."&";

     // Append paypal return addresses
     $querystring .= "return=".urlencode(stripslashes($return_url))."&";
     $querystring .= "cancel_return=".urlencode(stripslashes($cancel_url))."&";
     $querystring .= "notify_url=".urlencode($notify_url)."&";

     $querystring .= "custom=".$request->user_id;
    // Redirect to paypal IPN

                    $order['user_id'] = $request->user_id;
                    $order['cart'] = utf8_encode(bzcompress(serialize($cart), 9));
                    $order['totalQty'] = $request->totalQty;
                    $order['pay_amount'] = round($item_amount / $curr->value, 2);
                    $order['method'] = $request->method;
                    $order['customer_email'] = $request->email;
                    $order['customer_name'] = $request->name;
                    $order['customer_phone'] = $request->phone;
                    $order['order_number'] = $item_number;
                    $order['shipping'] = $request->shipping;
                    $order['pickup_location'] = $request->pickup_location;
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
                    $order['payment_status'] = "Pending";
                    $order['currency_sign'] = $curr->sign;
                    $order['currency_value'] = $curr->value;
                    $order['shipping_cost'] = $request->shipping_cost;
                    $order['tax'] = $request->tax;
                    $order['dp'] = $request->dp;
            if (Session::has('affilate')) 
            {
                $val = $request->total / 100;
                $sub = $val * $settings->affilate_charge;
                $user = User::findOrFail(Session::get('affilate'));
                $user->affilate_income += $sub;
                $user->update();
                $order['affilate_user'] = $user->name;
                $order['affilate_charge'] = $sub;
            }
                    $order->save();
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
                    foreach($cart->items as $prod)
                    {
		        $x = (string)$prod['stock'];
		        if($x != null)
		        {
                            $product = Product::findOrFail($prod['item']['id']);
                            $product->stock =  $prod['stock'];
                            $product->update();                
                        }
                    }
        foreach($cart->items as $prod)
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


        foreach($cart->items as $prod)
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

        foreach($cart->items as $prod)
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
   
     Session::forget('cart');

                    //  $surl =action('Front\PaymentController@payreturn');
                      //  $furl=action('Front\PaymentController@paycancle');
                        $surl =action('Front\PaymentController@payreturn');
                        $furl=action('Front\PaymentController@paycancle');
                        $currency_code = 'INR';
                        $productinfo = "Shopping";
                        $txnid = time();
                        $surl = $surl;
                        $furl = $furl;
                        $key_id ="rzp_test_9CiTB8gP2VHY60";
                        $currency_code = $currency_code;
                        
                        $total = ($request->total* 100);
                        $amount = $request->total;
                        $merchant_order_id = rand();
                        $card_holder_name = $request->name;
                        $email =$request->email;
                        $phone = $request->phone;
                        $user_id = $request->user_id;
                        $order_number = $item_number;
                        $name = 'Delightgallery';
                    $return_url = action('Front\PaymentController@callback');
?>
<form name="razorpay-form" id="razorpay-form" action="<?php echo $return_url;?>" method="POST">
    <input type="hidden" name="razorpay_payment_id" id="razorpay_payment_id" />
    <input type="hidden" name="merchant_order_id" id="merchant_order_id" value="<?php echo $merchant_order_id; ?>"/>
    <input type="hidden" name="merchant_trans_id" id="merchant_trans_id" value="<?php echo $txnid; ?>"/>
    <input type="hidden" name="merchant_product_info_id" id="merchant_product_info_id" value="<?php echo $productinfo; ?>"/>
    <input type="hidden" name="merchant_surl_id" id="merchant_surl_id" value="<?php echo $surl; ?>"/>
    <input type="hidden" name="merchant_furl_id" id="merchant_furl_id" value="<?php echo $furl; ?>"/>
    <input type="hidden" name="card_holder_name_id" id="card_holder_name_id" value="<?php echo $card_holder_name; ?>"/>
    <input type="hidden" name="merchant_total" id="merchant_total" value="<?php echo $total; ?>"/>
    <input type="hidden" name="merchant_amount" id="merchant_amount" value="<?php echo $amount; ?>"/>
    <input type="hidden" name="user_id" id="user_id" value="<?php echo $user_id; ?>"/>
    <input type="hidden" name="order_number" id="order_number" value="<?php echo $order_number; ?>"/>
</form>
<div class="row" style="display: none">
    <div class="col-lg-12 text-right">
        <input  id="submit-pay" type="submit" onclick="razorpaySubmit(this);" value="Sign Up" class="btn btn-primary" />
    </div>
</div>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
    

    
var razorpay_options = {
key: "<?php echo $key_id; ?>",
amount: "<?php echo $total; ?>",
name: "<?php echo $name; ?>",
description: "Order # <?php echo $merchant_order_id; ?>",
netbanking: true,
currency: "<?php echo $currency_code; ?>",
prefill: {
name:"<?php echo $card_holder_name; ?>",
email: "<?php echo $email; ?>",
contact: "<?php echo $phone; ?>"
},
notes: {
soolegal_order_id: "<?php echo $merchant_order_id; ?>",
},
handler: function (transaction) {
document.getElementById('razorpay_payment_id').value = transaction.razorpay_payment_id;
document.getElementById('razorpay-form').submit();
},
"modal": {
"ondismiss": function(){
window.location = "<?php echo $furl;?>";
//location.reload()
}
}
};
var razorpay_submit_btn, razorpay_instance;

function razorpaySubmit(){

if(typeof Razorpay == 'undefined'){
setTimeout(razorpaySubmit, 200);
if(!razorpay_submit_btn){
// razorpay_submit_btn = el;
//el.disabled = true;
//el.value = 'Please wait...';
}
} else {
if(!razorpay_instance){
razorpay_instance = new Razorpay(razorpay_options);
if(razorpay_submit_btn){
razorpay_submit_btn.disabled = false;
razorpay_submit_btn.value = "Pay Now";
}
}
razorpay_instance.open();
}
}

razorpaySubmit();
</script>
<?php
}


// initialized cURL Request
private function get_curl_handle($payment_id, $amount)  {
$url = 'https://api.razorpay.com/v1/payments/'.$payment_id.'/capture';
$key_id = "rzp_test_9CiTB8gP2VHY60";
$key_secret = "ywo9Jb2eMXoy3h1UOjkTDYvW";
$fields_string = "amount=$amount";
$ch = curl_init();
//set the url, number of POST vars, POST data
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_USERPWD, $key_id.':'.$key_secret);
curl_setopt($ch, CURLOPT_TIMEOUT, 60);
curl_setopt($ch, CURLOPT_POST, 1);

curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
$output = curl_exec ($ch);
//curl_close($ch);
return $output;
}

// callback method
public function callback(Request $input) {

if (!empty($input['razorpay_payment_id']) && !empty($input['merchant_order_id'])) {
$razorpay_payment_id = $input['razorpay_payment_id'];
$merchant_order_id = $input['merchant_order_id'];
$currency_code = 'INR';
$amount = $input['merchant_total'];
$success = false;
$error = '';
try {
$result = $this->get_curl_handle($razorpay_payment_id, $amount);
//execute post
$response_array = json_decode($result, true);
                if ($result === false) {
                        $success = false;
                        $error = 'Curl error: '.curl_error($ch);
                    } else {
                             $array=array('created','authorized','captured','refunded');
                            if (in_array($response_array['status'], $array) && ($response_array['status']!='failed')){
                            $success = true;
                            $session_data = array('payment_id'=>$razorpay_payment_id );
                         // Add user data in session
                          // $this->session->set_userdata('pay_id', $session_data);
                            }
                            else if (($response_array['status']!='failed') && $response_array['error_code']=="") {
                                $success = true;
                            } else {
                                $success = false;
                                if ($response_array['error_code']!="") {
                                    $error = $response_array['error_code'].':'.$response_array['error_description'];
                                } else {
                                    $error = 'RAZORPAY_ERROR:Invalid Response <br/>'.$result;
                                }
                            }
                    }
                    //close connection
                    //curl_close($ch);
                } catch (Exception $e) {
                    $success = false;
                    $error = 'Request to Razorpay Failed';
                }
                if ($success === true) {
                    $order = Order::where('user_id',$input['user_id'])
                 ->where('order_number',$input['order_number'])->first();
                    $data['txnid'] = $response_array['id'];
                    $data['payment_status'] = $response_array['status'];
                    if($order->dp == 1)
                    {
                        $data['status'] = 'completed';
                    }
                    $order->update($data);
                    $notification = new Notification;
                    $notification->order_id = $order->id;
                    $notification->save();
                    Session::forget('cart');
                      
                  
                  return redirect($input['merchant_surl_id']);
                 } else {
                   //  echo "here-111";
                     $order = Order::where('user_id',$input['user_id'])
                 ->where('order_number',$input['order_number'])->first();
                    //$data['txnid'] = $response_array['id'];
                    $data['payment_status'] = $response_array['status'];
                    if($order->dp == 1)
                    {
                        $data['status'] = 'Failed';
                    }
                    $order->update($data);
                    $notification = new Notification;
                    $notification->order_id = $order->id;
                    $notification->save();
                    Session::forget('cart');
                   return redirect($input['merchant_furl_id']);
                }
            } else {
             echo 'An error occured. Contact site administrator, please!';
            }
        }


     public function paycancle(){
        $this->code_image();
         return redirect()->back()->with('unsuccess','Payment Cancelled.');
     }

     public function payreturn(){
        $this->code_image();
         return view('front.success');
     }


public function notify(Request $request){

    $raw_post_data = file_get_contents('php://input');
    $raw_post_array = explode('&', $raw_post_data);
    $myPost = array();
    foreach ($raw_post_array as $keyval) {
        $keyval = explode ('=', $keyval);
        if (count($keyval) == 2)
            $myPost[$keyval[0]] = urldecode($keyval[1]);
    }
    //return $myPost;


    // Read the post from PayPal system and add 'cmd'
    $req = 'cmd=_notify-validate';
    if(function_exists('get_magic_quotes_gpc')) {
        $get_magic_quotes_exists = true;
    }
    foreach ($myPost as $key => $value) {
        if($get_magic_quotes_exists == true && get_magic_quotes_gpc() == 1) {
            $value = urlencode(stripslashes($value));
        } else {
            $value = urlencode($value);
        }
        $req .= "&$key=$value";
    }

    /*
     * Post IPN data back to PayPal to validate the IPN data is genuine
     * Without this step anyone can fake IPN data
     */
    $paypalURL = "https://www.paypal.com/cgi-bin/webscr";
    $ch = curl_init($paypalURL);
    if ($ch == FALSE) {
        return FALSE;
    }
    curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $req);
    curl_setopt($ch, CURLOPT_SSLVERSION, 6);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
    curl_setopt($ch, CURLOPT_FORBID_REUSE, 1);

// Set TCP timeout to 30 seconds
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Connection: Close', 'User-Agent: company-name'));
    $res = curl_exec($ch);

    /*
     * Inspect IPN validation result and act accordingly
     * Split response headers and payload, a better way for strcmp
     */
    $tokens = explode("\r\n\r\n", trim($res));
    $res = trim(end($tokens));
    if (strcmp($res, "VERIFIED") == 0 || strcasecmp($res, "VERIFIED") == 0) {

        $order = Order::where('user_id',$_POST['custom'])
            ->where('order_number',$_POST['item_number'])->first();
        $data['txnid'] = $_POST['txn_id'];
        $data['payment_status'] = $_POST['payment_status'];
        if($order->dp == 1)
        {
            $data['status'] = 'completed';
        }
        $order->update($data);
        $notification = new Notification;
        $notification->order_id = $order->id;
        $notification->save();
        Session::forget('cart');
    }else{
        $payment = Order::where('user_id',$_POST['custom'])
            ->where('order_number',$_POST['item_number'])->first();
        VendorOrder::where('order','=',$payment->id)->delete();
        $payment->delete();

        Session::forget('cart');

    }

}


    // Capcha Code Image
    private function  code_image()
    {
        $actual_path = str_replace('project','',base_path());
        $image = imagecreatetruecolor(200, 50);
        $background_color = imagecolorallocate($image, 255, 255, 255);
        imagefilledrectangle($image,0,0,200,50,$background_color);

        $pixel = imagecolorallocate($image, 0,0,255);
        for($i=0;$i<500;$i++)
        {
            imagesetpixel($image,rand()%200,rand()%50,$pixel);
        }

        $font = $actual_path.'assets/front/fonts/NotoSans-Bold.ttf';
        $allowed_letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        $length = strlen($allowed_letters);
        $letter = $allowed_letters[rand(0, $length-1)];
        $word='';
        //$text_color = imagecolorallocate($image, 8, 186, 239);
        $text_color = imagecolorallocate($image, 0, 0, 0);
        $cap_length=6;// No. of character in image
        for ($i = 0; $i< $cap_length;$i++)
        {
            $letter = $allowed_letters[rand(0, $length-1)];
            imagettftext($image, 25, 1, 35+($i*25), 35, $text_color, $font, $letter);
            $word.=$letter;
        }
        $pixels = imagecolorallocate($image, 8, 186, 239);
        for($i=0;$i<500;$i++)
        {
            imagesetpixel($image,rand()%200,rand()%50,$pixels);
        }
        session(['captcha_string' => $word]);
        imagepng($image, $actual_path."assets/images/capcha_code.png");
    }

}
