@extends('layouts.vendor') 

@section('content')  
                    <div class="content-area">
                        <div class="mr-breadcrumb">
                            <div class="row">
                                <div class="col-lg-12">
                                        <h4 class="heading">All Orders</h4>
                                        <ul class="links">
                                            <li>
                                                <a href="{{ route('vendor-dashboard') }}">Dashboard </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">Orders</a>
                                            </li>
                                            <li>
                                                <a href="{{ route('vendor-order-index') }}">All Orders</a>
                                            </li>
                                        </ul>
                                </div>
                            </div>
                        </div>
                        <div class="product-area">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="mr-table allproduct">
                                        <form id="search-form">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    
                                                    <div class="form-group">
                                                        <select name="category" class="form-control">
                                                            <option value="">Category</option>
                                                            @foreach ($categories as $category)
                                                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <select name="subcategory" class="form-control">
                                                            <option value="">Sub Category</option>
                                                        </select>
                                                    </div>
                                                    
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <select name="childcategory" class="form-control">
                                                            <option value="">Child Category</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" name="status" class="form-control" placeholder="Status">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" name="deliverydate" class="form-control datepicker" placeholder="Delivery date">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <input type="text" name="orderfromdate" class="form-control datepicker" placeholder="Order from date">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <input type="text" name="ordertodate" class="form-control datepicker" placeholder="Order to date">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group">
                                                        <input type="text" name="customer" class="form-control" placeholder="Customer">
                                                    </div>
                                                    
                                                    <div class="form-group">
                                                        <input type="text" name="invoiceno" class="form-control" placeholder="Invoice no.">
                                                    </div>
                                                    
                                                    <button type="button" id="search" class="btn btn-primary float-right">Search</button>
                                                </div>
                                            </div>
                                        </form>
                            
                                        @include('includes.form-success') 

                                        <div class="table-responsiv">
                                        <div class="gocover" style="background: url({{asset('assets/images/'.$gs->admin_loader)}}) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
                                                <table id="geniustable" class="table table-hover dt-responsive" cellspacing="0" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th>Invoice Number</th>
                                                            <th>Total Qty</th>
                                                            <th>Total Cost</th>
                                                            <th>Payment Method</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>


                                              <tbody>
                                                @foreach($orders as $orderr) 
                                                @php 
                                                $qty = $orderr->sum('qty');
                                                $price = $orderr->sum('price');                                       
                                                @endphp
                    @foreach($orderr as $order)


@php 

  if($user->shipping_cost != 0){
      $price +=  round($user->shipping_cost * $order->order->currency_value , 2);
    }
  if(App\Models\Order::where('order_number','=',$order->order->order_number)->first()->tax != 0){
      $price  += ($price / 100) * App\Models\Order::where('order_number','=',$order->order->order_number)->first()->tax;
    }    

@endphp
                                                        <tr>
                                                    <td> <a href="{{route('vendor-order-invoice',$order->order_number)}}">{{sprintf("%'.08d", $order->order->id)}}</a></td>
                                          <td>{{$qty}}</td>
                                      <td>{{$order->order->currency_sign}}{{round($price * $order->order->currency_value, 2)}}</td>
                                      <td>{{$order->order->method}}</td>
                                      <td>

                                        <div class="action-list">

                                        <a href="{{route('vendor-order-show',$order->order->order_number)}}" class="btn btn-primary product-btn"><i class="fa fa-eye"></i> Details</a>
                                            <select class="vendor-btn {{ $order->status }}">
                                            <option value="{{ route('vendor-order-status',['slug' => $order->order->order_number, 'status' => 'pending']) }}" {{  $order->status == "pending" ? 'selected' : ''  }}>Pending</option>
                                            <option value="{{ route('vendor-order-status',['slug' => $order->order->order_number, 'status' => 'processing']) }}" {{  $order->status == "processing" ? 'selected' : ''  }}>Processing</option>
                                            <option value="{{ route('vendor-order-status',['slug' => $order->order->order_number, 'status' => 'completed']) }}" {{  $order->status == "completed" ? 'selected' : ''  }}>Completed</option>
                                            <option value="{{ route('vendor-order-status',['slug' => $order->order->order_number, 'status' => 'declined']) }}" {{  $order->status == "declined" ? 'selected' : ''  }}>Declined</option>
                                            </select>

                                        </div>

                                        </td>

                                                  </tr>

                                                  @break
                    @endforeach

                                                  @endforeach
                                                  </tbody>
                                                    
                                                </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

{{-- ORDER MODAL --}}

<div class="modal fade" id="confirm-delete2" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <div class="submit-loader">
        <img  src="{{asset('assets/images/'.$gs->admin_loader)}}" alt="">
    </div>
    <div class="modal-header d-block text-center">
        <h4 class="modal-title d-inline-block">Update Status</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>

      <!-- Modal body -->
      <div class="modal-body">
        <p class="text-center">You are about to update the Order's Status.</p>
        <p class="text-center">Do you want to proceed?</p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer justify-content-center">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <a class="btn btn-success btn-ok order-btn">Proceed</a>
      </div>

    </div>
  </div>
</div>

{{-- ORDER MODAL ENDS --}}


@endsection    

@section('scripts')

{{-- DATA TABLE --}}
<script type="text/javascript">

       
        $('.datepicker').datepicker({'dateFormat':'dd-mm-yy'});

        

        
                                                                
    </script>


    <script type="text/javascript">


$('.vendor-btn').on('change',function(){
          $('#confirm-delete2').modal('show');
          $('#confirm-delete2').find('.btn-ok').attr('href', $(this).val());

});

        var table = $('#geniustable').DataTable({
               ordering: false
           });
                                                                
    </script>

{{-- DATA TABLE --}}
    
@endsection   