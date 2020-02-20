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
            <a href="{{ route('payment.return') }}">
              {{ $langg->lang169 }}
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- Breadcrumb Area End -->



<section class="thankyou">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-11">
          <div class="content">
            <div class="icon">
                <i class="icofont-check-circled"></i>
            </div>
            <h4 class="heading">
                {{ $langg->order_title }}
            </h4>
            <p class="text">
                {{ $langg->order_text }}
            </p>
            <a href="{{ route('front.index') }}" class="link">{{ $langg->lang170 }}</a>
          </div>
        </div>
      </div>
    </div>
  </section>

@endsection