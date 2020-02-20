@extends('layouts.vendor')

@section('content')

<div class="content-area">
            <div class="mr-breadcrumb">
              <div class="row">
                <div class="col-lg-12">
                    <h4 class="heading">Social Links</h4>
                    <ul class="links">
                      <li>
                        <a href="{{ route('vendor-dashboard') }}">Dashboard </a>
                      </li>
                      <li>
                        <a href="javascript:;">Social Settings</a>
                      </li>
                      <li>
                        <a href="{{ route('vendor-social-index') }}">Social Links</a>
                      </li>
                    </ul>
                </div>
              </div>
            </div>
            <div class="social-links-area">
            <div class="gocover" style="background: url({{asset('assets/images/'.$gs->admin_loader)}}) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
              <form id="geniusform" class="form-horizontal" action="{{ route('vendor-social-update') }}" method="POST">   
              {{ csrf_field() }}

              @include('includes.admin.form-both')  

                <div class="row">
                  <label class="control-label col-sm-3" for="facebook">Facebook *</label>
                  <div class="col-sm-6">
                    <input class="form-control" name="f_url" id="facebook" placeholder="http://facebook.com/" required="" type="text" value="{{$data->f_url}}">
                  </div>
                  <div class="col-sm-3">
                    <label class="switch">
                      <input type="checkbox" name="f_check" value="1" {{$data->f_check==1?"checked":""}}>
                      <span class="slider round"></span>
                    </label>
                  </div>
                </div>

                <div class="row">
                  <label class="control-label col-sm-3" for="gplus">Google Plus *</label>
                  <div class="col-sm-6">
                    <input class="form-control" name="g_url" id="gplus" placeholder="http://google.com/" required="" type="text" value="{{$data->g_url}}">
                  </div>
                  <div class="col-sm-3">
                    <label class="switch">
                      <input type="checkbox" name="g_check" value="1" {{$data->g_check==1?"checked":""}}>
                      <span class="slider round"></span>
                    </label>
                  </div>
                </div>

                <div class="row">
                  <label class="control-label col-sm-3" for="twitter">Twitter *</label>
                  <div class="col-sm-6">
                    <input class="form-control" name="t_url" id="twitter" placeholder="http://twitter.com/" required="" type="text" value="{{$data->t_url}}">
                  </div>
                  <div class="col-sm-3">
                    <label class="switch">
                      <input type="checkbox" name="t_check" value="1" {{$data->t_check==1?"checked":""}}>
                      <span class="slider round"></span>
                    </label>
                  </div>
                </div>

                <div class="row">
                  <label class="control-label col-sm-3" for="linkedin">Linkedin *</label>
                  <div class="col-sm-6">
                    <input class="form-control" name="l_url" id="linkedin" placeholder="http://linkedin.com/" required="" type="text" value="{{$data->l_url}}">
                  </div>
                  <div class="col-sm-3">
                    <label class="switch">
                      <input type="checkbox" name="l_check" value="1" {{$data->l_check==1?"checked":""}}>
                      <span class="slider round"></span>
                    </label>
                  </div>
                </div>

                <div class="row">
                  <div class="col-12 text-center">
                    <button type="submit" class="submit-btn">Save</button>
                  </div>
                </div>
              </form>
            </div>
          </div>

@endsection