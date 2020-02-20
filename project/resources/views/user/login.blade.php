@extends('layouts.front')
@section('content')

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <ul class="pages">
          <li>
            <a href="{{ route('front.index') }}">
              {{ $langg->lang17 }}
            </a>
          </li>
          <li>
            <a href="{{ route('user.login') }}">
              {{ $langg->lang171 }}
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- Breadcrumb Area End -->


<section class="login-signup">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-5">
        <div class="login-area">
          <div class="header-area">
            <h4 class="title">{{ $langg->lang172 }}</h4>
          </div>
          <div class="login-form signin-form">
                @include('includes.admin.form-login')
            <form id="loginform" action="{{ route('user.login.submit') }}" method="POST">
              {{ csrf_field() }}
              <div class="form-input">
                <input type="email" name="email" placeholder="{{ $langg->lang173 }}" required="">
                <i class="icofont-user-alt-5"></i>
              </div>
              <div class="form-input">
                <input type="password" class="Password" name="password" placeholder="{{ $langg->lang174 }}" required="">
                <i class="icofont-ui-password"></i>
              </div>
              <div class="form-forgot-pass">
                <div class="left">
                  <input type="checkbox" name="remember"  id="rp" {{ old('remember') ? 'checked' : '' }}>
                  <label for="rp">{{ $langg->lang175 }}</label>
                </div>
                <div class="right">
                  <a href="{{ route('user-forgot') }}">
                    {{ $langg->lang176 }}
                  </a>
                </div>
              </div>
              <input id="authdata" type="hidden"  value="{{ $langg->lang177 }}">
              <button type="submit" class="submit-btn">{{ $langg->lang178 }}</button>
              @if(App\Models\Socialsetting::find(1)->f_check == 1 || App\Models\Socialsetting::find(1)->g_check == 1)
              <div class="social-area">
                  <h3 class="title">{{ $langg->lang179 }}</h3>
                  <p class="text">{{ $langg->lang180 }}</p>
                  <ul class="social-links">
                    @if(App\Models\Socialsetting::find(1)->f_check == 1)
                    <li>
                      <a href="{{ route('social-provider','facebook') }}"> 
                        <i class="fab fa-facebook-f"></i>
                      </a>
                    </li>
                    @endif
                    @if(App\Models\Socialsetting::find(1)->g_check == 1)
                    <li>
                      <a href="{{ route('social-provider','google') }}">
                        <i class="fab fa-google-plus-g"></i>
                      </a>
                    </li>
                    @endif
                  </ul>
              </div>
              @endif
            </form>
          </div>
        </div>
      </div>


            <div class="col-lg-5">
                <div class="login-area signup-area">
                    <div class="header-area">
                        <h4 class="title">{{ $langg->lang181 }}</h4>
                    </div>
                    <div class="login-form signup-form">
                       @include('includes.admin.form-login')
                        <form id="registerform" action="{{route('user-register-submit')}}" method="POST">
                          {{ csrf_field() }}

                            <div class="form-input">
                                <input type="text" class="User Name" name="name" placeholder="{{ $langg->lang182 }}" required="">
                                <i class="icofont-user-alt-5"></i>
                            </div>

                            <div class="form-input">
                                <input type="email" class="User Name" name="email" placeholder="{{ $langg->lang183 }}" required="">
                                <i class="icofont-email"></i>
                            </div>

                            <div class="form-input">
                                <input type="text" class="User Name" name="phone" placeholder="{{ $langg->lang184 }}" required="">
                                <i class="icofont-phone"></i>
                            </div>

                            <div class="form-input">
                                <input type="text" class="User Name" name="address" placeholder="{{ $langg->lang185 }}" required="">
                                <i class="icofont-location-pin"></i>
                            </div>

                            <div class="form-input">
                                <input type="password" class="Password" name="password" placeholder="{{ $langg->lang186 }}" required="">
                                <i class="icofont-ui-password"></i>
                            </div>

                            <div class="form-input">
                                <input type="password" class="Password" name="password_confirmation" placeholder="{{ $langg->lang187 }}" required="">
                                <i class="icofont-ui-password"></i>
                            </div>

                            <ul class="captcha-area">
                              <li>
                                <p><img class="codeimg1" src="{{asset("assets/images/capcha_code.png")}}" alt=""> <i class="fas fa-sync-alt pointer refresh_code "></i></p>
                                        
                              </li>
                            </ul>

                            <div class="form-input">
                                <input type="text" class="Password" name="codes" placeholder="{{ $langg->lang51 }}" required="">
                                <i class="icofont-refresh"></i>
                            </div>


                            <input id="processdata" type="hidden"  value="{{ $langg->lang188 }}">
                            <button type="submit" class="submit-btn">{{ $langg->lang189 }}</button>
                        
                        </form>
                    </div>
                </div>
            </div>



    </div>
  </div>
</section>

@endsection