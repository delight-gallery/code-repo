@extends('layouts.admin')
        
@section('content')
        <div class="content-area">
<div class="mr-breadcrumb">
                        <div class="row">
                            <div class="col-lg-12">
                                <h4 class="heading">Order Invoice <a class="add-btn" href="javascript:history.back();"><i class="fas fa-arrow-left"></i> Back</a></h4>
                                <ul class="links">
                                    <li>
                                        <a href="{{ route('admin.dashboard') }}">Dashboard </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Orders</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Invoice</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="order-table-wrap">
                        <div class="invoice-wrap">
                            <div class="invoice__title">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="invoice__logo text-left">
                                            <img src="{{ asset('assets/images/'.$gs->logo) }}"
                                                alt="woo commerce logo">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row invoice__metaInfo">
                                <div class="col-lg-4 col-md-6">
                                                        <div class="buyer">
                                                            <p class="font-weight-bold">Billing Address</p>
                                                            <strong>{{$order->customer_name}}</strong>
                                                            <address>
                                                                {{$order->customer_address}}<br>
                                                                {{$order->customer_city}}<br>
                                                                {{$order->customer_country}}<br>
                                                            </address>
                                                        </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                                        <div class="invoce__date">
                                                            <strong>Invoice Number</strong>
                                                            <p>Order Date</p>
                                                            <p>Order ID</p>
                                                        </div>
                                </div>  
                                <div class="col-lg-4 col-md-6">
                                                        <div class="invoce__number">
                                                            <strong>{{sprintf("%'.08d", $order->id)}}</strong>
                                                            <p>{{date('d-M-Y',strtotime($order->created_at))}}</p>
                                                            <p>{{$order->order_number}}</p>
                                                        </div>
                                </div>
                                        

                                        
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="invoice_table">
                                            <div class="mr-table">
                                                    <div class="table-responsive">
                                                            <table id="example2" class="table table-hover dt-responsive" cellspacing="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Product</th>
                                                                        <th>Size</th>
                                                                        <th>Color</th>
                                                                        <th>Price</th>
                                                                        <th>Quantity</th>
                                                                        <th>Line Total</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                    @php
                                    $subtotal = 0;
                                    $tax = 0;
                                    @endphp                                   
                                @foreach($cart->items as $product)
                                    <tr>
                                            <td>
                                                @if($product['item']['user_id'] != 0)
                                                @php
                                                $user = App\Models\User::find($product['item']['user_id']);
                                                @endphp
                                                @if(isset($user))
                                              <a target="_blank" href="{{ route('front.product', $product['item']['slug']) }}">{{strlen($product['item']['name']) > 45 ? substr($product['item']['name'],0,45).'...' : $product['item']['name']}}</a>
                                                @else
                                                <a href="javascript:;">{{strlen($product['item']['name']) > 45 ? substr($product['item']['name'],0,45).'...' : $product['item']['name']}}</a>
                                                @endif
                                                @endif
                                            </td>
                                            <td>{{$product['size']}}</td>
                                            <td><span style="float: right; width: 40px; height: 20px; display: block; background: {{$product['color']}};"></span></td>
                                            <td>{{$order->currency_sign}}{{ round($product['item']['price'] * $order->currency_value , 2) }}</td>
                                            <td>{{$product['qty']}} {{ $product['item']['measure'] }}</td>
                                            <td>{{$order->currency_sign}}{{ round($product['price'] * $order->currency_value , 2) }}</td>
                                            @php
                                            $subtotal += round($product['price'] * $order->currency_value, 2);
                                            @endphp

                                    </tr>

                                @endforeach
                                                                </tbody>
                                                                
                                                            <tfoot>
                                                              <tr>
                                                                <td colspan="5">Subtotal</td>
                                                                <td>{{$order->currency_sign}}{{ round($subtotal, 2) }}</td>
                                                              </tr>
                                                              @if($order->shipping_cost != 0)
                                                              <tr>
                                                                <td colspan="5">Shipping Cost({{$order->currency_sign}})</td>
                                                                <td>{{ round($order->shipping_cost , 2) }}</td>
                                                              </tr>
                                                              @endif
                                                              @if($order->tax != 0)
                                                              <tr>
                                                                <td colspan="5">TAX({{$order->currency_sign}})</td>
                                                                @php 
                                                                $subtotal = $subtotal + $order->shipping_cost;
                                                                $tax = ($subtotal / 100) * $order->tax;
                                                                @endphp
                                                                <td>{{round($tax, 2)}}</td>
                                                              </tr>
                                                              @endif
                                                              @if($order->coupon_discount != null)
                                                              <tr>
                                                                <td colspan="5">Coupon Discount({{$order->currency_sign}})</td>
                                                                <td>{{round($order->coupon_discount, 2)}}</td>
                                                              </tr>
                                                              @endif
                                                              <tr>
                                                                <td colspan="4"></td>
                                                                <td>Total</td>
                                                                <td>{{$order->currency_sign}}{{ round($order->pay_amount * $order->currency_value , 2) }}</td>
                                                              </tr>
                                                            </tfoot> 
                                                            </table>
                                                    </div>
                                                </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="invoice__orderDetails">
                                                        <p><strong>Order Details</strong></p>
                                            @if($order->dp == 0)
                                                <p>Shipping Method:   
                                                    @if($order->shipping == "pickup")
                                                        Pick Up
                                                    @else
                                                        Ship To Address
                                                    @endif
                                                </p>
                                            @endif
                                                        <p>Payment Method: {{$order->method}}</p>
                                                    </div>
                                                </div>
                            </div>

                            <div class="row">
                                                <div class="col-sm-6">
                                                @if($order->dp == 0)
                                                    <div class="invoice__shipping">
                                                        <p style="text-align: left;"><strong>Shipping Address</strong></p>
                                                        <p style="text-align: left;">{{$order->shipping_name == null ? $order->customer_name : $order->shipping_name}}</p>
                                                        <address>
                                                            {{$order->shipping_address == null ? $order->customer_address : $order->shipping_address}}<br>
                                                            {{$order->shipping_city == null ? $order->customer_city : $order->shipping_city}}<br>
                                                            {{$order->shipping_country == null ? $order->customer_country : $order->shipping_country}}<br>
                                                        </address>
                                                    </div>
                                                @endif
                                                </div>
                                <div class="col-sm-6 text-right">
                                    <a class="btn  add-newProduct-btn print"
                                        href="{{route('admin-order-print',$order->id)}}"
                                        target="_blank"><i class="fa fa-print"></i> Print Invoice</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Main Content Area End -->
            </div>
        </div>
        </div>

@endsection