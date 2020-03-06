@extends('layouts.admin') 

@section('styles')

<link href="{{asset('assets/admin/css/jquery-ui.css')}}" rel="stylesheet" type="text/css">
<style type="text/css">
  .dataTables_filter{
    display: none;
  }
</style>


@endsection

@section('content')  
					<div class="content-area">
						<div class="mr-breadcrumb">
							<div class="row">
								<div class="col-lg-12">
										<h4 class="heading">Pending Payment</h4>
										<ul class="links">
											<li>
												<a href="{{ route('admin.dashboard') }}">Dashboard </a>
											</li>
											<li>
												<a href="javascript:;">Report</a>
											</li>
											<li>
												<a href="{{ route('admin-report-pending-payment') }}">Pending Payment</a>
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
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <input type="text" name="fromdate" class="form-control datepicker" placeholder="From date">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <input type="text" name="todate" class="form-control datepicker" placeholder="To date">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                	<div class="row">
                                                    	<button type="button" id="search" class="btn btn-primary float-right">Search</button>
                                                    </div>
                                                    	<a style="float:right !important;" href="{{ route('report-pending-payment-download') }}" id="download-excel" class="btn btn-dark">Download Excel</a>
                                                </div>
                                            </div>
                                        </form>
										@include('includes.admin.form-success') 
										<div class="table-responsiv">
												<table id="geniustable" class="table table-hover dt-responsive" cellspacing="0" width="100%">
													<thead>
														<tr>
														  <th>Vendor</th>
		                                                  <th>Order No</th>
		                                                  <th>Invoice No</th>
		                                                  <th>Customer</th>
		                                                  <th>Payment Amount</th>
		                                                  <th>Payment Method</th>
		                                                  <th>Order Date</th>
		                                                  <th>Payment Status</th>
														</tr>
													</thead>
												</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


@endsection    

@section('scripts')

{{-- DATA TABLE --}}

	<script type="text/javascript">

    	var table = $('#geniustable').DataTable({
			   ordering: false,
               processing: true,
               serverSide: true,
               ajax:{
                    'url':'{{ route('report-pending-payment-datatables') }}',
                    'data': function(d) {
                        d.form = $('#search-form').serialize();
                    }
               },
               columns: [
                        { data: 'vendor', name: 'vendor' },
                        { data: 'order_number', name: 'order_number' },
                        { data: 'invoice_number', name: 'invoice_number' },
                        { data: 'customer', name: 'customer' },
                        { data: 'pay_amount', name: 'pay_amount' },
                        { data: 'method', name: 'method' },
                        { data: 'created_at', name: 'created_at' },
                        { data: 'payment_status', name: 'payment_status' },
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

		$('.select1').niceSelect();	

		$('#download-excel').on('click',function() {

		});
	    															
    </script>

{{-- DATA TABLE --}}
    
@endsection   