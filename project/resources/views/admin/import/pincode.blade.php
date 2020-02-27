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
										<h4 class="heading">Pincode</h4>
										<ul class="links">
											<li>
												<a href="{{ route('admin.dashboard') }}">Dashboard </a>
											</li>
											<li>
												<a href="javascript:;">Import</a>
											</li>
											<li>
												<a href="{{ route('admin-import-pincode') }}">Pincode</a>
											</li>
										</ul>
								</div>
							</div>
						</div>
						<div class="product-area">
							<div class="row">
								<div class="col-lg-12">
									<div class="mr-table allproduct">
										<form method="post" id="search-form" action="{{ route('admin-pincode-excel') }}" enctype="multipart/form-data">
											{{ csrf_field() }}
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                            	<label>Choose excel file</label>
                                                                <input type="file" name="excel" class="form-control">
                                                            </div>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                	<div class="row">
                                                    	<button type="submit" class="btn btn-primary float-right">Import</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
										@include('includes.admin.form-success') 
										<div class="table-responsiv">
												<table id="geniustable" class="table table-hover dt-responsive" cellspacing="0" width="100%">
													<thead>
														<tr>
														  <th>Pincode</th>
		                                                  
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
                    'url':'{{ route('admin-pincode-datatables') }}',
                    'data': function(d) {
                        // d.form = $('#search-form').serialize();
                    }
               },
               columns: [
                        { data: 'pincode', name: 'pincode' },
                     ],
               language : {
                	processing: '<img src="{{asset('assets/images/'.$gs->admin_loader)}}">'
                },
				drawCallback : function( settings ) {
				}
            });

	    															
    </script>

{{-- DATA TABLE --}}
    
@endsection   