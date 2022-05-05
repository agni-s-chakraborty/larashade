@extends('admin.layouts.app')
    @section('content')
        <!-- Main content -->
        <div class="content">
            <div class="row">
                <div class="col-lg-3 col-6">
                  <!-- small box -->
                  <div class="small-box bg-info">
                    <div class="inner">
                      <h3>150</h3>
      
                      <p>Flights</p>
                    </div>
                    <div class="icon">
                      <i class="ion ion-bag"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                  </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-6">
                  <!-- small box -->
                  <div class="small-box bg-success">
                    <div class="inner">
                      <h3>53<sup style="font-size: 20px">%</sup></h3>
      
                      <p>Hotels</p>
                    </div>
                    <div class="icon">
                      <i class="ion ion-stats-bars"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                  </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-6">
                  <!-- small box -->
                  <div class="small-box bg-warning">
                    <div class="inner">
                      <h3>44</h3>
      
                      <p>Customers</p>
                    </div>
                    <div class="icon">
                      <i class="ion ion-person-add"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                  </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-6">
                  <!-- small box -->
                  <div class="small-box bg-danger">
                    <div class="inner">
                      <h3>65</h3>
      
                      <p>Bookings</p>
                    </div>
                    <div class="icon">
                      <i class="ion ion-pie-graph"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                  </div>
                </div>
                <!-- ./col -->
              </div>
              <!-- /.row -->

              @if(session('err_login'))
              <div class="alert alert-danger">{{session('err_login')}} </div>
              @elseif(session('succ_msg'))
              <div class="alert alert-success">{{session('succ_msg')}} </div>
            @endif
            <div class="container">
              <div class="card card-secondary">
                <div class="card-header">
                  <h3 class="card-title">Add New Record</h3>
  
                  <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="maximize"><i class="fas fa-expand"></i>
                    </button>
                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                    </button>
                    <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i>
                    </button>
                  </div>
                  <!-- /.card-tools -->
                </div>
                
                <!-- /.card-header -->
                <div class="card-body">
                
                    <div class="row">
                      
                      <div class="col-md-6">

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
                
                      </div>
                      
                      <div class="col-md-6">

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
                        
                        <button type="submit" class="btn btn-primary">Register</button>
                       
                       

                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->


              <div class="container">
                <div class="card card-secondary">
                  <div class="card-header">
                    <h3 class="card-title">View All Records</h3>
    
                    <div class="card-tools">
                      <button type="button" class="btn btn-tool" data-card-widget="maximize"><i class="fas fa-expand"></i>
                      </button>
                      <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                      </button>
                      <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i>
                      </button>
                    </div>
                    <!-- /.card-tools -->
                  </div>
                  
                  <!-- /.card-header -->
                  <div class="card-body">
                  
                    <table id="example1" class="table table-bordered table-striped">
                      <thead>
                      <tr>
                        <th>Name</th>
                        <th>User type</th>
                        <th>Email</th>
                        <th>Created at</th>
                        <th>Action</th>
                      </tr>
                      </thead>
                      <tbody>
                        @foreach ($all_data as $user)
                          <tr>
                            <td>{{ $user->name }}</td>
                            <td>@if ($user->is_admin == 1){{ 'Admin' }}@else {{ 'Member' }}@endif</td>
                            <td>{{ $user->email }}</td>
                            <td>{{ $user->created_at }}</td>
                            <td><a class="btn btn-danger" href="{{ "members-remove/".$user->id }}"><i class="fas fa-trash"></i></a></td>
                          </tr>
                        @endforeach
                   
                      </tbody>
                    </table>
                    </div>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.card -->


        </div>
        <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
    @endsection

    @section('scripts')

        <script src=""></script>

    @endsection