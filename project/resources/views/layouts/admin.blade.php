<!doctype html>
<html lang="en" dir="ltr">
	
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="author" content="GeniusOcean">
    	<meta name="csrf-token" content="{{ csrf_token() }}">
		<!-- Title -->
		<title>{{$gs->title}}</title>
		<!-- favicon -->
		<link rel="icon"  type="image/x-icon" href="{{asset('assets/images/'.$gs->favicon)}}"/>
		<!-- Bootstrap -->
		<link href="{{asset('assets/admin/css/bootstrap.min.css')}}" rel="stylesheet" />
		<!-- Fontawesome -->
		<link rel="stylesheet" href="{{asset('assets/admin/css/fontawesome.css')}}">
		<!-- icofont -->
		<link rel="stylesheet" href="{{asset('assets/admin/css/icofont.min.css')}}">
		<!-- Sidemenu Css -->
		<link href="{{asset('assets/admin/plugins/fullside-menu/css/dark-side-style.css')}}" rel="stylesheet" />
		<link href="{{asset('assets/admin/plugins/fullside-menu/waves.min.css')}}" rel="stylesheet" />

		<link href="{{asset('assets/admin/css/plugin.css')}}" rel="stylesheet" />

		<link href="{{asset('assets/admin/css/jquery.tagit.css')}}" rel="stylesheet" />		
    	<link rel="stylesheet" href="{{ asset('assets/admin/css/bootstrap-coloroicker.css') }}">
		<!-- Main Css -->
		<link href="{{asset('assets/admin/css/style.css')}}" rel="stylesheet"/>
		<link href="{{asset('assets/admin/css/custom.css')}}" rel="stylesheet"/>
		<link href="{{asset('assets/admin/css/responsive.css')}}" rel="stylesheet" />
		@yield('styles')

	</head>
	<body>
		<div class="page">
			<div class="page-main">
				<!-- Header Menu Area Start -->
				<div class="header">
					<div class="container-fluid">
						<div class="d-flex justify-content-between">
							<div class="menu-toggle-button">
								<a class="nav-link" href="javascript:;" id="sidebarCollapse">
									<div class="my-toggl-icon">
											<span class="bar1"></span>
											<span class="bar2"></span>
											<span class="bar3"></span>
									</div>
								</a>
							</div>

							<div class="right-eliment">
								<ul class="list">

									<li class="bell-area">
										<a id="notf_conv" class="dropdown-toggle-1" href="javascript:;">
											<i class="far fa-envelope"></i>
											<span data-href="{{ route('conv-notf-count') }}" id="conv-notf-count">{{ App\Models\Notification::countConversation() }}</span>
										</a>
										<div class="dropdown-menu">
											<div class="dropdownmenu-wrapper" data-href="{{ route('conv-notf-show') }}" id="conv-notf-show">
										</div>
										</div>
									</li>

									<li class="bell-area">
										<a id="notf_product" class="dropdown-toggle-1" href="javascript:;">
											<i class="icofont-cart"></i>
											<span data-href="{{ route('product-notf-count') }}" id="product-notf-count">{{ App\Models\Notification::countProduct() }}</span>
										</a>
										<div class="dropdown-menu">
											<div class="dropdownmenu-wrapper" data-href="{{ route('product-notf-show') }}" id="product-notf-show">
										</div>
										</div>
									</li>

									<li class="bell-area">
										<a id="notf_user" class="dropdown-toggle-1" href="javascript:;">
											<i class="far fa-user"></i>
											<span data-href="{{ route('user-notf-count') }}" id="user-notf-count">{{ App\Models\Notification::countRegistration() }}</span>
										</a>
										<div class="dropdown-menu">
											<div class="dropdownmenu-wrapper" data-href="{{ route('user-notf-show') }}" id="user-notf-show">
										</div>
										</div>
									</li>

									<li class="bell-area">
										<a id="notf_order" class="dropdown-toggle-1" href="javascript:;">
											<i class="far fa-newspaper"></i>
											<span data-href="{{ route('order-notf-count') }}" id="order-notf-count">{{ App\Models\Notification::countOrder() }}</span>
										</a>
										<div class="dropdown-menu">
											<div class="dropdownmenu-wrapper" data-href="{{ route('order-notf-show') }}" id="order-notf-show">
										</div>
										</div>
									</li>

									<li class="login-profile-area">
										<a class="dropdown-toggle-1" href="javascript:;">
											<div class="user-img">
												<img src="{{ Auth::guard('admin')->user()->photo ? asset('assets/images/admins/'.Auth::guard('admin')->user()->photo ):asset('assets/images/noimage.png') }}" alt="">
											</div>
										</a>
										<div class="dropdown-menu">
											<div class="dropdownmenu-wrapper">
													<ul>
														<h5>Welcome!</h5>
															<li>
																<a href="{{ route('admin.profile') }}"><i class="fas fa-user"></i> Edit Profile</a>
															</li>
															<li>
																<a href="{{ route('admin.password') }}"><i class="fas fa-cog"></i> Change Password</a>
															</li>
															<li>
																<a href="{{ route('admin.logout') }}"><i class="fas fa-power-off"></i> Logout</a>
															</li>
														</ul>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- Header Menu Area End -->
				<div class="wrapper">
					<!-- Side Menu Area Start -->
					<nav id="sidebar" class="nav-sidebar">
						<ul class="list-unstyled components" id="accordion">
							<li>
								<a href="{{ route('admin.dashboard') }}" class="wave-effect active"><i class="fa fa-home mr-2"></i>Dashbord</a>
							</li>
							<li>
								<a href="#order" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false"><i class="fas fa-hand-holding-usd"></i>Orders</a>
								<ul class="collapse list-unstyled" id="order" data-parent="#accordion" >
                                   	<li>
                                    	<a href="{{route('admin-order-index')}}"> All Orders</a>
                                	</li>
                                    <li>
                                        <a href="{{route('admin-order-pending')}}"> Pending Orders</a>
                                    </li>
                                    <li>
                                        <a href="{{route('admin-order-processing')}}"> Processing Orders</a>
                                    </li>
                                    <li>
                                        <a href="{{route('admin-order-completed')}}"> Completed Orders</a>
                                    </li>
                                    <li>
                                        <a href="{{route('admin-order-declined')}}"> Cancelled Orders</a>
                                    </li>  

								</ul>
							</li>
							<li>
								<a href="#menu2" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="icofont-cart"></i>Products
								</a>
								<ul class="collapse list-unstyled" id="menu2" data-parent="#accordion">
									<li>
										<a href="{{ route('admin-prod-types') }}"><span>Add New Product</span></a>
									</li>
									<li>
										<a href="{{ route('admin-prod-index') }}"><span>All Products</span></a>
									</li>
									<li>
										<a href="{{ route('admin-prod-deactive') }}"><span>Products for approval</span></a>
									</li>
								</ul>
							</li>
                           <li>
								<a href="{{ route('admin-offline-buy') }}"><i class="fas fa-language"></i>Buy Offline</a>
							</li>
							<li>
								<a href="{{ route('admin-offline-order') }}"><i class="fas fa-language"></i>Offline Order</a>
							</li>
							<li>
								<a href="#menu3" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="icofont-user"></i>Customers
								</a>
								<ul class="collapse list-unstyled" id="menu3" data-parent="#accordion">
									<li>
										<a href="{{ route('admin-user-index') }}"><span>Customers List</span></a>
									</li>
									<li>
										<a href="{{ route('admin-withdraw-index') }}"><span>Withdraws</span></a>
									</li>
								</ul>
							</li>



							<li>
								<a href="#vendor" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="icofont-ui-user-group"></i>Vendors
								</a>
								<ul class="collapse list-unstyled" id="vendor" data-parent="#accordion">
									<li>
										<a href="{{ route('admin-vendor-index') }}"><span>Vendors List</span></a>
									</li>
									<li>
										<a href="{{ route('admin-vendor-withdraw-index') }}"><span>Withdraws</span></a>
									</li>
									<li>
										<a href="{{ route('admin-vendor-subs') }}"><span>Vendor Subscriptions</span></a>
									</li>
								</ul>
							</li>

							<li>
								<a href="#report" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="icofont-ui-user-group"></i>Report
								</a>
								<ul class="collapse list-unstyled" id="report" data-parent="#accordion">
									<li>
										<a href="{{ route('admin-report-payment') }}"><span>Payment Report</span></a>
									</li>
								</ul>
							</li>
							<li>
								<a href="#import" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="icofont-ui-user-group"></i>Import
								</a>
								<ul class="collapse list-unstyled" id="import" data-parent="#accordion">
									<li>
										<a href="{{ route('admin-import-pincode') }}"><span>Import Pincode</span></a>
									</li>
								</ul>
							</li>

							<li>
								<a href="{{ route('admin-subscription-index') }}" class=" wave-effect"><i class="fas fa-dollar-sign"></i>Vendor Subscription Plans</a>
							</li>



							<li>
								<a href="#menu5" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false"><i class="fas fa-sitemap"></i>Manage Categories</a>
								<ul class="collapse list-unstyled" id="menu5" data-parent="#accordion" >
										<li>
											<a href="{{ route('admin-cat-index') }}"><span>Main Category</span></a>
										</li>
										<li>
											<a href="{{ route('admin-subcat-index') }}"><span>Sub Category</span></a>
										</li>
										<li>
											<a href="{{ route('admin-childcat-index') }}"><span>Child Category</span></a>
										</li>
								</ul>
							</li>


							<li>
								<a href="#menu4" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="icofont-speech-comments"></i>Product Discussion
								</a>
								<ul class="collapse list-unstyled" id="menu4" data-parent="#accordion">
									<li>
										<a href="{{ route('admin-rating-index') }}"><span>Product Reviews</span></a>
									</li>
									<li>
										<a href="{{ route('admin-comment-index') }}"><span>Comments</span></a>
									</li>
								</ul>
							</li>

							<li>
								<a href="{{ route('admin-coupon-index') }}" class=" wave-effect"><i class="fas fa-percentage"></i>Set Coupons</a>
							</li>
							<li>
								<a href="#blog" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="fas fa-fw fa-newspaper"></i>Blog
								</a>
								<ul class="collapse list-unstyled" id="blog" data-parent="#accordion">
									<li>
										<a href="{{ route('admin-cblog-index') }}"><span>Categories</span></a>
									</li>
									<li>
										<a href="{{ route('admin-blog-index') }}"><span>Posts</span></a>
									</li>
								</ul>
							</li>

							<li>
								<a href="#msg" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="fas fa-fw fa-newspaper"></i>Messages
								</a>
								<ul class="collapse list-unstyled" id="msg" data-parent="#accordion">
									<li>
										<a href="{{ route('admin-message-index') }}"><span>Tickets</span></a>
									</li>
									<li>
										<a href="{{ route('admin-message-dispute') }}"><span>Disputes</span></a>
									</li>
								</ul>
							</li>


							@if(Auth::guard('admin')->user()->IsAdmin())

							<li>
								<a href="#general" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="fas fa-cogs"></i>General Settings
								</a>
								<ul class="collapse list-unstyled" id="general" data-parent="#accordion">
                                    <li>
                                    	<a href="{{ route('admin-gs-logo') }}"><span>Logo</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-gs-fav') }}"><span>Favicon</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-gs-load') }}"><span>Loader</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-pick-index') }}"><span>Pickup Locations</span></a>
                                    </li>
                                    <li>
                                    <a href="{{ route('admin-gs-contents') }}"><span>Website Contents</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-gs-header') }}"><span>Header</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-gs-footer') }}"><span>Footer</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-gs-affilate') }}"><span>Affilate Informations</span></a>
                                    </li>
								</ul>
							</li>

							@endif


							<li>
								<a href="#homepage" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="fas fa-edit"></i>Home Page Settings
								</a>
								<ul class="collapse list-unstyled" id="homepage" data-parent="#accordion">
                                    <li>
                                    	<a href="{{ route('admin-sl-index') }}"><span>Sliders</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-service-index') }}"><span>Services</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-ps-best-seller') }}"><span>Right Side Banner1</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-ps-big-save') }}"><span>Right Side Banner2</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-sb-index') }}"><span>Top Small Banners</span></a>
                                    </li>

                                    <li>
                                    	<a href="{{ route('admin-sb-large') }}"><span>Large Banners</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-sb-bottom') }}"><span>Bottom Small Banners</span></a>
                                    </li>

                                    <li>
                                    	<a href="{{ route('admin-review-index') }}"><span>Reviews</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-partner-index') }}"><span>Partners</span></a>
                                    </li>

                                    
                                    <li>
                                    	<a href="{{ route('admin-ps-customize') }}"><span>Home Page Customization</span></a>
                                    </li>
								</ul>
							</li>


							@if(Auth::guard('admin')->user()->IsAdmin())


							<li>
								<a href="#menu" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="fas fa-file-code"></i>Menu Page Settings
								</a>
								<ul class="collapse list-unstyled" id="menu" data-parent="#accordion">
                                    <li>
                                    	<a href="{{ route('admin-faq-index') }}"><span>FAQ Page</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-ps-contact') }}"><span>Contact Us Page</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-page-index') }}"><span>Other Pages</span></a>
                                    </li>
								</ul>
							</li>
							<li>
								<a href="#emails" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="fas fa-at"></i>Email Settings
								</a>
								<ul class="collapse list-unstyled" id="emails" data-parent="#accordion">
                                    <li><a href="{{route('admin-mail-index')}}"><span>Email Template</span></a></li>  
                                    <li><a href="{{route('admin-mail-config')}}"><span>Email Configurations</span></a></li>  
                                    <li><a href="{{route('admin-group-show')}}"><span>Group Email</span></a></li>  
								</ul>
							</li>

							<!-- <li>
								<a href="#payments" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="fas fa-file-code"></i>Payment Settings
								</a>
								<ul class="collapse list-unstyled" id="payments" data-parent="#accordion">
                                    <li><a href="{{route('admin-gs-payments')}}"><span>Payment Informations</span></a></li>  
                                    <li><a href="{{route('admin-payment-index')}}"><span>Payment Gateways</span></a></li>  
                                    <li><a href="{{route('admin-currency-index')}}"><span>Currencies</span></a></li>  
								</ul>
							</li> -->

							<!-- <li>
								<a href="#socials" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="fas fa-paper-plane"></i>Social Settings
								</a>
								<ul class="collapse list-unstyled" id="socials" data-parent="#accordion">
                                        <li><a href="{{route('admin-social-index')}}"><span>Social Links</span></a></li>   
                                        <li><a href="{{route('admin-social-facebook')}}"><span>Facebook Login</span></a></li>
                                        <li><a href="{{route('admin-social-google')}}"><span>Google Login</span></a></li>
								</ul>
							</li>
							<li>
								<a href="{{ route('admin-lang-index') }}"><i class="fas fa-language"></i>Language Settings</a>
							</li> -->
							<!-- <li>
								<a href="#seoTools" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
									<i class="fas fa-wrench"></i>SEO Tools
								</a>
								<ul class="collapse list-unstyled" id="seoTools" data-parent="#accordion">
                                    <li>
                                    	<a href="{{ route('admin-prod-popular',30) }}"><span>Popular Products</span></a>
                                    </li>
                                    <li>
                                    	<a href="{{ route('admin-seotool-analytics') }}"><span>Google Analytics</span></a>
                                    </li
                                    >
                                    <li>
                                    	<a href="{{ route('admin-seotool-keywords') }}"><span>Website Meta Keywords</span></a>
                                    </li>
								</ul>
							</li> -->
							<li>
								<a href="{{ route('admin-staff-index') }}" class=" wave-effect"><i class="fas fa-user-secret"></i>Manage Staffs</a>
							</li>

								<!-- <li>
									<a href="#sactive" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
										<i class="fas fa-cog"></i>System Activation
									</a>
									<ul class="collapse list-unstyled" id="sactive" data-parent="#accordion">

										<li><a href="{{route('admin-activation-form')}}"> Activation</a></li>
										<li><a href="{{route('admin-generate-backup')}}"> Generate Backup</a></li>
									</ul>
								</li> -->

							@endif

{{-- 							<li>
								<a href="{{ route('admin-subs-index') }}" class=" wave-effect"><i class="fas fa-users-cog mr-2"></i>Subscribers</a>
							</li> --}}
						</ul>

					<p class="version-name"> Version: 1.2</p>
					</nav>
					<!-- Main Content Area Start -->
					@yield('content')
					<!-- Main Content Area End -->
					</div>
				</div>
			</div>
			
		<script type="text/javascript">
		  var mainurl = "{{url('/')}}";
		  var admin_loader = {{ $gs->is_admin_loader }};
		</script>

		<!-- Dashboard Core -->
		<script src="{{asset('assets/admin/js/vendors/jquery-1.12.4.min.js')}}"></script>
		<script src="{{asset('assets/admin/js/vendors/bootstrap.min.js')}}"></script>
		<script src="{{asset('assets/admin/js/jqueryui.min.js')}}"></script>
		<!-- Fullside-menu Js-->
		<script src="{{asset('assets/admin/plugins/fullside-menu/jquery.slimscroll.min.js')}}"></script>
		<script src="{{asset('assets/admin/plugins/fullside-menu/waves.min.js')}}"></script>

		<script src="{{asset('assets/admin/js/plugin.js')}}"></script>
		<script src="{{asset('assets/admin/js/Chart.min.js')}}"></script>
		<script src="{{asset('assets/admin/js/tag-it.js')}}"></script>
		<script src="{{asset('assets/admin/js/nicEdit.js')}}"></script>
        <script src="{{asset('assets/admin/js/bootstrap-colorpicker.min.js') }}"></script>
        <script src="{{asset('assets/admin/js/notify.js') }}"></script>

        <script src="{{asset('assets/admin/js/jquery.canvasjs.min.js')}}"></script>
        
		<script src="{{asset('assets/admin/js/load.js')}}"></script>
		<!-- Custom Js-->
		<script src="{{asset('assets/admin/js/custom.js')}}"></script>
		<!-- AJAX Js-->
		<script src="{{asset('assets/admin/js/myscript.js')}}"></script>
		@yield('scripts')

@if($gs->is_admin_loader == 0)
<style>
	div#geniustable_processing {
		display: none !important;
	}
</style>
@endif

	</body>

</html>