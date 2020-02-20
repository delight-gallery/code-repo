@extends('layouts.vendor')
@section('content')

                        <div class="content-area">
                            <div class="mr-breadcrumb">
                                <div class="row">
                                    <div class="col-lg-12">
                                            <h4 class="heading">Withdraw Now<a class="add-btn" href="{{ url()->previous() }}"><i class="fas fa-arrow-left"></i> Back</a></h4>
                                            <ul class="links">
                                                <li>
                                                    <a href="{{ route('vendor-dashboard') }}">Dashboard </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">My Withdraws </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">Withdraw</a>
                                                </li>
                                            </ul>
                                    </div>
                                </div>
                            </div>


                            <div class="add-product-content">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="product-description">
                                            <div class="body-area">

                                          <div class="gocover" style="background: url({{asset('assets/images/'.$gs->admin_loader)}}) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>

                                                    @include('includes.admin.form-both') 
                         <form id="geniusform" class="form-horizontal" action="{{route('vendor-wt-store')}}" method="POST" enctype="multipart/form-data">

                                                    {{ csrf_field() }}


                                <div class="item form-group">
                                    <label class="control-label col-sm-4" for="name">Current Balance {{ App\Models\Product::vendorConvertPrice( App\Models\VendorOrder::where('user_id','=',Auth::user()->id)->where('status','=','completed')->sum('price') ) }}</label>
                                </div>

                                <div class="item form-group">
                                    <label class="control-label col-sm-4" for="name">Withdraw Method *

                                    </label>
                                    <div class="col-sm-12">
                                        <select class="form-control" name="methods" id="withmethod" required>
                                            <option value="">Select Withdraw Method</option>
                                            <option value="Paypal">Paypal</option>
                                            <option value="Skrill">Skrill</option>
                                            <option value="Payoneer">Payoneer</option>
                                            <option value="Bank">Bank</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="item form-group">
                                    <label class="control-label col-sm-12" for="name">Withdraw Amount *

                                    </label>
                                    <div class="col-sm-12">
                                        <input name="amount" placeholder="Withdraw Amount" class="form-control"  type="text" value="{{ old('amount') }}" required>
                                    </div>
                                </div>

                                <div id="paypal" style="display: none;">

                                    <div class="item form-group">
                                        <label class="control-label col-sm-12" for="name">Enter Account Email *

                                        </label>
                                        <div class="col-sm-12">
                                            <input name="acc_email" placeholder="Enter Account Email" class="form-control" value="{{ old('email') }}" type="email">
                                        </div>
                                    </div>

                                </div>
                                <div id="bank" style="display: none;">

                                    <div class="item form-group">
                                        <label class="control-label col-sm-12" for="name">Enter IBAN/Account No *

                                        </label>
                                        <div class="col-sm-12">
                                            <input name="iban" value="{{ old('iban') }}" placeholder="Enter IBAN/Account No" class="form-control" type="text">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-sm-12" for="name">Enter IBAN/Account No *

                                        </label>
                                        <div class="col-sm-12">
                                            <input name="acc_name" value="{{ old('accname') }}" placeholder="Enter Account Name" class="form-control" type="text">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-sm-12" for="name">Enter IBAN/Account No *

                                        </label>
                                        <div class="col-sm-12">
                                            <input name="address" value="{{ old('address') }}" placeholder="Enter Address" class="form-control" type="text">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-sm-12" for="name">Enter IBAN/Account No *

                                        </label>
                                        <div class="col-sm-12">
                                            <input name="swift" value="{{ old('swift') }}" placeholder="Enter Swift Code" class="form-control" type="text">
                                        </div>
                                    </div>

                                </div>

                                <div class="item form-group">
                                    <label class="control-label col-sm-12" for="name">Additional Reference(Optional) *

                                    </label>
                                    <div class="col-sm-12">
                                        <textarea class="form-control" name="reference" rows="6" placeholder="Additional Referance(Optional)">{{ old('reference') }}</textarea>
                                    </div>
                                </div>

                                <div id="resp" class="col-md-12">

                                                                            <span class="help-block">
                                <strong>Withdraw Fee $5 and 5% will deduct from your account.</strong>
                            </span>
                                                                    </div>

                                            <hr>
                                            <div class="add-product-footer">
                                                <button name="addProduct_btn" type="submit" class="mybtn1">Withdraw</button>
                                            </div>
                                        </form>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

@endsection

@section('scripts')
<script type="text/javascript">

    $("#withmethod").change(function(){
        var method = $(this).val();
        if(method == "Bank"){

            $("#bank").show();
            $("#bank").find('input, select').attr('required',true);

            $("#paypal").hide();
            $("#paypal").find('input').attr('required',false);

        }
        if(method != "Bank"){
            $("#bank").hide();
            $("#bank").find('input, select').attr('required',false);

            $("#paypal").show();
            $("#paypal").find('input').attr('required',true);
        }
        if(method == ""){
            $("#bank").hide();
            $("#paypal").hide();
            $("#bank").find('input, select').attr('required',false);
             $("#paypal").find('input').attr('required',false);           
        }

    })

</script>
@endsection