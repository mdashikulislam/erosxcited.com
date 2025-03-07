<ul class="list-unstyled d-lg-block d-none menu-left-home sticky-top">
	<li>
		<a href="{{url('/')}}" @if (request()->is('/')) class="active disabled" @endif>
			<i class="bi bi-house"></i>
			<span class="ml-2">{{ trans('admin.home') }}</span>
		</a>
	</li>
	<li>
		<a href="{{ url(auth()->user()->username) }}">
			<i class="bi bi-person-circle"></i>
			<span class="ml-2">{{ auth()->user()->verified_id == 'yes' ? trans('general.my_page') : trans('users.my_profile') }}</span>
		</a>
	</li>
	@if (auth()->user()->verified_id == 'yes')
	<li>
		<a href="{{ url('dashboard') }}">
			<i class="bi bi-sliders"></i>
			<span class="ml-2">{{ trans('admin.dashboard') }}</span>
		</a>
	</li>
	@endif
		<li>
			<a href="{{ url('my/purchases') }}" @if (request()->is('my/purchases')) class="active disabled" @endif>
				<i class="bi bi-cart-check"></i>
				<span class="ml-2">{{ trans('general.purchased') }}</span>
			</a>
		</li>
	<li>
		<a href="{{ url('messages') }}">
			<i class="bi bi-chat-dots"></i>
			<span class="ml-2">{{ trans('general.messages') }}</span>
		</a>
	</li>
	<li>
		<a href="{{ url('explore') }}" @if (request()->is('explore')) class="active disabled" @endif>
        <i class="far fa-compass"></i>
        <span class="ml-2">{{ trans('general.explore') }}</span>
		</a>
	</li>
	<li>
		<a href="{{ url('my/subscriptions') }}">
			<i class="bi bi-check"></i>
			<span class="ml-2">{{ trans('admin.subscriptions') }}</span>
		</a>
	</li>
	<li>
		<a href="{{ url('my/bookmarks') }}" @if (request()->is('my/bookmarks')) class="active disabled" @endif>
			<i class="bi bi-bookmark"></i>
			<span class="ml-2">{{ trans('general.bookmarks') }}</span>
		</a>
	</li>

</ul>
