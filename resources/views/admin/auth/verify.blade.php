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
      <p class="login-box-msg">Provide Registered Email To Reset Password</p>

    @if(session('err_login'))
      <div class="alert alert-danger">{{session('err_login')}} !</div>
    @elseif(session('success_msg'))
      <div class="alert alert-success">{{session('success-msg')}} !</div>
    @endif

      <form action="{{ route('verify-email') }}" method="POST">
        @csrf
    
        <div class="input-group mb-3">
          <input type="email" name="email" class="form-control" value="{{old('email')}}" placeholder="Email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <span class="text-danger">@error('email'){{ $message }}@enderror</span>

          <!-- /.col -->
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block">Send OTP in Email</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <p class="mb-4">
        <a class="ml-4" href="login">Back to Login</a>
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