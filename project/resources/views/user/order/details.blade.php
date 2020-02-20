@extends('layouts.front')
@section('content')
	<!-- User Dashbord Area Start -->
	<section class="user-dashbord">
		<div class="container">
			<div class="row">
				@include('includes.user-dashboard-sidebar')
				<div class="col-lg-8">
					<div class="user-profile-details">
						<div class="order-details">
							<div class="header-area">
								<h4 class="title">
									My Order Details
								</h4>
							</div>
							<div class="view-order-page">
								<h3 class="order-code">Order# {{$order->order_number}} [{{$order->status}}]</h3>
								<div class="print-order text-right">
									<a href="{{route('user-order-print',$order->id)}}" target="_blank" class="print-order-btn">
										<i class="fa fa-print"></i> print order
									</a>
								</div>
								<p class="order-date">Order Date {{date('d-M-Y',strtotime($order->created_at))}}</p>

@if($order->dp == 1)

                                                        <div class="billing-add-area">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <h5>Billing Address</h5>
                                                                    <address>
                                                                        Name: {{$order->customer_name}}<br>
                                                                        Email: {{$order->customer_email}}<br>
                                                                        Phone: {{$order->customer_phone}}<br>
                                                                        Address: {{$order->customer_address}}<br>
                                                                        {{$order->customer_city}}-{{$order->customer_zip}}
                                                                    </address>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <h5>Payment Information</h5>
                                                                    <p>Paid Amount: {{$order->currency_sign}}{{ round($order->pay_amount * $order->currency_value , 2) }}</p>
                                                                    <p>Payment Method: {{$order->method}}</p>

                                                                    @if($order->method != "Cash On Delivery")
                                                                        @if($order->method=="Stripe")
                                                                            {{$order->method}} Charge ID: <p>{{$order->charge_id}}</p>
                                                                        @endif
                                                                        {{$order->method}} Transaction ID: <p id="ttn">{{$order->txnid}}</p><a id="tid" style="cursor: pointer;">Edit Transaction ID</a> <a style="display: none; cursor: pointer;" id="tc" >Cancel</a>
                                                                        <form id="tform">
                                                                        <input style="display: none; width: 100%;" type="text" id="tin" placeholder="Enter Transaction ID & Press Enter" required="">
                                                                        <input type="hidden" id="oid" value="{{$order->id}}">
                                                                        <button style="margin-top: 5px; display: none;" id="tbtn" type="submit" class="btn btn-default btn-sm">Submit</button>
                                                                        </form>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                        </div>

@else
                                                        <div class="shipping-add-area">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    @if($order->shipping == "shipto")
                                                                        <h5>Shipping Address</h5>
                                                                        <address>
                Name: {{$order->shipping_name == null ? $order->customer_name : $order->shipping_name}}<br>
                Email: {{$order->shipping_email == null ? $order->customer_email : $order->shipping_email}}<br>
                Phone: {{$order->shipping_phone == null ? $order->customer_phone : $order->shipping_phone}}<br>
                Address: {{$order->shipping_address == null ? $order->customer_address : $order->shipping_address}}<br>
{{$order->shipping_city == null ? $order->customer_city : $order->shipping_city}}-{{$order->shipping_zip == null ? $order->customer_zip : $order->shipping_zip}}
                                                                        </address>
                                                                    @else
                                                                        <h5>PickUp Location</h5>
                                                                        <address>
                                                                            Address: {{$order->pickup_location}}<br>
                                                                        </address>
                                                                    @endif

                                                                </div>
                                                                <div class="col-md-6">
                                                                    <h5>Shipping Method</h5>
                                                                    @if($order->shipping == "shipto")
                                                                        <p>Ship To Address</p>
                                                                    @else
                                                                        <p>Pick Up</p>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="billing-add-area">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <h5>Billing Address</h5>
                                                                    <address>
                                                                        Name: {{$order->customer_name}}<br>
                                                                        Email: {{$order->customer_email}}<br>
                                                                        Phone: {{$order->customer_phone}}<br>
                                                                        Address: {{$order->customer_address}}<br>
                                                                        {{$order->customer_city}}-{{$order->customer_zip}}
                                                                    </address>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <h5>Payment Information</h5>
                                                                    <p>Paid Amount: {{$order->currency_sign}}{{ round($order->pay_amount * $order->currency_value , 2) }}</p>
                                                                    <p>Payment Method: {{$order->method}}</p>

                                                                    @if($order->method != "Cash On Delivery")
                                                                        @if($order->method=="Stripe")
                                                                            {{$order->method}} Charge ID: <p>{{$order->charge_id}}</p>
                                                                        @endif
                                                                        {{$order->method}} Transaction ID: <p id="ttn">{{$order->txnid}}</p><a id="tid" style="cursor: pointer;">Edit Transaction ID</a> <a style="display: none; cursor: pointer;" id="tc" >Cancel</a>
                                                                        <form id="tform">
                                                                        <input style="display: none; width: 100%;" type="text" id="tin" placeholder="Enter Transaction ID & Press Enter" required="">
                                                                        <input type="hidden" id="oid" value="{{$order->id}}">
                                                                        <button style="margin-top: 5px; display: none;" id="tbtn" type="submit" class="btn btn-default btn-sm">Submit</button>
                                                                        </form>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                        </div>
@endif
                                                        <br>




								<div class="table-responsive">
									<h5>Ordered Products:</h5>
									<table class="table table-bordered veiw-details-table">
                                <thead>
                                <tr>
                                    <th>ID#</th>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Size</th>
                                    <th>Color</th>
                                    <th>Price</th>
                                    <th>Total</th>
                                </tr>
                                </thead>
										<tbody>
                                @foreach($cart->items as $product)
                                    <tr>
                                            <td>{{ $product['item']['id'] }}</td>
                                            <td>
                                                <input type="hidden" value="{{ $product['license'] }}">
                                                @if($product['item']['user_id'] != 0)
                                                @php
                                                $user = App\Models\User::find($product['item']['user_id']);
                                                @endphp
                                                @if(isset($user))
                                              <a target="_blank" href="{{ route('front.product', $product['item']['slug']) }}">{{strlen($product['item']['name']) > 30 ? substr($product['item']['name'],0,30).'...' : $product['item']['name']}}</a>
                                                @else
                                                <a href="javascript:;">{{strlen($product['item']['name']) > 30 ? substr($product['item']['name'],0,30).'...' : $product['item']['name']}}</a>
                                                @endif
                                                @endif
                                                @if($product['item']['type'] != 'Physical')
                                                @if($order->payment_status == 'Completed')
                                                    @if($product['item']['file'] != null)
                                                <a href="{{ route('user-order-download',['slug' => $order->order_number , 'id' => $product['item']['id']]) }}" class="btn btn-sm btn-primary">
                                                    <i class="fa fa-download"></i> Download
                                                </a>
                                                    @else
                                            <a target="_blank" href="{{ $product['item']['link'] }}" class="btn btn-sm btn-primary">
                                                    <i class="fa fa-download"></i> Download
                                                </a>
                                                    @endif
                                                @if($product['license'] != '')
                              <a href="javascript:;" data-toggle="modal" data-target="#confirm-delete" class="btn btn-sm btn-info product-btn" id="license"><i class="fa fa-eye"></i> View License</a>                                                
                                                @endif
                                                @endif
                                                @endif
                                            </td>
                                            <td>{{$product['qty']}} {{ $product['item']['measure'] }}</td>
                                            <td>{{$product['size']}}</td>
                                            <td><span style="width: 40px; height: 20px; display: block; border: 10px solid {{$product['color'] == "" ? "white" : $product['color']}};"></span></td>
                                            <td>{{$order->currency_sign}}{{round($product['item']['price'] * $order->currency_value,2)}}</td>
                                            <td>{{$order->currency_sign}}{{round($product['price'] * $order->currency_value,2)}}</td>

                                    </tr>
                                @endforeach
										</tbody>
									</table>

									<div class="edit-account-info-div">
										<div class="form-group">
											<a class="back-btn" href="{{ route('user-orders') }}">Back</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

    <div class="modal-header d-block text-center">
        <h4 class="modal-title d-inline-block">License Key</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
    </div>

                <div class="modal-body">
                    <p class="text-center">The Licenes Key is :  <span id="key"></span></p>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

@endsection


@section('scripts')

<script type="text/javascript">
$('#example').dataTable( {
  "ordering": false,
      'paging'      : false,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : false,
      'info'        : false,
      'autoWidth'   : false,
      'responsive'  : true
} );
</script>
    <script>
    $(document).on("click", "#tid" , function(e){
        $(this).hide();
        $("#tc").show();
        $("#tin").show();
        $("#tbtn").show();  
    });
    $(document).on("click", "#tc" , function(e){
        $(this).hide();
        $("#tid").show();
        $("#tin").hide();  
        $("#tbtn").hide();       
    });
    $(document).on("submit", "#tform" , function(e){
        var oid = $("#oid").val();
        var tin = $("#tin").val();
            $.ajax({
                    type: "GET",
                    url:"{{URL::to('user/json/trans')}}",
                    data:{id:oid,tin:tin},
                    success:function(data){
                        $("#ttn").html(data);
                        $("#tin").val("");
                        $("#tid").show();
                        $("#tin").hide(); 
                        $("#tbtn").hide(); 
                        $("#tc").hide(); 
                      }
              });     
        return false;      
    });
    </script>
    <script type="text/javascript">
        $(document).on('click','#license' , function(e){
            var id = $(this).parent().find('input[type=hidden]').val();
            $('#key').html(id);    
    });

    </script>
@endsection