@extends('layouts.admin') 

@section('styles')

<style type="text/css">

</style>

@endsection

@section('content')  
					<div class="content-area">
						<div class="mr-breadcrumb">
							<div class="row">
								<div class="col-lg-12">
										<h4 class="heading">Payment</h4>
										<ul class="links">
											<li>
												<a href="{{ route('admin.dashboard') }}">Dashboard </a>
											</li>
											<li>
												<a href="javascript:;">Report</a>
											</li>
											<li>
												<a href="{{ route('admin-report-payment') }}">Payment</a>
											</li>
										</ul>
								</div>
							</div>
						</div>
						<div class="product-area">
							<div class="row">
								<div class="col-lg-12">
									<div class="mr-table allproduct">
										@include('includes.admin.form-success') 
										<div class="table-responsiv">
												<table id="geniustable" class="table table-hover dt-responsive" cellspacing="0" width="100%">
													<thead>
														<tr>
		                                                  <th>Order No</th>
		                                                  <th>Payment Amount</th>
		                                                  <th>Order Method</th>
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
                    'url':'{{ route('report-payment-datatables') }}',
                    'data': function(d) {
                        d.form = $('#search-form').serialize();
                    }
               },
               columns: [
                        { data: 'order_number', name: 'order_number' },
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

		$("[name=status]").on('change',function(){
			table.draw();
		});

		$('.select1').niceSelect();	
	    															
    </script>

{{-- DATA TABLE --}}
    
@endsection   