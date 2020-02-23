@extends('layouts.admin')
@section('styles')

<link href="{{asset('assets/admin/css/product.css')}}" rel="stylesheet"/>
<link href="{{asset('assets/admin/css/jquery.Jcrop.css')}}" rel="stylesheet"/>
<link href="{{asset('assets/admin/css/Jcrop-style.css')}}" rel="stylesheet"/>

@endsection
@section('content')
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
															
															<form method="get" action="{{ route('admin-buy-now',$product['item']['id']) }}" >
																<span class="increase-product-quantity">
																	<i class="icofont-plus-square"></i>
																</span>
																<span class="decrease-product-quantity">
																	<i class="icofont-minus-square"></i>
																</span>
																<input type="hidden" name="qty" value="{{  $product['qty'] }}">
																
															</form>
															
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
									
								</div>
						<form id="payment-form" method="POST" class="checkoutform" action="{{route('Offline.submit')}}">

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
										<input class="form-control customer-auto-complete" type="text" name="phone" placeholder="{{ $langg->lang153 }}" required="" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->phone : '' }}">
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
							


							<div class="user-details-area">
								<div class="row">
									<div class="col-lg-12">
										<label for="Order_Note">{{ $langg->lang217 }} <small>({{ $langg->lang218}})</small></label>
										<textarea id="Order_Note" class="form-control" name="order_notes"></textarea>
									</div>
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
	

@endsection

@section('scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-3-typeahead/4.0.2/bootstrap3-typeahead.min.js" ></script>
<script src="{{asset('assets/admin/js/product.js')}}"></script>
<script type="text/javascript">
	var admin_get_customer = "{{route('admin-get-customer')}}";
</script>
<script src="{{asset('assets/admin/js/buy-offline.js')}}"></script>
@endsection