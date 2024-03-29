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
            <a href="{{ route('front.cart') }}">
              {{ $langg->lang121 }}
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- Breadcrumb Area End -->

<!-- Cart Area Start -->
<section class="cartpage">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        
        <div class="left-area">
          <div class="cart-table">
            <table class="table">
              @include('includes.form-success')
                <thead>
                    <tr>
                      <th>{{ $langg->lang122 }}</th>
                      <th>{{ $langg->lang123 }}</th>
                      <th>{{ $langg->lang124 }}</th>
                      <th>{{ $langg->lang125 }}</th>
                      <!-- <th>Shipping Cost</th> -->
                      <th>{{ $langg->lang126 }}</th>
                      <th><i class="icofont-close-squared-alt"></i></th>
                    </tr>
                  </thead>
                  <tbody>
                    @if(Session::has('cart'))

                    @foreach($products as $product)
                    <tr class="cremove{{ $product['item']['id'].$product['size'] }}">
                      <td class="product-img">
                        <div class="item">
                          <img src="{{ $product['item']['photo'] ? asset('assets/images/products/'.$product['item']['photo']):asset('assets/images/noimage.png') }}" alt="">
                          <p class="name"><a href="{{ route('front.product', $product['item']['slug']) }}">{{strlen($product['item']['name']) > 35 ? substr($product['item']['name'],0,35).'...' : $product['item']['name']}}</a></p>
                        </div>
                      </td>
                      <td class="size">
                        <div class="item-size">
                          <h6 class="pl-1">{{ $product['size'] }}</h6>
                        </div>
                        <div class="item-color">
                              <input type="hidden" value="{{$product['item']['id'].$product['size']}}">
                                @if(!empty($product['item']['color']))
      <select class="color" style="width: 50px; background: {{$product['color']}};">
                                  @foreach($product['item']['color'] as $color)
                                    <option value="{{$color}}" {{$color == $product['color'] ? "selected":""}} style="background: {{$color}};"></option>                                
                                   @endforeach
      </select>
                                @else
                                <input type="hidden" id="color{{$product['item']['id']}}" value="">
                                @endif
                        </div>
                      </td>

                      <td class="quantity">
          @if($product['item']['type'] == 'Physical')

                          <div class="qty">
                              <ul>
              <input type="hidden" class="prodid" value="{{$product['item']['id']}}">  
              <input type="hidden" class="itemid" value="{{$product['item']['id'].$product['size']}}">     
              <input type="hidden" class="size_qty" value="{{$product['size_qty']}}">     
              <input type="hidden" class="size_price" value="{{$product['size_price']}}">   
                                <li>
                                  <span class="qtminus1 reducing">
                                    <i class="icofont-minus"></i>
                                  </span>
                                </li>
                                <li>
                                  <span class="qttotal1" id="qty{{$product['item']['id'].$product['size']}}">{{ $product['qty'] }}</span>
                                </li>
                                <li>
                                  <span class="qtplus1 adding">
                                    <i class="icofont-plus"></i>
                                  </span>
                                </li>
                              </ul>
                          </div>
        @endif
                      </td>

                            @if($product['size_qty'])
                            <input type="hidden" id="stock{{$product['item']['id'].$product['size']}}" value="{{$product['size_qty']}}">
                            @elseif($product['item']['type'] != 'Physical') 
                            <input type="hidden" id="stock{{$product['item']['id'].$product['size']}}" value="1">
                            @else
                            <input type="hidden" id="stock{{$product['item']['id'].$product['size']}}" value="{{$product['stock']}}">
                            @endif
                      <td class="unit-price">
                        <p>
                          {{ App\Models\Product::convertPrice($product['item']['price']) }}                       
                        </p>
                      </td>
                      <!-- <td class="unit-price">
                        <p>
                          <?php 
                            $product_pincodes = Session::get('product_pincode');
                            $product_pincode = 0;
                            if (isset($product_pincodes[$product['item']['id']] ) )
                              $product_pincode = $product_pincodes[$product['item']['id']];
                          
                              $shipping_cost = App\Models\Product::shippingCost($product['item']['user_id'], $product_pincode);
                              echo $shipping_cost;
                          ?>
                          
                        </p>
                      </td> -->
                      <td class="total-price">
                        <p id="prc{{$product['item']['id'].$product['size']}}">
                          {{ 
                            App\Models\Product::convertPrice($product['price'])
                          }}                 
                        </p>
                      </td>
                      <td>
                        <span class="removecart cart-remove" data-class="cremove{{ $product['item']['id'].$product['size'] }}" data-href="{{ route('product.cart.remove',$product['item']['id'].$product['size']) }}"><i class="icofont-ui-delete"></i> </span>
                      </td>
                    </tr>
                    @endforeach
                    @endif
                  </tbody>
            </table>
          </div>
        </div>
      </div>
      @if(Session::has('cart'))
      <div class="col-lg-4">
        <div class="right-area">
          <div class="order-box">
            <h4 class="title">{{ $langg->lang127 }}</h4>
            <ul class="order-list">
              <li>
                <p>
                  {{ $langg->lang128 }}
                </p>
                <P>
                  <b class="cart-total">{{ Session::has('cart') ? App\Models\Product::convertPrice($totalPrice) : '0.00' }}</b>
                </P>
              </li>
              <li>
                <p>
                  {{ $langg->lang129 }}
                </p>
                <P>
                  <b class="discount">{{ App\Models\Product::convertPrice(0)}}</b>
                  <input type="hidden" id="d-val" value="{{ App\Models\Product::convertPrice(0)}}">
                </P>
              </li>
              <li>
                <p>
                  {{ $langg->lang130 }}
                </p>
                <P>
                  <b>{{$tx}}%</b>
                </P>
              </li>
            </ul>
            <div class="total-price">
              <p>
                  {{ $langg->lang131 }}
              </p>
              <p>
                  <span class="main-total">{{ Session::has('cart') ? App\Models\Product::convertPrice($mainTotal) : '0.00' }}</span>
              </p>
            </div>
            <div class="cupon-box">
              <div id="coupon-link">
                  {{ $langg->lang132 }}
              </div>
              <form id="coupon-form" class="coupon">
                <input type="text" placeholder="{{ $langg->lang133 }}" id="code" required="" autocomplete="off">
                <input type="hidden" class="coupon-total" id="grandtotal" value="{{ Session::has('cart') ? App\Models\Product::convertPrice($mainTotal) : '0.00' }}">
                <button type="submit">{{ $langg->lang134 }}</button>
              </form>
            </div>
            <a href="{{ route('front.checkout') }}" class="order-btn">
              {{ $langg->lang135 }}
            </a>
          </div>
        </div>
      </div>
      @endif
    </div>
  </div>
</section>
<!-- Cart Area End -->
@endsection 