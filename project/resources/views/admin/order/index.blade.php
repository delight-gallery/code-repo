@extends('layouts.admin') 

@section('styles')

<link href="{{asset('assets/admin/css/jquery-ui.css')}}" rel="stylesheet" type="text/css">
<style type="text/css">
  .dataTables_filter{
    display: none;
  }
  .list{
    display: none;
  }
  .process::after{
    display: none;
  }
</style>

@endsection

@section('content')  
                    <div class="content-area">
                        <div class="mr-breadcrumb">
                            <div class="row">
                                <div class="col-lg-12">
                                        <h4 class="heading">All Orders</h4>
                                        <ul class="links">
                                            <li>
                                                <a href="{{ route('admin.dashboard') }}">Dashboard </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">Orders</a>
                                            </li>
                                            <li>
                                                <a href="{{ route('admin-order-index') }}">All Orders</a>
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
                                                        <input type="text" name="vendor" class="form-control" placeholder="Vendor">
                                                    </div>
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
                                                        <input type="text" name="deliverydate" class="form-control" placeholder="Delivery date">
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
                                        @include('includes.admin.form-success') 
                                        <div class="table-responsiv">
                                        <div class="gocover" style="background: url({{asset('assets/images/'.$gs->admin_loader)}}) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
                                                <table id="geniustable" class="table table-hover dt-responsive" cellspacing="0" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th>Customer Email</th>
                                                            <th>Invoice Number</th>
                                                            <th>Total Qty</th>
                                                            <th>Total Cost</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>
                                                </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

{{-- ORDER MODAL --}}

<div class="modal fade" id="confirm-delete1" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
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
        <p class="text-center">You are about to update the order's Status.</p>
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



{{-- MESSAGE MODAL --}}
<div class="sub-categori">
    <div class="modal" id="vendorform" tabindex="-1" role="dialog" aria-labelledby="vendorformLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="vendorformLabel">Send Email</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                </div>
            <div class="modal-body">
                <div class="container-fluid p-0">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="contact-form">
                                <form id="emailreply">
                                    {{csrf_field()}}
                                    <ul>
                                        <li>
                                            <input type="email" class="input-field eml-val" id="eml" name="to" placeholder="Email *" value="" required="">
                                        </li>
                                        <li>
                                            <input type="text" class="input-field" id="subj" name="subject" placeholder="Subject *" required="">
                                        </li>
                                        <li>
                                            <textarea class="input-field textarea" name="message" id="msg" placeholder="Your Message *" required=""></textarea>
                                        </li>
                                    </ul>
                                    <button class="submit-btn" id="emlsub" type="submit">Send Email</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>

{{-- MESSAGE MODAL ENDS --}}
@endsection    

@section('scripts')

{{-- DATA TABLE --}}

    <script type="text/javascript">

        var table = $('#geniustable').DataTable({
               ordering: true,
               processing: true,
               serverSide: true,
               ajax:{
                    'url':'{{ route('admin-order-datatables','none') }}',
                    'data': function(d) {
                        d.form = $('#search-form').serialize();
                    }
               },
               columns: [
                        { data: 'customer_email', name: 'customer_email' },
                        { data: 'id', name: 'id' },
                        { data: 'totalQty', name: 'totalQty' },
                        { data: 'pay_amount', name: 'pay_amount' },
                        { data: 'action', searchable: false, orderable: false }
                     ],
                language : {
                    processing: '<img src="{{asset('assets/images/'.$gs->admin_loader)}}">'
                },
                drawCallback : function( settings ) {
                        $('.select').niceSelect();  
                }
            });

        $('#search').on('click',function() {
            table.draw();
        });

        $('.datepicker').datepicker({'dateFormat':'dd-mm-yy'});

        $('[name=category]').on('change', function(){
            category_id = $(this).val();
            $.ajax({
                url: '{{ route('admin-subcat-load','') }}/'+category_id,
                success: function(resp) {
                    $('[name=subcategory]').html(resp);
                }
            });
        });

        $('[name=subcategory]').on('change', function(){
            category_id = $(this).val();
            $.ajax({
                url: '{{ route('admin-childcat-load','') }}/'+category_id,
                success: function(resp) {
                    $('[name=childcategory]').html(resp);
                }
            });
        });
                                                                
    </script>

{{-- DATA TABLE --}}
    
@endsection   