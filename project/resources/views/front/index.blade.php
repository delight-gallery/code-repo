@extends('layouts.front')

@section('content')

	@if($ps->slider == 1)

		@if(count($sliders))

			@include('includes.slider-style')

		@endif

	@endif

	@if($ps->slider == 1 || $ps->service == 1)
		<!-- Hero Area Start -->
		<section class="hero-area">
			@if($ps->slider == 1)

				@if(count($sliders))
					<div class="hero-area-slider">
						<div class="intro-carousel">
							@foreach($sliders as $data)
								<div class="intro-content {{$data->position}}" style="background-image: url({{asset('assets/images/sliders/'.$data->photo)}})">
									<div class="container">
										<div class="row">
											<div class="col-lg-12">
												<div class="slider-content">
													<!-- layer 1 -->
													<div class="layer-1">
														<h4 style="font-size: {{$data->subtitle_size}}px; color: {{$data->subtitle_color}}" class="subtitle subtitle{{$data->id}}" data-animation="animated {{$data->subtitle_anime}}">{{$data->subtitle_text}}</h4>
														<h2 style="font-size: {{$data->title_size}}px; color: {{$data->title_color}}" class="title title{{$data->id}}" data-animation="animated {{$data->title_anime}}">{{$data->title_text}}</h2>
													</div>
													<!-- layer 2 -->
													<div class="layer-2">
														<p style="font-size: {{$data->details_size}}px; color: {{$data->details_color}}"  class="text text{{$data->id}}" data-animation="animated {{$data->details_anime}}">{{$data->details_text}}</p>
													</div>
													<!-- layer 3 -->
													<div class="layer-3">
														<a href="{{$data->link}}" target="_blank" class="mybtn1"><span>{{ $langg->lang25 }} <i class="fas fa-chevron-right"></i></span></a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							@endforeach
						</div>
					</div>
				@endif

			@endif

		</section>
		<!-- Hero Area End -->
	@endif


@if($ps->small_banner == 1)

		<!-- Banner Area One Start -->
		<section class="banner-section">
			<div class="container">
				@foreach($top_small_banners->chunk(2) as $chunk)
					<div class="row">
						@foreach($chunk as $img)
							<div class="col-lg-6 remove-padding">
								<div class="left">
									<a class="banner-effect" href="{{ $img->link }}" target="_blank">
										<img src="{{asset('assets/images/banners/'.$img->photo)}}" alt="">
									</a>
								</div>
							</div>
						@endforeach
					</div>
				@endforeach
			</div>
		</section>
		<!-- Banner Area One Start -->
	@endif

<center><h3 style="text-transform: uppercase; font-weight: 700;">Deals of the day</h3>
 <div class="line"><span></span></div></center>

	@if($ps->featured == 1)
		<!-- Trending Item Area Start -->
		<section  class="trending">
			<div class="container">
				<!-- <div class="row">
					<div class="col-lg-12 remove-padding">
						<div class="section-top">
							<h2 class="section-title">
								{{ $langg->lang26 }}
							</h2>
							{{-- <a href="#" class="link">View All</a> --}}
						</div>
					</div>
				</div> -->
				<div class="row">
					<div class="col-lg-12 remove-padding">
						<div class="trending-item-slider">
							@foreach($feature_products as $prod)
								@include('includes.product.slider-product')
							@endforeach
						</div>
					</div>

				</div>
			</div>
		</section>
		<!-- Tranding Item Area End -->
	@endif

	

	@if($ps->best == 1)
		<!-- Phone and Accessories Area Start -->
		<section class="phone-and-accessories categori-item">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 remove-padding">
						<center><h3 style="text-transform: uppercase; font-weight: 700;">BEST SELLING PRODUCTS</h3>
 <div class="line"><span></span></div></center>
						<!-- <div class="section-top">
							<h2 class="section-title">
								{{ $langg->lang27 }}
							</h2>
						</div> --><br><br>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							@foreach($best_products as $prod)
								@include('includes.product.home-product')
							@endforeach
						</div>
					</div>
					<!-- <div class="col-lg-3 remove-padding d-none d-lg-block">
						<div class="aside">
							<a class="banner-effect mb-10" href="{{ $ps->best_seller_banner_link }}">
								<img src="{{asset('assets/images/'.$ps->best_seller_banner)}}" alt="">
							</a>
							<a class="banner-effect" href="{{ $ps->best_seller_banner_link1 }}">
								<img src="{{asset('assets/images/'.$ps->best_seller_banner1)}}" alt="">
							</a>
						</div>
					</div> -->
				</div>
			</div>
		</section>
		<!-- Phone and Accessories Area start-->
	@endif










<section style="background: url('{{asset('assets/images/bg.jpg')}}') 100% 100%; background-position: fixed;">
<br><br><br>
<center><h3 style="text-transform: uppercase; font-weight: 700;">TRENDING PRODUCTS</h3>
 <div class="line"><span></span></div></center>
<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			  <ul class="nav nav-tabs" style="text-transform: uppercase; text-align: center;" id="myTab">
			    <li class="active" style="width: 33.33%;"><a data-toggle="tab" href="#home" style="padding: 2%; ">Flash Deal</a></li>
			    <li style="width: 33.33%;"><a data-toggle="tab" href="#menu1" style="padding: 2%;">Top Rated</a></li>
			    <li style="width: 33.33%;"><a data-toggle="tab" href="#menu2" style="padding: 2%; ">Big Save</a></li>
			  </ul>
		</div>
	<!-- 	<script type="text/javascript">$('#home').load($('.active a').attr("data-url"),function(result){
  $('.active a').tab('show');
});</script> -->
		<div class="col-lg-4"></div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
		  <div class="tab-content">
		    <div id="home" class="tab-pane fade in active">
		     @if($ps->flash_deal == 1)

				<!-- Electronics Area Start -->
				<section class="categori-item electronics-section">
					<div class="container">
						<div class="row">
							<div class="col-lg-12 remove-padding">
								<div class="section-top">
									<h2 class="section-title">
										{{ $langg->lang244 }}
									</h2>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="flash-deals">
									<div class="flas-deal-slider">

										@foreach($discount_products as $prod)
											@include('includes.product.flash-product')
										@endforeach
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Electronics Area start-->

			@endif
		    </div>
		    <div id="menu1" class="tab-pane fade">
		     @if($ps->top_rated == 1)
		<!-- Electronics Area Start -->
				<section class="categori-item electronics-section">
					<div class="container">
						<div class="row">
							<div class="col-lg-12 remove-padding">
								<div class="section-top">
									<h2 class="section-title">
										{{ $langg->lang28 }}
									</h2>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="row">

									@foreach($top_products as $prod)
										@include('includes.product.top-product')
									@endforeach

								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Electronics Area start-->
			@endif
		    </div>
		    <div id="menu2" class="tab-pane fade">
		      @if($ps->big == 1)
		<!-- Clothing and Apparel Area Start -->
		<section class="categori-item clothing-and-Apparel-Area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 remove-padding">
						<div class="section-top">
							<h2 class="section-title">
								{{ $langg->lang29 }}
							</h2>

						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							@foreach($big_products as $prod)
								@include('includes.product.home-product')
							@endforeach



						</div>
					</div>
				</div>
			</div>
			</div>
		</section>
		<!-- Clothing and Apparel Area start-->
	@endif
		    </div>
		    <!-- <div id="menu3" class="tab-pane fade">
		      <h3>Menu 3</h3>
		      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
		    </div> -->
		  </div>
		</div>
	</div>
</div>
</section>












	


	{{-- Info Area Start --}}
	<section class="info-area">
		<div class="container">

			@if($ps->service == 1)

				@foreach($services->chunk(4) as $chunk)

					<div class="row">

						<div class="col-lg-12 p-0">
							<div class="info-big-box">
								<div class="row">
									@foreach($chunk as $service)
										<div class="col-6 col-xl-3 p-0">
											<div class="info-box">
												<!-- <div class="icon">
													<img src="{{ asset('assets/images/services/'.$service->photo) }}">
												</div> -->
												<div class="info">
													<div class="details text-center">
														<img src="{{ asset('assets/images/services/'.$service->photo) }}">
														<h4 class="title">{{ $service->title }}</h4>
														<p class="text">
															{!! $service->details !!}
														</p>
													</div>
												</div>
											</div>
										</div>
									@endforeach
								</div>
							</div>
						</div>

					</div>

				@endforeach

			@endif

		</div>
	</section>
	{{-- Info Area End  --}}


	<!-- @if($ps->review_blog == 1)
		
		<section class="blog-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="aside">
							<div class="slider-wrapper">
								<div class="aside-review-slider">
									@foreach($reviews as $review)
										<div class="slide-item">
											<div class="top-area">
												<div class="left">
													<img src="{{ $review->photo ? asset('assets/images/reviews/'.$review->photo) : asset('assets/images/noimage.png') }}" alt="">
												</div>
												<div class="right">
													<div class="content">
														<h4 class="name">{{ $review->title }}</h4>
														<p class="dagenation">{{ $review->subtitle }}</p>
													</div>
												</div>
											</div>
											<blockquote class="review-text">
												<p>
													{!! $review->details !!}
												</p>
											</blockquote>
										</div>
									@endforeach


								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						@foreach(DB::table('blogs')->orderby('views','desc')->take(2)->get() as $blogg)

							<div class="blog-box">
								<div class="blog-images">
									<div class="img">
										<img src="{{ $blogg->photo ? asset('assets/images/blogs/'.$blogg->photo):asset('assets/images/noimage.png') }}" class="img-fluid" alt="">
										<div class="date d-flex justify-content-center">
											<div class="box align-self-center">
												<p>{{date('d', strtotime($blogg->created_at))}}</p>
												<p>{{date('M', strtotime($blogg->created_at))}}</p>
											</div>
										</div>
									</div>

								</div>
								<div class="details">
									<a href='{{route('front.blogshow',$blogg->id)}}'>
										<h4 class="blog-title">
											{{strlen($blogg->title) > 40 ? substr($blogg->title,0,40)."...":$blogg->title}}
										</h4>
									</a>
									<p class="blog-text">
										{{substr(strip_tags($blogg->details),0,170)}}
									</p>
									<a class="read-more-btn" href="{{route('front.blogshow',$blogg->id)}}">{{ $langg->lang34 }}</a>
								</div>
							</div>

						@endforeach

					</div>
				</div>
			</div>
		</section>
		
	@endif -->


	


<!-- Partners Area Start -->

	<!-- @if($ps->partners == 1)
		
		<section class="partners">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-top">
							<h2 class="section-title">
								{{ $langg->lang236 }}
							</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="partner-slider">
							@foreach($partners as $data)
								<div class="item">
									<a href="{{ $data->link }}" target="_blank">
										<img src="{{asset('assets/images/partner/'.$data->photo)}}" alt="">
									</a>
								</div>
							@endforeach
						</div>
					</div>
				</div>
			</div>
		</section>
		
	@endif -->

	<!-- Partners Area Start -->

@endsection
