@extends('layouts.app')
@section('title') {{__('admin.create_donation')}} -@endsection
@section('content')
    <section class="section section-sm">
        <div class="container">
            <div class="row justify-content-center text-center mb-sm">
                <div class="col-lg-8 py-5">
                    <h2 class="mb-0 font-montserrat"><i class="bi bi-coin mr-2"></i> {{__('admin.edit_donation')}}</h2>
                </div>
            </div>
            <div class="row">
                @include('includes.cards-settings')
                <div class="col-md-6 col-lg-9 mb-5 mb-lg-0">
                    <form action="{{route('donation.update',['id'=>$donation->id])}}" method="POST"  accept-charset="UTF-8" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="form-group">
                            <label>{{__('admin.title')}}*</label>
                            <input type="text" class="form-control" name="title" required value="{{$donation->title}}">
                            @error('title')
                            <div class="invalid-feedback d-block">{{$message}}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label>{{__('admin.description')}}*</label>
                            <textarea class="form-control" name="description" required>{{$donation->description}}</textarea>
                            @error('description')
                            <div class="invalid-feedback d-block">{{$message}}</div>
                            @enderror
                        </div>
                        <div class="form-group preview-shop">
                            <label for="preview">{{ __('admin.thumbnail') }} <small>(JPG, PNG)</small></label>
                            <input type="file" name="preview" id="preview" accept="image/*">
                            @error('fileuploader-list-preview')
                                <div class="invalid-feedback d-block">{{$message}}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label>{{__('admin.target_amount')}}*</label>
                            <input type="number" readonly step="any" class="form-control" name="amount"  value="{{$donation->amount}}" required>
                            @error('amount')
                            <div class="invalid-feedback d-block">{{$message}}</div>
                            @enderror
                        </div>
                        <div class="btn-block mb-4">
                            <div class="custom-control custom-switch custom-switch-lg">
                                <input type="checkbox" class="custom-control-input" name="active_status" value="1" @if (old('active_status',$donation->status) == '1') checked @endif id="customSwitch6">
                                <label class="custom-control-label switch" for="customSwitch6">{{ __('admin.active_status') }}</label>
                            </div>
                        </div>
                        <button class="btn btn-1 btn-success btn-block" onClick="this.form.submit(); this.disabled=true; this.innerText='{{ __('general.please_wait')}}';" type="submit">{{ __('general.save_changes')}}</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
@endsection
@section('javascript')
    <script>
        var uploadedFile = "{{ old('preview', $imageUrl ?? '') }}";
        var fileData = uploadedFile ? [{
            name: uploadedFile.split('/').pop(),
            size: 1024,
            type: 'image/' + uploadedFile.split('.').pop(),
            file: uploadedFile,
            uploaded: true
        }] : [];
    </script>
    <script src="{{ asset('public/js/fileuploader/fileuploader-donation.js') }}"></script>

@endsection
