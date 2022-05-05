<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Login Page</title>

  <!-- Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="{{ asset('admin-assets/plugins/fontawesome-free/css/all.min.css') }}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ asset('admin-assets/dist/css/adminlte.min.css') }}">
    </head>


<body class="hold-transition login-page">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <img src="{{ url(config('constants.APP_LOGO')) }}" alt=""><b><br>
        <h1>{{ config('constants.LOGO_TITLE') }}</h1>
    </div>
    <div class="card-body">
      <p class="login-box-msg">Sign in to start your session</p>

    @if(session('err_login'))
      <div class="alert alert-danger">{{session('err_login')}} !</div>
    @elseif(session('succ_msg'))
      <div class="alert alert-success">{{session('succ_msg')}} !</div>
    @endif

      <form action="{{ route('reset-password') }}" method="POST">
        @csrf
    
        <div class="input-group mb-3">
          <input type="number" name="token" class="form-control" value="{{old('otp')}}" placeholder="Enter OTP">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-key"></span>
            </div>
          </div>
        </div>
        <span class="text-danger">@error('otp'){{ $message }}@enderror</span>

        <input type="hidden" name="hidden_token" value="{{ session('token') }}">
        <input type="hidden" name="email" value="{{ session('email') }}">

        <div class="input-group mb-3">
          <input type="password" name="password" class="form-control" value="{{old('password')}}" placeholder="New Password">
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
      <!--  <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                Remember Me
              </label>
            </div>
          </div>-->
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <p class="mb-1">
        <a class="ml-4" href="verify">I forgot my password</a>
      </p>
      <p class="mb-3 ml-4">
        <a href="register.html" class="text-center">Register a new membership</a>
      </p>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="{{ asset('admin-assets/plugins/jquery/jquery.min.js') }}"></script>
<!-- Bootstrap 4 -->
<script src="{{ asset('admin-assets/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('admin-assets/dist/js/adminlte.min.js') }}"></script>
</body>
</html>