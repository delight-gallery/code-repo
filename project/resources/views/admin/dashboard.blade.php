@extends('layouts.admin')

@section('content')
<div class="content-area">
    @include('includes.form-success')

    @if($activation_notify != "")
    <div class="alert alert-danger validation">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                aria-hidden="true">×</span></button>
        <h3 class="text-center">{!! $activation_notify !!}</h3>
    </div>
    @endif

    <div class="row row-cards-one">
        <div class="col-md-12 col-lg-6 col-xl-4">
            <div class="mycard bg1">
                <div class="left">
                    <h5 class="title">Orders Pending! </h5>
                    <span class="number">{{count($pending)}}</span>
                    <a href="{{route('admin-order-pending')}}" class="link">View All</a>
                </div>
                <div class="right d-flex align-self-center">
                    <div class="icon">
                        <i class="icofont-dollar"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-lg-6 col-xl-4">
            <div class="mycard bg2">
                <div class="left">
                    <h5 class="title">Orders Procsessing!</h5>
                    <span class="number">{{count($processing)}}</span>
                    <a href="{{route('admin-order-processing')}}" class="link">View All</a>
                </div>
                <div class="right d-flex align-self-center">
                    <div class="icon">
                        <i class="icofont-truck-alt"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-lg-6 col-xl-4">
            <div class="mycard bg3">
                <div class="left">
                    <h5 class="title">Orders Completed!</h5>
                    <span class="number">{{count($completed)}}</span>
                    <a href="{{route('admin-order-completed')}}" class="link">View All</a>
                </div>
                <div class="right d-flex align-self-center">
                    <div class="icon">
                        <i class="icofont-check-circled"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-lg-6 col-xl-4">
            <div class="mycard bg4">
                <div class="left">
                    <h5 class="title">Total Products!</h5>
                    <span class="number">{{count($products)}}</span>
                    <a href="{{route('admin-prod-index')}}" class="link">View All</a>
                </div>
                <div class="right d-flex align-self-center">
                    <div class="icon">
                        <i class="icofont-cart-alt"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-lg-6 col-xl-4">
            <div class="mycard bg5">
                <div class="left">
                    <h5 class="title">Total Customers!</h5>
                    <span class="number">{{count($users)}}</span>
                    <a href="{{route('admin-user-index')}}" class="link">View All</a>
                </div>
                <div class="right d-flex align-self-center">
                    <div class="icon">
                        <i class="icofont-users-alt-5"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-lg-6 col-xl-4">
            <div class="mycard bg6">
                <div class="left">
                    <h5 class="title">Total Posts!</h5>
                    <span class="number">{{count($blogs)}}</span>
                    <a href="{{ route('admin-blog-index') }}" class="link">View All</a>
                </div>
                <div class="right d-flex align-self-center">
                    <div class="icon">
                        <i class="icofont-newspaper"></i>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="row row-cards-one">
        <div class="col-md-6 col-lg-3">
            <div class="card c-info-box-area">
                <div class="c-info-box box1">
                    <p>{{ App\Models\User::where( 'created_at', '>', Carbon\Carbon::now()->subDays(30))->get()->count()  }}</p>
                </div>
                <div class="c-info-box-content">
                    <h6 class="title">New Customers</h6>
                    <p class="text">Last 30 Days</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="card c-info-box-area">
                <div class="c-info-box box2">
                    <p>{{ App\Models\User::count() }}</p>
                </div>
                <div class="c-info-box-content">
                    <h6 class="title">Total Customers</h6>
                    <p class="text">All Time</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="card c-info-box-area">
                <div class="c-info-box box3">
                    <p>{{ App\Models\Order::where('status','=','completed')->where( 'created_at', '>', Carbon\Carbon::now()->subDays(30))->get()->count()  }}</p>
                </div>
                <div class="c-info-box-content">
                    <h6 class="title">Total Sales</h6>
                    <p class="text">Last 30 days</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="card c-info-box-area">
                <div class="c-info-box box4">
                     <p>{{ App\Models\Order::where('status','=','completed')->get()->count() }}</p>
                </div>
                <div class="c-info-box-content">
                    <h6 class="title">Total Sales</h6>
                    <p class="text">All Time</p>
                </div>
            </div>
        </div>
    </div>

    <div class="row row-cards-one">

        <div class="col-md-6 col-lg-6 col-xl-6">
            <div class="card">
                <h5 class="card-header">Recent Order(s)</h5>
                <div class="card-body">

                    <div class="my-table-responsiv">
                        <table class="table table-hover dt-responsive" cellspacing="0" width="100%">
                            <thead>
                                <tr>

                                    <th>Order Number</th>
                                    <th>Order Date</th>
                                </tr>
                                @foreach($rorders as $data)
                                <tr>
                                    <td>{{ $data->order_number }}</td>
                                    <td>{{ date('Y-m-d',strtotime($data->created_at)) }}</td>
                                    <td>
                                        <div class="action-list"><a href="{{ route('admin-order-show',$data->id) }}"><i
                                                    class="fas fa-eye"></i> Details</a>
                                        </div>
                                    </td>
                                </tr>
                                @endforeach
                            </thead>
                        </table>
                    </div>

                </div>
            </div>

        </div>

        <div class="col-md-6 col-lg-6 col-xl-6">
                <div class="card">
                        <h5 class="card-header">Recent Customer(s)</h5>
                        <div class="card-body">
        
                            <div class="my-table-responsiv">
                                <table class="table table-hover dt-responsive" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>Customer Email</th>
                                            <th>Joined</th>
                                        </tr>
                                        @foreach($rusers as $data)
                                        <tr>
                                            <td>{{ $data->email }}</td>
                                            <td>{{ $data->created_at }}</td>
                                            <td>
                                                <div class="action-list"><a href="{{ route('admin-user-show',$data->id) }}"><i
                                                            class="fas fa-eye"></i> Details</a>
                                                </div>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </thead>
                                </table>
                            </div>
        
                        </div>
                    </div>
        </div>
    </div>

    <div class="row row-cards-one">

            <div class="col-md-12 col-lg-12 col-xl-12">
                    <div class="card">
                            <h5 class="card-header">Popular Product(s)</h5>
                            <div class="card-body">
            
                                <div class="table-responsiv  dashboard-home-table">
                                    <table id="poproducts" class="table table-hover dt-responsive" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Featured Image</th>
                                                <th>Name</th>
                                                <th>Category</th>
                                                <th>Type</th>
                                                <th>Price</th>
                                                <th></th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($poproducts as $data)
                                            <tr>
                                            <td><img src="{{ asset('assets/images/products/'.$data->photo) }}"></td>
                                            <td>{{  strlen(strip_tags($data->name)) > 50 ? substr(strip_tags($data->name),0,50).'...' : strip_tags($data->name) }}</td>
                                            <td>{{ $data->category->name }}
                                                    @if(isset($data->subcategory))
                                                    <br>
                                                    {{ $data->subcategory->name }}
                                                    @endif
                                                    @if(isset($data->childcategory))
                                                    <br>
                                                    {{ $data->childcategory->name }}
                                                    @endif
                                                </td>
                                                <td>{{ $data->type }}</td>

                                                <td> {{ $data->showPrice() }} </td>

                                                <td>
                                                    <div class="action-list"><a href="{{ route('admin-prod-edit',$data->id) }}"><i
                                                                class="fas fa-eye"></i> Details</a>
                                                    </div>
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

    <div class="row row-cards-one">

            <div class="col-md-12 col-lg-12 col-xl-12">
                    <div class="card">
                            <h5 class="card-header">Recent Product(s)</h5>
                            <div class="card-body">
            
                                <div class="table-responsiv dashboard-home-table">
                                    <table id="pproducts" class="table table-hover dt-responsive" cellspacing="0" width="100%">
                                            <thead>
                                                    <tr>
                                                        <th>Featured Image</th>
                                                        <th>Name</th>
                                                        <th>Category</th>
                                                        <th>Type</th>
                                                        <th>Price</th>
                                                        <th></th>
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach($pproducts as $data)
                                                    <tr>
                                                    <td><img src="{{ asset('assets/images/products/'.$data->photo) }}"></td>
                                                    <td>{{  strlen(strip_tags($data->name)) > 50 ? substr(strip_tags($data->name),0,50).'...' : strip_tags($data->name) }}</td>
                                                    <td>{{ $data->category->name }}
                                                        @if(isset($data->subcategory))
                                                        <br>
                                                        {{ $data->subcategory->name }}
                                                        @endif
                                                        @if(isset($data->childcategory))
                                                        <br>
                                                        {{ $data->childcategory->name }}
                                                        @endif
                                                    </td>
                                                        <td>{{ $data->type }}</td>
                                                        <td> {{ $data->showPrice() }} </td>
                                                        <td>
                                                            <div class="action-list"><a href="{{ route('admin-prod-edit',$data->id) }}"><i
                                                                        class="fas fa-eye"></i> Details</a>
                                                            </div>
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

    <div class="row row-cards-one">

        <div class="col-md-12 col-lg-12 col-xl-12">
            <div class="card">
                <h5 class="card-header">Total Sales in Last 30 Days</h5>
                <div class="card-body">

                    <canvas id="lineChart"></canvas>

                </div>
            </div>

        </div>

    </div>




    <div class="row row-cards-one">

        <div class="col-md-6 col-lg-6 col-xl-6">
            <div class="card">
                <h5 class="card-header">Top Referrals</h5>
                <div class="card-body">
                    <div class="admin-fix-height-card">
                         <div id="chartContainer-topReference"></div>
                    </div>
                       
                </div>
            </div>

        </div>

        <div class="col-md-6 col-lg-6 col-xl-6">
                <div class="card">
                        <h5 class="card-header">Most Used OS</h5>
                        <div class="card-body">
<div class="admin-fix-height-card">
                        <div id="chartContainer-os"></div>
</div>
                        </div>
                    </div>
        </div>
        
    </div>



</div>

@endsection

@section('scripts')

<script language="JavaScript">
    displayLineChart();

    function displayLineChart() {
        var data = {
            labels: [
            {!!$days!!}
            ],
            datasets: [{
                label: "Prime and Fibonacci",
                fillColor: "#3dbcff",
                strokeColor: "#0099ff",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [
                {!!$sales!!}
                ]
            }]
        };
        var ctx = document.getElementById("lineChart").getContext("2d");
        var options = {
            responsive: true
        };
        var lineChart = new Chart(ctx).Line(data, options);
    }


    
</script>

<script type="text/javascript">
    $('#poproducts').dataTable( {
      "ordering": false,
          'lengthChange': false,
          'searching'   : false,
          'ordering'    : false,
          'info'        : false,
          'autoWidth'   : false,
          'responsive'  : true,
          'paging'  : false
    } );
    </script>


<script type="text/javascript">
    $('#pproducts').dataTable( {
      "ordering": false,
      'lengthChange': false,
          'searching'   : false,
          'ordering'    : false,
          'info'        : false,
          'autoWidth'   : false,
          'responsive'  : true,
          'paging'  : false
    } );
    </script>

<script type="text/javascript">
        var chart1 = new CanvasJS.Chart("chartContainer-topReference",
            {
                exportEnabled: true,
                animationEnabled: true,

                legend: {
                    cursor: "pointer",
                    horizontalAlign: "right",
                    verticalAlign: "center",
                    fontSize: 16,
                    padding: {
                        top: 20,
                        bottom: 2,
                        right: 20,
                    },
                },
                data: [
                    {
                        type: "pie",
                        showInLegend: true,
                        legendText: "",
                        toolTipContent: "{name}: <strong>{#percent%} (#percent%)</strong>",
                        indexLabel: "#percent%",
                        indexLabelFontColor: "white",
                        indexLabelPlacement: "inside",
                        dataPoints: [
                                @foreach($referrals as $browser)
                                    {y:{{$browser->total_count}}, name: "{{$browser->referral}}"},
                                @endforeach
                        ]
                    }
                ]
            });
        chart1.render();

        var chart = new CanvasJS.Chart("chartContainer-os",
            {
                exportEnabled: true,
                animationEnabled: true,
                legend: {
                    cursor: "pointer",
                    horizontalAlign: "right",
                    verticalAlign: "center",
                    fontSize: 16,
                    padding: {
                        top: 20,
                        bottom: 2,
                        right: 20,
                    },
                },
                data: [
                    {
                        type: "pie",
                        showInLegend: true,
                        legendText: "",
                        toolTipContent: "{name}: <strong>{#percent%} (#percent%)</strong>",
                        indexLabel: "#percent%",
                        indexLabelFontColor: "white",
                        indexLabelPlacement: "inside",
                        dataPoints: [
                            @foreach($browsers as $browser)
                                {y:{{$browser->total_count}}, name: "{{$browser->referral}}"},
                            @endforeach
                        ]
                    }
                ]
            });
        chart.render();    
</script>

@endsection