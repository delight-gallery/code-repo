@extends('layouts.vendor')
@section('content')

						<div class="content-area">
							<div class="mr-breadcrumb">
								<div class="row">
									<div class="col-lg-12">
											<h4 class="heading">Pincode</h4>

										<ul class="links">
											<li>
												<a href="{{ route('vendor-dashboard') }}">Dashboard </a>
											</li>
											<li>
												<a href="javascript:;">Settings </a>
											</li>
											<li>
												<a href="{{ route('vendor-pincode') }}">Pincode</a>
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
											<form id="geniusform" action="{{ route('vendor-pincode-update') }}" method="POST" enctype="multipart/form-data">
												{{csrf_field()}}


                      						 @include('includes.vendor.form-both')  

						                        <div class="row">
						                          <div class="col-lg-4">
						                            
						                          </div>
						                          <div class="col-lg-7">
						                            <div class="img-upload full-width-img">
						                            	<label for="image-upload" class="img-label" id="image-label">Upload Pincode( comma(,) seperator)</label>
						                                <!--<label for="image-upload" class="img-label" id="image-label"><i class="icofont-upload-alt"></i>Upload Pincode</label>
						                                    <input type="file" name="shop_image" class="img-upload" id="image-upload">-->
						                                  
						                             <textarea rows="6" cols="60" name="pin_code">{{$data->pin_code}}
</textarea>

						                            </div>

						                          </div>
						                        </div>



						                        <div class="row">
						                          <div class="col-lg-4">
						                            <div class="left-area">
						                              
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
						</div>

@endsection