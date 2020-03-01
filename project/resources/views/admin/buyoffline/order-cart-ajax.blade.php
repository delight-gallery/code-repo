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
					
					<form>
						{{ csrf_field() }}
						<span class="increase-product-quantity-ajax">
							<i class="icofont-plus-square"></i>
						</span>
						<span class="decrease-product-quantity-ajax">
							<i class="icofont-minus-square"></i>
						</span>
						<input type="hidden" name="qty" value="{{  $product['qty'] }}">
						<input type="hidden" name="product" value="{{  $product['item']['id'] }}">
						
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
<button type="submit" id="payment-submit-btn" class="mybtn1 checkout-btn">{{ $langg->lang162 }}</button>