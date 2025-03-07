@extends('layouts.app')
@section('title') {{__('admin.donation')}} -@endsection
@section('css')
    <style>
        .custom-card {
            margin-bottom: 20px;
        }
        .custom-card .card {
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
            overflow: hidden;
        }
        .custom-card .card:hover {
            transform: translateY(-5px);
        }
        .custom-card .card-img-top {
            height: 200px;
            object-fit: cover;
        }
        .custom-card .badge {
            font-size: 0.9rem;
            padding: 0.5em 0.75em;
        }
        .custom-card .card-actions {
            position: absolute;
            top: 10px;
            right: 10px;
            display: flex;
            gap: 8px;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .custom-card .card:hover .card-actions {
            opacity: 1;
        }
        .custom-card .card-actions .btn {
            background: rgba(255, 255, 255, 0.8);
            border: none;
            border-radius: 50%;
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.3s ease;
        }
        .custom-card .card-actions .btn:hover {
            background: rgba(255, 255, 255, 1);
        }
        .custom-card .card-actions .btn-edit {
            color: #007bff;
        }
        .custom-card .card-actions .btn-delete {
            color: #dc3545;
        }
        .custom-card .card-title {
            font-size: 1.25rem;
            font-weight: bold;
            margin-bottom: 0.75rem;
        }
        .custom-card .card-text {
            font-size: 0.9rem;
            color: #555;
        }
        .custom-card .target-amount {
            font-size: 1rem;
            font-weight: bold;
            color: #28a745;
        }
        .custom-card .progress {
            height: 8px;
            border-radius: 4px;
            margin-top: 10px;
            background-color: #e9ecef;
        }
        .custom-card .progress-bar {
            background-color: #28a745;
            border-radius: 4px;
        }
    </style>
@endsection
@section('content')
    <section class="section section-sm">
        <div class="container">
            <div class="row justify-content-center text-center mb-sm">
                <div class="col-lg-8 py-5">
                    <h2 class="mb-0 font-montserrat"><i class="bi bi-coin mr-2"></i> {{__('admin.donation')}}</h2>
                </div>
            </div>
            <div class="row">
                @include('includes.cards-settings')
                <div class="col-md-6 col-lg-9 mb-5 mb-lg-0">
                    @if (session('status'))
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                            {{ session('status') }}
                        </div>
                    @endif
                    <div class="d-block d-md-flex justify-content-center align-items-center">
                        <a class="btn btn-1 btn-primary btn-block mb-3" href="{{route('donation.create')}}"><i class="bi-plus"></i> {{ __('general.add_new')}}</a>
                    </div>
                    <div class="row mt-3">
                        @forelse($donations as $donation)
                            <div class="col-lg-6 col-12 custom-card">
                                <div class="card">
                                    <img src="{{Helper::getFile('uploads/donation/'.$donation->preview)}}" class="card-img-top" alt="Project Image">
                                    <div class="card-actions">
                                        <a href="{{route('donation.edit',['id'=>$donation->id])}}" class="btn-edit" ><i class="fas fa-edit"></i></a>
                                        @if($donation->status == '0')
                                            <a href="{{route('donation.destroy',['id'=>$donation->id])}}" class="btn btn-delete"><i class="fas fa-trash"></i></a>
                                        @endif
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title">{{$donation->title}}</h5>
                                        <p class="card-text">{{$donation->description}}</p>
                                        <p class="target-amount">{{Helper::amountFormatDecimal($donation->amount)}}</p>
                                        <p style="margin: 0;">({{$donation->collected_percentage}}% {{__('general.of')}} {{Helper::amountFormatDecimal($donation->amount)}})</p>
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" style="width: {{$donation->collected_percentage}}%;" aria-valuenow="{{$donation->collected_percentage}}" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <div class="mt-3">
                                            @php
                                                $status = 'Inactive';
                                                $class = 'danger';
                                                if($donation->status == '1'){
                                                    $status = 'Active';
                                                    $class = 'success';
                                                }
                                            @endphp
                                            <span class="badge badge-{{$class}}">{{$status}}</span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        @empty
                        @endforelse
                        <div class="col-lg-12 col-12">
                            <div class="text-center mb-3">
                                <h2>Donation History</h2>
                            </div>
                            <div class="card shadow-sm">
                                <div class="table-responsive">
                                    <table class="table table-striped m-0">
                                        <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Amount</th>
                                            <th scope="col">Date</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @forelse($histories as $history)
                                            <tr>
                                                <td>{{$history->id}}</td>
                                                <td><a href="{{url($history->donor->username)}}">{{$history->donor->username}}</a></td>
                                                <td>{{Helper::amountFormatDecimal($history->gross_amount)}}</td>
                                                <td>{{Helper::formatDate($history->created_at)}}</td>
                                            </tr>
                                        @empty
                                        @endforelse
                                        </tbody>
                                    </table>
                                </div>
                                {{$histories->links()}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

@endsection
@section('javascript')
    <script>
        $(document).on('click', '.btn-delete', function (e) {
            e.preventDefault();
            var element = $(this);
            var id = element.data("id");
            element.blur();
            swal(
                {
                    title: delete_confirm,
                    type: "error",
                    showLoaderOnConfirm: true,
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: yes_confirm,
                    cancelButtonText: cancel_confirm,
                    closeOnConfirm: true,
                },
                function (isConfirm) {
                    if (isConfirm) {
                        window.location.href = element.attr('href');
                    }
                });
        });
    </script>
@endsection
