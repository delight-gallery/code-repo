@extends('layouts.front')

@section('content')

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="pages">
					<li>
						<a href="{{ route('front.index') }}">
							{{ $langg->lang17 }}
						</a>
					</li>
					<li>
						<a href="{{ route('front.checkout') }}">
							{{ $langg->lang136 }}
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Area End -->


	<!-- Check Out Area Start -->
	<section class="checkout">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="content-area">
							<div class="cart-table co-p-table">
									<table class="table">
											<thead>
													<tr>
														<th>{{ $langg->lang137 }}</th>
														<th>{{ $langg->lang138 }}</th>
														<th>{{ $langg->lang139 }}</th>
														<th>{{ $langg->lang140 }}</th>
														<th>{{ $langg->lang141 }}</th>
														<th>{{ $langg->lang142 }}</th>
													</tr>
												</thead>
												<tbody>
												@foreach($products as $product)
													<tr>
														<td class="product-img">
															<div class="item d-flex">
															<img src=" {{ asset('assets/images/products/'.$product['item']['photo']) }}" height="80" width="80" class="p-1">
																<p class="name pt-2 pl-1"><a href="{{ route('front.product', $product['item']['slug']) }}" target="_blank">{{ $product['item']['name'] }}</a></p>
															</div>
														</td>
														<td class="size">
															<div class="item-size">
																<span>{{ $product['size'] }}</span>
															</div>
														</td>
														<td class="size">
															<div class="item-color">
																	<span style="background: {{ $product['color'] }}"></span>
															</div>
														</td>
														<td class="quantity">
															<span class="qttotal">{{ $product['qty'] }} </span>	
														</td>
														<td class="unit-price">
															<p>{{ App\Models\Product::convertPrice($product['item']['price']) }} </p>
														</td>
														<td class="total-price">
															<p>{{ App\Models\Product::convertPrice($product['price']) }} </p>
														</td>
													</tr>
												@endforeach
												</tbody>
											<tfoot>
													<tr id="shipshow" class="{{ $shipping_cost == 0 ? 'hidden' : ''}}">
														<td colspan="4">
														</td>
														<td class="total-price">
															<p>{{ $langg->lang143 }}:</p>
														</td>

														<td class="total-price">
															<p>{{ App\Models\Product::convertPrice($shipping_cost) }}</p>
														</td>
													</tr>

												@if($gs->tax != 0)

													<tr>
														<td colspan="4">
														</td>
														<td class="total-price">
															<p>{{ $langg->lang144 }}:</p>
														</td>

														<td class="total-price">
															<p>{{$gs->tax}}%</p>
														</td>
													</tr>

												@endif


												@if(Session::has('coupon'))

													<tr class="discount-bar">
														<td colspan="4">
														</td>
														<td class="total-price">
															<p>{{ $langg->lang145 }}<span class="dpercent">{{ Session::get('coupon_percentage') == 0 ? '' : '('.Session::get('coupon_percentage').')' }}</span>:</p>
														</td>

														<td class="total-price">
															@if($gs->currency_format == 0)
															  <p id="discount">{{ $curr->sign }}{{ Session::get('coupon') }}</p>
															 @else 
															  <p id="discount">{{ Session::get('coupon') }}{{ $curr->sign }}</p>
															@endif
														</td>
													</tr>

												@else 
													<tr class="discount-bar d-none">
														<td colspan="4">
														</td>
														<td class="total-price">
															<p>{{ $langg->lang145 }}<span class="dpercent"></span>:</p>
														</td>

														<td class="total-price">
															  <p id="discount"></p>
														</td>
													</tr>


												@endif

													<tr>
														<td colspan="4">
														</td>
														<td class="total-price">
															<p>{{ $langg->lang146 }}:</p>
														</td>

														<td class="total-price" id="total-cost">
															@if(Session::has('coupon_total'))
																@if($gs->currency_format == 0)
																  <p>{{ $curr->sign }}{{ $totalPrice }}</p>
																 @else 
																  <p>{{ $totalPrice }}{{ $curr->sign }}</p>
																@endif

															@elseif(Session::has('coupon_total1'))
															<p> {{ Session::get('coupon_total1') }}</p>
															@else
															<p>{{ App\Models\Product::convertPrice($totalPrice) }}</p>
															@endif
														</td>
												</tr>


								</tfoot>
									</table>
									<div class="cupon-box text-right">
						              <div id="coupon-link">
						                  Have a promotion code?
						              </div>
						              <form id="check-coupon-form" class="coupon">
						                <input type="text" placeholder="Coupon Code" id="code" required="" autocomplete="off">
						                <button type="submit">Apply</button>
						              </form>
						            </div>
								</div>
						<form id="payment-form" method="POST" class="checkoutform">

							@include('includes.form-success')
							@include('includes.form-error')
							
							{{ csrf_field() }}

							<div class="user-details-area">
								<h2 class="title">
									{{ $langg->lang147 }}
								</h2>
								<div class="row">
									<div class="col-lg-6">
										<label>{{ $langg->lang148 }} *</label>
                                        <select class="form-control" id="shipop" name="shipping" required="">
                                            <option value="shipto">{{ $langg->lang149 }}</option>
                                            <option value="pickup">{{ $langg->lang150 }}</option>
                                        </select>
									</div>

                                    <div class="col-lg-6" id="pick" style="display: none;">
                                        <label>{{ $langg->lang151 }} *</label>
                                        <select class="form-control" name="pickup_location">
                                            @foreach($pickups as $pickup)
                                                <option value="{{$pickup->location}}">{{$pickup->location}}</option>
                                            @endforeach
                                        </select>
                                    </div>

									<div class="col-lg-6">
										<label>{{ $langg->lang152 }} *</label>
										<input class="form-control" type="text" name="name" placeholder="{{ $langg->lang152 }}" required="" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->name : '' }}">
									</div>
									<div class="col-lg-6">
										<label>{{ $langg->lang153 }} *</label>
										<input class="form-control" type="text" name="phone" placeholder="{{ $langg->lang153 }}" required="" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->phone : '' }}">
									</div>
									<div class="col-lg-6">
										<label>{{ $langg->lang154 }} *</label>
										<input class="form-control" type="text" name="email" placeholder="{{ $langg->lang154 }}" required="" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->email : '' }}">
									</div>
									<div class="col-lg-6">
										<label>{{ $langg->lang155 }} *</label>
										<input class="form-control" type="text" name="address" placeholder="{{ $langg->lang155 }}" required="" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->address : '' }}">
									</div>
									<div class="col-lg-6">
										<label for="shippingFull_name">{{ $langg->lang156 }}  <span>*</span></label>
										<select class="form-control" name="customer_country" required=""> 
											@include('includes.countries')
										</select>
									</div>
									<div class="col-lg-6">
										<label>{{ $langg->lang158 }} *</label>
										<input class="form-control" type="text" name="city" placeholder="{{ $langg->lang158 }}" required="" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->city : '' }}">
									</div>
									<div class="col-lg-6">
										<label>{{ $langg->lang159 }} *</label>
										<input class="form-control" type="text" name="zip" placeholder="{{ $langg->lang159 }}" required="" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->zip : '' }}">
									</div>
								</div>
							</div>
							<div class="shipping-title">
									<input class="ship-to-diff" id="ship-to-diff" type="checkbox"> <label for="ship-to-diff">{{ $langg->lang160 }}</label>
							</div>
							<div class="shipping-details-area" style="display: none;">
								<div class="row">
									<div class="col-lg-6">
										<label for="shippingFull_name">{{ $langg->lang152 }}  <span>*</span></label>
										<input class="form-control ship_input" type="text" name="shipping_name" id="shippingFull_name" placeholder="{{ $langg->lang152 }}">
									</div>
									<div class="col-lg-6">
										<label for="shipingPhone_number">{{ $langg->lang153 }}  <span>*</span></label>
										<input class="form-control ship_input" type="number" name="shipping_email" id="shipingPhone_number" placeholder="{{ $langg->lang153 }}">
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<label for="ship_email">{{ $langg->lang154 }}  <span>*</span></label>
										<input class="form-control ship_input" type="email" name="shipping_phone" id="ship_email" placeholder="{{ $langg->lang154 }}">
									</div>
									<div class="col-lg-6">
										<label for="shipping_address">{{ $langg->lang155 }}  <span>*</span></label>
										<input class="form-control ship_input" type="text" name="shipping_address" id="shipping_address" placeholder="{{ $langg->lang155 }}">
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<label for="shippingFull_name">{{ $langg->lang156 }}  <span>*</span></label>
										<select class="form-control ship_input" name="shipping_country"> 
											<option value="">{{ $langg->lang157 }}</option>
											@include('includes.countries')
										</select>
									</div>
									<div class="col-lg-6">
										<label for="shipping_city">{{ $langg->lang158 }}  <span>*</span></label>
										<input class="form-control ship_input" type="text" name="shipping_city" id="shipping_city" placeholder="{{ $langg->lang158 }}">
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<label for="shippingPostal_code">{{ $langg->lang159 }}  <span>*</span></label>
										<input class="form-control ship_input" type="text" name="shipping_zip" id="shippingPostal_code" placeholder="{{ $langg->lang159 }}">
									</div>
								</div>
							</div>


							<div class="user-details-area">
								<div class="row">
									<div class="col-lg-12">
										<label for="Order_Note">{{ $langg->lang217 }} <small>({{ $langg->lang218}})</small></label>
										<textarea id="Order_Note" class="form-control" name="order_notes"></textarea>
									</div>
								</div>
							</div>
							<div class="payment-information">
									<h2 class="title">
											{{ $langg->lang161 }}
										</h2>
								<ul class="pm-list">
									@if($gs->cod_check)
									<li data-form="{{route('cash.submit')}}" data-href="{{ route('front.load.payment',['slug1' => 'cod','slug2' => 0]) }}">
										<a href="javascript:;">
												<img src="{{asset('assets/images/'.$gs->cod_photo)}}" alt="">
										</a>
									</li>
									@endif
									@if($gs->paypal_check)
									<li data-form="{{route('paypal.submit')}}" data-href="{{ route('front.load.payment',['slug1' => 'paypal','slug2' => 0]) }}">
										<a href="javascript:;">
												<img src="{{asset('assets/images/'.$gs->paypal_photo)}}" alt="">
										</a>
									</li>
									@endif
									<!--@if($gs->stripe_check)
									<li data-form="{{route('stripe.submit')}}" data-href="{{ route('front.load.payment',['slug1' => 'stripe','slug2' => 0]) }}">
										<a href="javascript:;">
												<img src="{{asset('assets/images/'.$gs->stripe_photo)}}" alt="">
										</a>
									</li>
									@endif
									@if($gs->is_instamojo == 1)
									<li data-form="{{route('instamojo.submit')}}" data-href="{{ route('front.load.payment',['slug1' => 'instamojo','slug2' => 0]) }}">
										<a href="javascript:;">
												<img src="{{asset('assets/images/'.$gs->instamojo_photo)}}" alt="">
										</a>
									</li>
									@endif

									@if($gs->is_paystack == 1)
									<li data-form="{{route('paystack.submit')}}" data-href="{{ route('front.load.payment',['slug1' => 'paystack','slug2' => 0]) }}">
										<a href="javascript:;">
												<img src="{{asset('assets/images/'.$gs->paystack_photo)}}" alt="">
										</a>
									</li>
									@endif

        
									@foreach($gateways as $gt)
									<li data-form="{{route('gateway.submit')}}" data-href="{{ route('front.load.payment',['slug1' => 'other','slug2' => $gt->id]) }}">
										<a href="javascript:;">
												<img src="{{asset('assets/images/gateways/'.$gt->photo)}}" alt="">
										</a>
									</li>
									@endforeach-->
								</ul>
								<div class="row" id="pay-info">
								</div>
							</div>

                            <input type="hidden" id="shipping-cost" name="shipping_cost" value="{{round($shipping_cost * $curr->value,2)}}">
                            <input type="hidden" name="dp" value="{{$digital}}">
                            <input type="hidden" name="tax" value="{{$gs->tax}}">
                            <input type="hidden" name="totalQty" value="{{$totalQty}}">

							@if(Session::has('coupon_total'))
                            	<input type="hidden" name="total" id="grandtotal" value="{{ $totalPrice }}">
							@else 
                            	<input type="hidden" name="total" id="grandtotal" value="{{round($totalPrice * $curr->value,2)}}">
							@endif


                            <input type="hidden" name="coupon_code" id="coupon_code" value="{{ Session::has('coupon_code') ? Session::get('coupon_code') : '' }}">
                            <input type="hidden" name="coupon_discount" id="coupon_discount" value="{{ Session::has('coupon') ? Session::get('coupon') : '' }}">
                            <input type="hidden" name="coupon_id" id="coupon_id" value="{{ Session::has('coupon') ? Session::get('coupon_id') : '' }}">
                            <input type="hidden" name="user_id" id="user_id" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->id : '' }}">
							<button type="submit" id="pay-btn" class="mybtn1 checkout-btn">{{ $langg->lang162 }}</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
<!-- Check Out Area End-->

@if(isset($checked))

<!-- LOGIN MODAL -->
<div class="modal fade" id="comment-log-reg1" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="comment-log-reg-Title" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" aria-label="Close">
          <a href="{{ url()->previous() }}"><span aria-hidden="true">&times;</span></a>
        </button>
      </div>
      <div class="modal-body">
				<nav class="comment-log-reg-tabmenu">
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a class="nav-item nav-link login active" id="nav-log-tab" data-toggle="tab" href="#nav-log" role="tab" aria-controls="nav-log" aria-selected="true">
							{{ $langg->lang197 }}
						</a>
						<a class="nav-item nav-link" id="nav-reg-tab" data-toggle="tab" href="#nav-reg" role="tab" aria-controls="nav-reg" aria-selected="false">
							{{ $langg->lang198 }}
						</a>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-log" role="tabpanel" aria-labelledby="nav-log-tab">
				        <div class="login-area">
				          <div class="header-area">
				            <h4 class="title">{{ $langg->lang172 }}</h4>
				          </div>
				          <div class="login-form signin-form">
				                @include('includes.admin.form-login')
				            <form id="loginform" action="{{ route('user.login.submit') }}" method="POST">
				              {{ csrf_field() }}
				              <div class="form-input">
				                <input type="email" name="email" placeholder="{{ $langg->lang173 }}" required="">
				                <i class="icofont-user-alt-5"></i>
				              </div>
				              <div class="form-input">
				                <input type="password" class="Password" name="password" placeholder="{{ $langg->lang174 }}" required="">
				                <i class="icofont-ui-password"></i>
				              </div>
				              <div class="form-forgot-pass">
				                <div class="left">
				              <input type="hidden" name="modal" value="1">
				                  <input type="checkbox" name="remember"  id="mrp" {{ old('remember') ? 'checked' : '' }}>
				                  <label for="mrp">{{ $langg->lang175 }}</label>
				                </div>
				                <div class="right">
				                  <a href="{{ route('user-forgot') }}">
				                    {{ $langg->lang176 }}
				                  </a>
				                </div>
				              </div>
				              <input id="authdata" type="hidden"  value="{{ $langg->lang177 }}">
				              <button type="submit" class="submit-btn">{{ $langg->lang178 }}</button>
					              @if(App\Models\Socialsetting::find(1)->f_check == 1 || App\Models\Socialsetting::find(1)->g_check == 1)
					              <div class="social-area">
					                  <h3 class="title">{{ $langg->lang179 }}</h3>
					                  <p class="text">{{ $langg->lang180 }}</p>
					                  <ul class="social-links">
					                    @if(App\Models\Socialsetting::find(1)->f_check == 1)
					                    <li>
					                      <a href="{{ route('social-provider','facebook') }}"> 
					                        <i class="fab fa-facebook-f"></i>
					                      </a>
					                    </li>
					                    @endif
					                    @if(App\Models\Socialsetting::find(1)->g_check == 1)
					                    <li>
					                      <a href="{{ route('social-provider','google') }}">
					                        <i class="fab fa-google-plus-g"></i>
					                      </a>
					                    </li>
					                    @endif
					                  </ul>
					              </div>
					              @endif
				            </form>
				          </div>
				        </div>
					</div>
					<div class="tab-pane fade" id="nav-reg" role="tabpanel" aria-labelledby="nav-reg-tab">
                <div class="login-area signup-area">
                    <div class="header-area">
                        <h4 class="title">{{ $langg->lang181 }}</h4>
                    </div>
                    <div class="login-form signup-form">
                       @include('includes.admin.form-login')
                        <form id="registerform" action="{{route('user-register-submit')}}" method="POST">
                          {{ csrf_field() }}

                            <div class="form-input">
                                <input type="text" class="User Name" name="name" placeholder="{{ $langg->lang182 }}" required="">
                                <i class="icofont-user-alt-5"></i>
                            </div>

                            <div class="form-input">
                                <input type="email" class="User Name" name="email" placeholder="{{ $langg->lang183 }}" required="">
                                <i class="icofont-email"></i>
                            </div>

                            <div class="form-input">
                                <input type="text" class="User Name" name="phone" placeholder="{{ $langg->lang184 }}" required="">
                                <i class="icofont-phone"></i>
                            </div>

                            <div class="form-input">
                                <input type="text" class="User Name" name="address" placeholder="{{ $langg->lang185 }}" required="">
                                <i class="icofont-location-pin"></i>
                            </div>

                            <div class="form-input">
                                <input type="password" class="Password" name="password" placeholder="{{ $langg->lang186 }}" required="">
                                <i class="icofont-ui-password"></i>
                            </div>

                            <div class="form-input">
                                <input type="password" class="Password" name="password_confirmation" placeholder="{{ $langg->lang187 }}" required="">
                                <i class="icofont-ui-password"></i>
                            </div>

                            <input id="processdata" type="hidden"  value="{{ $langg->lang188 }}">
                            <button type="submit" class="submit-btn">{{ $langg->lang189 }}</button>
                        
                        </form>
                    </div>
                </div>
					</div>
				</div>
      </div>
    </div>
  </div>
</div>
<!-- LOGIN MODAL ENDS -->

@endif

@endsection


@section('scripts')

<script type="text/javascript">

var coup = 0;
var pos = {{ $gs->currency_format }};

@if(isset($checked))

	$('#comment-log-reg1').modal('show');

@endif

$('ul.pm-list li').on('click',function(){

	$('ul.pm-list li').removeClass('active');
	$(this).addClass('active');
	$('#pay-info').load($(this).data('href'));
	$('#payment-form').prop('action',$(this).data('form'));

});

$('ul.pm-list li').eq(0).addClass('active');
 if ($('ul.pm-list li').length > 0){
 		$('#pay-info').load($('ul.pm-list li').eq(0).data('href'));
 }
$('#payment-form').prop('action',$('ul.pm-list li').eq(0).data('form'));

$('#shipop').on('change',function(){
	var val = $(this).val();
	var ship = parseFloat($('#shipping-cost').val());
	var total = parseFloat($('#grandtotal').val());
	if(val == 'pickup')
	{
		$('#shipshow').hide();
		total = (total + coup) - ship;
		$('#pick').show();
		$('#grandtotal').val(total);
		if(pos == 0){
			$('#total-cost p').html('{{ $curr->sign }}'+total)
		}
		else{
			$('#total-cost p').html(total+'{{ $curr->sign }}')
		}
		$('#ship-to-diff').parent().hide();
		$('#ship-to-diff').prop('checked',false);
		$('.shipping-details-area').hide();


	}
	else{
		$('#shipshow').show();
		total = (total + coup) + ship;
		$('#pick').hide();
		$('#grandtotal').val(total);
		if(pos == 0){
			$('#total-cost p').html('{{ $curr->sign }}'+total)
		}
		else{
			$('#total-cost p').html(total+'{{ $curr->sign }}')
		}
		$('#ship-to-diff').parent().show();
	}

});


$("#ship-to-diff").on('change',function(){

	if(this.checked){
		$('.shipping-details-area').show();
	}
	else{
		$('.shipping-details-area').hide();
	}

});


$('#payment-form').on('submit',function(){
	 $('#preloader').show();
});

    $("#check-coupon-form").on('submit', function () {
        var val = $("#code").val();
        var total = $("#grandtotal").val();
        var ship = parseFloat($('#shipping-cost').val());
            $.ajax({
                    type: "GET",
                    url:mainurl+"/carts/coupon/check",
                    data:{code:val, total:total, shipping_cost:ship},
                    success:function(data){
                        if(data == 0)
                        {
                        	toastr.error(langg.no_coupon);
                            $("#code").val("");
                        }
                        else if(data == 2)
                        {
                        	toastr.error(langg.already_coupon);
                            $("#code").val("");
                        }
                        else
                        {
                            $("#check-coupon-form").toggle();
                            $(".discount-bar").removeClass('d-none');

							if(pos == 0){
								$('#total-cost p').html('{{ $curr->sign }}'+data[0]);
								$('#discount').html('{{ $curr->sign }}'+data[2]);
							}
							else{
								$('#total-cost p').html(data[0]+'{{ $curr->sign }}');
								$('#discount').html(data[2]+'{{ $curr->sign }}');
							}
								$('#grandtotal').val(data[0]);
								$('#coupon_code').val(data[1]);
								$('#coupon_discount').val(data[2]);
								if(data[4] != 0){
								$('.dpercent').html('('+data[4]+')');
								}
								else{
								$('.dpercent').html('');									
								}
                        	toastr.error(langg.coupon_found);
                            $("#code").val("");
                        }
                      }
              }); 
              return false;
    });


</script>


@endsection