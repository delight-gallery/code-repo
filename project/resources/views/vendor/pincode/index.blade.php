@extends('layouts.vendor')

@section('styles')
<link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />
@endsection


@section('content')
<input type="hidden" id="headerdata" value="Group Pincode">
<div class="content-area">
	<div class="mr-breadcrumb">
		<div class="row">
			<div class="col-lg-12">
					<h4 class="heading">Group Pincode</h4>
				<ul class="links">
					<li>
						<a href="{{ route('vendor-dashboard') }}">Dashboard </a>
					</li>
					<li>
						<a href="javascript:;">Settings </a>
					</li>
					<li>
						<a href="{{ route('vendor-pincode-index') }}">Pincode</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="table-responsiv">
								<table id="geniustable" class="table table-hover dt-responsive" cellspacing="0" width="100%">
									<thead>
										<tr>
										  <th>Pincodes</th>
	                                      <th>Group Name</th>
	                                      <th>Shipping Cost</th>
	                                      <th>Action</th>
										</tr>
									</thead>
								</table>
						</div>
	
</div>


{{-- ADD / EDIT MODAL --}}

<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="submit-loader">
				<img  src="{{asset('assets/images/'.$gs->admin_loader)}}" alt="">
			</div>
			<div class="modal-header">
			<h5 class="modal-title"></h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			</div>
			<div class="modal-body">

			</div>
			<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

{{-- ADD / EDIT MODAL ENDS --}}



{{-- DELETE MODAL --}}

<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

	<div class="modal-header d-block text-center">
		<h4 class="modal-title d-inline-block">Confirm Delete</h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
	</div>

      <!-- Modal body -->
      <div class="modal-body">
            <p class="text-center">You are about to delete this Pincode Group.</p>
            <p class="text-center">Do you want to proceed?</p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer justify-content-center">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <a class="btn btn-danger btn-ok">Delete</a>
      </div>

    </div>
  </div>
</div>

{{-- DELETE MODAL ENDS --}}



@endsection


@section('scripts')

	<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
	<script type="text/javascript">
		
		$("[name='pincodes[]']").select2();

	</script>

	{{-- DATA TABLE --}}

	<script type="text/javascript">

    	var table = $('#geniustable').DataTable({
		   ordering: false,
           processing: true,
           serverSide: true,
           ajax:{
                'url':'{{ route('vendor-pincode-datatables') }}',
                'data': function(d) {
                    // d.form = $('#search-form').serialize();
                }
           },
           columns: [
                    { data: 'pincodes', name: 'pincodes' },
                    { data: 'group_name', name: 'group_name' },
                    { data: 'shipping_cost', name: 'shipping_cost' },
                    { data: 'action', name: 'action' },
                 ],
           language : {
            	processing: '<img src="{{asset('assets/images/'.$gs->admin_loader)}}">'
            },
			drawCallback : function( settings ) {
			}
        });

        $(function() {
	        $(".btn-area").append('<div class="col-sm-4 table-contents">'+
	        	'<a class="add-btn" data-href="{{route('vendor-pincode-create')}}" id="add-data" data-toggle="modal" data-target="#modal1">'+
	          '<i class="fas fa-plus"></i> Add New Pincode Group'+
	          '</a>'+
	          '</div>');
	    });	
	    															
    </script>

	{{-- DATA TABLE --}}

	<script type="text/javascript">
		
		

	</script>

@endsection

