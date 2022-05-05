<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Register Page</title>

  <!-- Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="{{ asset('admin-assets/plugins/fontawesome-free/css/all.min.css') }}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ asset('admin-assets/dist/css/adminlte.min.css') }}">
    </head>


<body class="hold-transition register-page">
<div class="register-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <img src="{{ url(config('constants.APP_LOGO')) }}" alt=""><b><br>
        <h1>{{ config('constants.LOGO_TITLE') }}</h1>
    </div>
    <div class="card-body">
      <p class="login-box-msg">Register a new membership</p>
      @if(session('reg_msg'))
        <div class="alert alert-success">{{session('reg_msg')}}</div>
       {{-- @php
        var_dump(session('reg_msg'));
      @endphp --}} 
      @endif
      <form action="{{ route('register-user') }}" method="POST">
        @csrf

        <div class="form-group  mb-3">
          <select class="form-control" name="is_admin">
            <option value="0">Member</option>
            <option value="1">Admin</option>
          </select>
        </div>
        <span class="text-danger">@error('is_admin'){{ $message }}@enderror</span>

        <div class="input-group mb-3">
          <input type="text" class="form-control" name ="name" value="{{old('name')}}" placeholder="Full name">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <span class="text-danger">@error('name'){{ $message }}@enderror</span>

        <div class="input-group mb-3">
          <input type="email" class="form-control" name="email" value="{{old('email')}}" placeholder="Email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <span class="text-danger">@error('email'){{ $message }}@enderror</span>

        <div class="input-group mb-3">
          <input type="password" class="form-control" name="password" value="{{old('password')}}" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <span class="text-danger">@error('password'){{ $message }}@enderror</span>

        <div class="input-group mb-3">
          <input type="password" name="password_confirmation" class="form-control" value="{{old('password_confirmation')}}" placeholder="Retype password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <span class="text-danger">@error('password_confirmation'){{ $message }}@enderror</span>

        
        
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="agreeTerms" name="terms" value="agree">
              <label for="agreeTerms">
               I agree to the <a href="#">terms</a>
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Register</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <a href="login" class=" text-center">I already have a membership</a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="{{ asset('admin-assets/plugins/jquery/jquery.min.js') }}"></script>
<!-- Bootstrap 4 -->
<script src="{{ asset('admin-assets/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('admin-assets/dist/js/adminlte.min.js') }}"></script>
</body>
</html>