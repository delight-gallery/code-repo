@extends('layouts.load')

@section('content')

<div class="add-product-content">
		<div class="row">
			<div class="col-lg-12">
				<div class="product-description">
					<div class="body-area">
						@include('includes.admin.form-error')  
                		<div class="gocover" style="background: url({{asset('assets/images/'.$gs->admin_loader)}}) no-repeat scroll center center rgba(45, 45, 45, 0.5);">
                		</div>
						<form id="geniusformdata" action="{{ route('vendor-pincode-store') }}" method="POST" enctype="multipart/form-data">

							{{csrf_field()}}

					 		@include('includes.vendor.form-both')  

	                        <div class="row">
	                          	<div class="col-lg-4">
	                          		<div class="left-area">
			                            <label>
				                            Pincodes
				                        </label>
				                    </div>
	                          	</div>
	                          	<div class="col-lg-7">
	                          		<select name="pincodes[]" multiple="multiple" required>
	                          			@if(!empty($pincodes))
		                          			@foreach($pincodes as $pincode)
		                          				<option value="{{ $pincode->pincode }}">{{ $pincode->pincode }}</option>
		                          			@endforeach
		                          		@endif
	                          		</select>
	                            </div>
	                        </div>
                        	<div class="row">
                          		<div class="col-lg-4">
                            		<div class="left-area">
                            			<label>Group Name</label>
                            		</div>
                          		</div>
                          		<div class="col-lg-7">
                            		<input class="form-control" type="text" name="group_name" required>
                          		</div>
                        	</div>
                        	<div class="row">
                          		<div class="col-lg-4">
                            		<div class="left-area">
                            			<label>Shipping Cost</label>
                            		</div>
                          		</div>
                          		<div class="col-lg-7">
                            		<input class="form-control" type="number" name="shipping_cost" required>
                          		</div>
                        	</div>
                        	<div class="row">
                          		<div class="col-lg-4">
                            		<div class="left-area">
                            			<label></label>
                            		</div>
                          		</div>
                          		<div class="col-lg-7">
                            		<button class="addProductSubmit-btn" type="submit">Save</button>
                          		</div>
                        	</div>
						</form>


						


					</div>
				</div>
			</div>
		</div>
	</div>



<script type="text/javascript">
	
	$("[name='pincodes[]']").select2();

</script>

@endsection