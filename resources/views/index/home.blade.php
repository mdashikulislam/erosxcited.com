@extends('layouts.app')

@section('content')
  <!-- jumbotron -->
  <div class="jumbotron homepage m-0 bg-gradient">
    <div class="container">
      <div class="row">
        <div class="col-12 text-center">
  <h1 class="display-4 pt-5 mb-3 text-white">{{trans('general.welcome_title')}}</h1>
  <p class="text-white">
    Erosxcited está diseñado para ayudar a los creadores de contenido en la web, crear una cuenta gratuita y comienza a ganar dinero ahora.
  </p>
  <p class="text-white">
    En Erosxcited reunimos a los creadores más apasionados y creativos de diversas disciplinas, desde influencers y artistas hasta expertos en tecnología y gurús del estilo de vida. Nuestra plataforma es el lugar donde la creatividad encuentra su hogar y donde los talentos emergentes se destacan.
  </p>
  <div class="d-flex flex-column align-items-end ">
  <h2 class="text-white" >¡{{trans('general.header_box_3')}}!</h2>
  <a class="btn btn-lg btn-main btn-outline-light px-4 toggleRegister btn-arrow mt-3" href="{{ $settings->registration_active == '1' ? url('signup') : url('login')}}">
    {{trans('general.getting_started')}}
  </a>
</div>



</div>

        
      </div>
    </div>
  </div>
  <!-- ./ jumbotron -->

  
    

@if ($settings->widget_creators_featured == 'on')

    @if ($users->count() != 0)
    <!-- Users -->
    <div class="section py-5 py-large">
      <div class="container">
        <div class="btn-block text-center mb-5">
          <h1 class="txt-black">{{trans('general.creators_featured')}}</h1>
          <p>
            {{trans('general.desc_creators_featured')}}*
          </p>
        </div>
        <div class="row">

        @if ($usersTotal > $users->total())
          <div class="w-100 mb-3 text-center">
            <a href="{{url('creators')}}" class="float-right link-border">{{trans('general.view_all_creators')}} <small class="pl-1"><i class="bi-arrow-right"></i></small></a>
          </div>
        @endif

          <div class="owl-carousel owl-theme">
            @foreach ($users as $response)
              @include('includes.listing-creators')
          @endforeach
          </div>
        </div><!-- End Row -->
      </div><!-- End Container -->
    </div><!-- End Section -->
  @endif
@endif

  @if ($settings->show_counter == 'on')
  <!-- Counter -->
  <div class="section py-2 bg-gradient text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <div class="d-flex py-3 my-1 my-lg-0 justify-content-center">
            <span class="mr-3 display-4"><i class="bi bi-people align-baseline"></i></span>
            <div>
              <h3 class="mb-0">{!! Helper::formatNumbersStats($usersTotal) !!}</h3>
              <h5>{{trans('general.creators')}}</h5>
            </div>
          </div>

        </div>
        <div class="col-md-4">
          <div class="d-flex py-3 my-1 my-lg-0 justify-content-center">
            <span class="mr-3 display-4"><i class="bi bi-images align-baseline"></i></span>
            <div>
              <h3 class="mb-0">{!! Helper::formatNumbersStats(Updates::count()) !!}</h3>
              <h5 class="font-weight-light">{{trans('general.content_created')}}</h5>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="d-flex py-3 my-1 my-lg-0 justify-content-center">
            <span class="mr-3 display-4"><i class="bi bi-cash-coin align-baseline"></i></span>
            <div>
              <h3 class="mb-0">@if($settings->currency_position == 'left') {{ $settings->currency_symbol }}@endif{!! Helper::formatNumbersStats(Transactions::whereApproved('1')->sum('earning_net_user')) !!}@if($settings->currency_position == 'right'){{ $settings->currency_symbol }} @endif</h3>
              <h5 class="font-weight-light">{{trans('general.earnings_of_creators')}}</h5>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
@endif

@if ($settings->earnings_simulator == 'on')
<!-- Earnings simulator -->
<div class="section py-5 py-large">
  <div class="container mb-4">
    <div class="btn-block text-center">
      <h1 class="txt-black">{{trans('general.earnings_simulator')}}</h1>
      <p>
        {{trans('general.earnings_simulator_subtitle')}}
      </p>
    </div>
    <div class="row">
      <div class="col-md-6">
        <label for="rangeNumberFollowers" class="w-100">
          {{ __('general.number_followers') }}
          <i class="feather icon-facebook mr-1"></i>
          <i class="feather icon-twitter mr-1"></i>
          <i class="feather icon-instagram"></i>
          <span class="float-right">
            #<span id="numberFollowers">1000</span>
          </span>
        </label>
        <input type="range" class="custom-range" value="0" min="1000" max="1000000" id="rangeNumberFollowers" onInput="$('#numberFollowers').html($(this).val())">
      </div>

      <div class="col-md-6">
        <label for="rangeMonthlySubscription" class="w-100">{{ __('general.monthly_subscription_price') }}
          <span class="float-right">
            {{ $settings->currency_position == 'left' ? $settings->currency_symbol : null }}<span id="monthlySubscription">{{ $settings->min_subscription_amount }}</span>{{ $settings->currency_position == 'right' ? $settings->currency_symbol : null }}
        </span>
        </label>
        <input type="range" class="custom-range" value="0" onInput="$('#monthlySubscription').html($(this).val())" min="{{ $settings->min_subscription_amount }}" max="{{ $settings->max_subscription_amount }}" id="rangeMonthlySubscription">
      </div>

      <div class="col-md-12 text-center mt-4">
        <h3 class="font-weight-light">{{trans('general.earnings_simulator_subtitle_2')}}
          <span class="font-weight-bold"><span id="estimatedEarn"></span> <small>{{$settings->currency_code}}</small></span>
          {{ __('general.per_month') }}*</h3>
        <p class="mb-1">
          * {{trans('general.earnings_simulator_subtitle_3')}}
        </p>
        @if ($settings->fee_commission != 0)
          <small class="w-100 d-block">* {{trans('general.include_platform_fee', ['percentage' => $settings->fee_commission])}}</small>
        @endif
      </div>
    </div>
  </div>
</div>
@endif

    
    </div>

@endsection

@section('javascript')

  @if ($settings->earnings_simulator == 'on')
  <script type="text/javascript">

  function decimalFormat(nStr)
  {
    @if ($settings->decimal_format == 'dot')
     var $decimalDot = '.';
     var $decimalComma = ',';
     @else
     var $decimalDot = ',';
     var $decimalComma = '.';
     @endif

     @if ($settings->currency_position == 'left')
     var currency_symbol_left = '{{$settings->currency_symbol}}';
     var currency_symbol_right = '';
     @else
     var currency_symbol_right = '{{$settings->currency_symbol}}';
     var currency_symbol_left = '';
     @endif

      nStr += '';
      var x = nStr.split('.');
      var x1 = x[0];
      var x2 = x.length > 1 ? $decimalDot + x[1] : '';
      var rgx = /(\d+)(\d{3})/;
      while (rgx.test(x1)) {
          var x1 = x1.replace(rgx, '$1' + $decimalComma + '$2');
      }
      return currency_symbol_left + x1 + x2 + currency_symbol_right;
    }

    function earnAvg() {
      var fee = {{ $settings->fee_commission }};
      @if($settings->currency_code == 'JPY')
       $decimal = 0;
      @else
       $decimal = 2;
      @endif

      var monthlySubscription = parseFloat($('#rangeMonthlySubscription').val());
      var numberFollowers = parseFloat($('#rangeNumberFollowers').val());

      var estimatedFollowers = (numberFollowers * 5 / 100)
      var followersAndPrice = (estimatedFollowers * monthlySubscription);
      var percentageAvgFollowers = (followersAndPrice * fee / 100);
      var earnAvg = followersAndPrice - percentageAvgFollowers;

      return decimalFormat(earnAvg.toFixed($decimal));
    }
   $('#estimatedEarn').html(earnAvg());

   $("#rangeNumberFollowers, #rangeMonthlySubscription").on('change', function() {

     $('#estimatedEarn').html(earnAvg());

   });
  </script>
@endif

@if (session('success_verify'))
  <script type="text/javascript">

	swal({
		title: "{{ trans('general.welcome') }}",
		text: "{{ trans('users.account_validated') }}",
		type: "success",
		confirmButtonText: "{{ trans('users.ok') }}"
		});
    </script>
	 @endif

	 @if (session('error_verify'))
   <script type="text/javascript">
	swal({
		title: "{{ trans('general.error_oops') }}",
		text: "{{ trans('users.code_not_valid') }}",
		type: "error",
		confirmButtonText: "{{ trans('users.ok') }}"
		});
    </script>
	 @endif

@endsection
