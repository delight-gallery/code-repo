@extends('layouts.load')

@section('content')

            <div class="content-area">

              <div class="add-product-content">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="product-description">
                      <div class="body-area">
                        @include('includes.admin.form-error')  
                      <form id="geniusformdata" action="{{route('admin-vendor-create')}}" method="POST" enctype="multipart/form-data">
                        {{csrf_field()}}

                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading">Name *</h4>
                               </div>
                          </div>
                          <div class="col-lg-7">
                            <input type="text" class="input-field" name="name" placeholder="Enter Name" required="" value="">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading">Email *</h4>
                               </div>
                          </div>
                          <div class="col-lg-7">
                            <input type="text" class="input-field" name="email" placeholder="Enter Email" required value="">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading">Mobile *</h4>
                               </div>
                          </div>
                          <div class="col-lg-7">
                            <input type="text" class="input-field" name="phone" placeholder="Enter Phone" required value="">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading">GST *</h4>
                               </div>
                          </div>
                          <div class="col-lg-7">
                            <input type="text" class="input-field" name="gst" placeholder="Enter GST" required value="">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                                <h4 class="heading">Registration Document *</h4>
                               </div>
                          </div>
                          <div class="col-lg-4">
                            <input type="text" class="input-field" name="item-name" placeholder="Enter Document name" required value="">
                          </div>
                          <div class="col-lg-4">
                            <input type="file" class="input-field" name="file" placeholder="Document upload" required value="">
                          </div>
                        </div>
                        
                        

                        

                        <br>
                        <div class="row">
                          <div class="col-lg-4">
                            <div class="left-area">
                              
                            </div>
                          </div>
                          <div class="col-lg-7">
                            <button class="addProductSubmit-btn" type="submit">Create Vendor</button>
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