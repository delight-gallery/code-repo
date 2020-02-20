@extends('layouts.admin')

@section('styles')

<style type="text/css">
    .table-responsive {
    overflow-x: hidden;
}
table#example2 {
    margin-left: 10px;
}

</style>

@endsection

@section('content')

                    <div class="content-area">
                        <div class="mr-breadcrumb">
                            <div class="row">
                                <div class="col-lg-12">
                                        <h4 class="heading">Vendor Details <a class="add-btn" href="{{ url()->previous() }}"><i class="fas fa-arrow-left"></i> Back</a></h4>
                                        <ul class="links">
                                            <li>
                                                <a href="{{ route('admin.dashboard') }}">Dashboard </a>
                                            </li>
                                            <li>
                                                <a href="{{ route('admin-vendor-index') }}">Vendors</a>
                                            </li>
                                            <li>
                                                <a href="{{ route('admin-vendor-show',$data->id) }}">Details</a>
                                            </li>
                                        </ul>
                                </div>
                            </div>
                        </div>
                            <div class="add-product-content customar-details-area">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="product-description">
                                            <div class="body-area">
                                            <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="user-image">
                                                            @if($data->is_provider == 1)
                                                            <img src="{{ $data->photo ? asset($data->photo):asset('assets/images/noimage.png')}}" alt="No Image">
                                                            @else
                                                            <img src="{{ $data->photo ? asset('assets/images/users/'.$data->photo):asset('assets/images/noimage.png')}}" alt="No Image">                                            
                                                            @endif
                                                        <a href="javascript:;" class="mybtn1 send" data-email="{{ $data->email }}" data-toggle="modal" data-target="#vendorform">Send Message</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                    <div class="table-responsive show-table">
                                                        <table class="table">
                                                        <tr>
                                                            <th>Vendor ID#</th>
                                                            <td>{{$data->id}}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Store Name</th>
                                                            <td>{{ $data->shop_name }}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Owner Name</th>
                                                            <td>{{ $data->owner_name }}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Email</th>
                                                            <td>{{ $data->email }}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Shop Number</th>
                                                            <td>{{ $data->shop_number }}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Registration Number</th>
                                                            <td>{{ $data->reg_number }}</td>
                                                        </tr>

                                                        <tr>
                                                            <th >Shop Address</th>
                                                            <td>{{ $data->shop_address }}</td>
                                                        </tr>
                                                        
                                                        </table>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                    <div class="table-responsive show-table">
                                                    <table class="table">

                                                        <tr>
                                                            <th>Message</th>
                                                            <td>{{ $data->shop_message }}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Total Product(s)</th>
                                                            <td>{{ $data->products()->count() }}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Joined</th>
                                                            <td>{{ $data->created_at->diffForHumans() }}</td>
                                                        </tr>
                                                        <tr>
                                                            <th width="35%">Shop Details</th>
                                                            <td>{!! $data->shop_details !!}</td>
                                                        </tr>
                                                        <tr>
                                                            <th width="35%">GST</th>
                                                            <td>{!! $data->gstin !!}</td>
                                                        </tr>
                                                        <tr>
                                                            <th width="35%">Reg Documents</th>
                                                            <td>{!! $data->documents !!}</td>
                                                        </tr>



                                                        </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order-table-wrap">
                                                <div class="order-details-table">
                                                    <div class="mr-table">
                                                        <h4 class="title">Products Added</h4>
                                                        <div class="table-responsive">
                                                                <table id="example2" class="table table-hover dt-responsive" cellspacing="0" width="100%">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Product ID</th>
                                                                            <th>Type</th>
                                                                            <th>Stock</th>
                                                                            <th>Price</th>
                                                                            <th>Status</th>
                                                                            <th></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        @foreach($data->products as $dt)
                                                                        <tr>
                                                                        <td><a href="{{ route('front.product', $dt->slug) }}" target="_blank">{{ sprintf("%'.08d",$dt->id) }}</a></td>
                                                                            <td>{{ $dt->type }}</td>
                                                                            @php 
                                                                            $stck = (string)$dt->stock;
                                                                            if($stck == "0")
                                                                            $stck = "Out Of Stock";
                                                                            elseif($stck == null)
                                                                            $stck = "Unlimited";
                                                                            @endphp
                                                                            <td>{{ $stck  }}</td>
                                                                            <td>{{  App\Models\Product::convertPrice($dt->price) }}</td>
                                                                            <td>
                                                                                <div class="action-list">
                                                                                <select class="process select droplinks {{ $dt->status == 1 ? 'drop-success' : 'drop-danger' }}">
                                                                                    <option data-val="1" value="{{ route('admin-prod-status',['id1' => $data->id, 'id2' => 1]) }}" {{ $dt->status == 1 ? 'selected' : '' }}>Active</option>
                                                                                    <<option data-val="0" value="{{ route('admin-prod-status',['id1' => $data->id, 'id2' => 0]) }}" {{ $dt->status == 0 ? 'selected' : '' }}>Deactive</option>
                                                                                </select>
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <a href=" {{ route('admin-prod-edit',$dt->id) }}" class="view-details">
                                                                                    <i class="fas fa-eye"></i>Details
                                                                                </a>
                                                                            </td>
                                                                        </tr>
                                                                        @endforeach
                                                                        
                                                                    </tbody>
                                                                </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

{{-- MESSAGE MODAL --}}
<div class="sub-categori">
    <div class="modal" id="vendorform" tabindex="-1" role="dialog" aria-labelledby="vendorformLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="vendorformLabel">Send Message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                </div>
            <div class="modal-body">
                <div class="container-fluid p-0">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="contact-form">
                                <form id="emailreply1">
                                    {{csrf_field()}}
                                    <ul>
                                        <li>
                                            <input type="email" class="input-field eml-val" id="eml1" name="to" placeholder="Email *" value="" required="">
                                        </li>
                                        <li>
                                            <input type="text" class="input-field" id="subj1" name="subject" placeholder="Subject *" required="">
                                        </li>
                                        <li>
                                            <textarea class="input-field textarea" name="message" id="msg1" placeholder="Your Message *" required=""></textarea>
                                        </li>
                                    </ul>
                                    <button class="submit-btn" id="emlsub1" type="submit">Send Message</button>
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

<script type="text/javascript">
$('#example2').dataTable( {
  "ordering": false,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : false,
      'info'        : false,
      'autoWidth'   : false,
      'responsive'  : true
} );
</script>

@endsection
