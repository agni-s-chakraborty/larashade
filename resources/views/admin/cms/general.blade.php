@extends('admin.layouts.app')
    @section('content')
        <!-- Main content -->
        <div class="content">
         
             @if(session('err_login'))
              <div class="alert alert-danger">{{session('err_login')}} </div>
              @elseif(session('succ_msg'))
              <div class="alert alert-success">{{session('succ_msg')}} </div>
              @elseif(session('succ_msg'))
              <div class="alert alert-danger">{{session('rec_del')}} </div>
            @endif
            <div class="container">
                <div class="card card-secondary">
                    <div class="card-header">
                      <h3 class="card-title">Add New Dynamic Section</h3>
      
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
                        @if(session('succ_msg'))
                        <div class="alert alert-success">{{session('succ_msg')}} </div>
                        @endif
                        <div class="row">
                          
                          <div class="col-md-6">
    
                            <form action="{{ route('section-new') }}" method="POST">
                              @csrf
                                <div class="input-group mb-3">
                                <input type="text" class="form-control" name ="sec_title" value="{{old('sec_title')}}" placeholder="Section name">
                                </div>
                            <span class="text-danger">@error('sec_title'){{ $message }}@enderror</span>
    
                            <button type="submit" class="btn btn-primary">Register</button>
                            </form>
                          </div>

                          <div class="col-md-6">
                            @foreach ($secdata as $sec)
                                <span class="btn btn-outline-danger btn-sm btn-round mr-4 mt-1">{{ $sec->sec_title }}
                                    <a href="{{ "section-remove/".$sec->id }}"><i class="fas fa-trash ml-1"></i></span></a> 
                            @endforeach
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
                      
                      <div class="col-md-12">

                        <form action="{{ route('cms-new') }}" method="POST" enctype="multipart/form-data">
                          @csrf

                        <div class="form-group  mb-3">
                          <select class="form-control" name="section">
                            <option value="#">Select Section</option>
                            @foreach ($secdata as $secop)
                              <option value="{{ $secop->sec_title }}">{{ $secop->sec_title }}</option>
                            @endforeach
                          </select>
                        </div>
                        <span class="text-danger">@error('section'){{ $message }}@enderror</span>
                
                        <div class="input-group mb-3">
                          <input type="text" class="form-control" name ="title" value="{{old('title')}}" placeholder="Title">
                          <div class="input-group-append">
                            <div class="input-group-text">
                              <span class="fas fa-user"></span>
                            </div>
                          </div>
                        </div>
                        <span class="text-danger">@error('title'){{ $message }}@enderror</span>

                        <div class="input-group mb-3">
                          <input type="text" class="form-control" name="subtitle1" value="{{old('subtitle1')}}" placeholder="Subtitle 1">
                       
                        </div>
                        <span class="text-danger">@error('subtitle2'){{ $message }}@enderror</span>

                        <div class="input-group mb-3">
                            <input type="text" class="form-control" name="subtitle2" value="{{old('subtitle2')}}" placeholder="Subtitle 2">
                            
                          </div>
                          <span class="text-danger">@error('subtitle3'){{ $message }}@enderror</span>

                          <div class="input-group mb-3">
                            <input type="text" class="form-control" name="subtitle3" value="{{old('subtitle3')}}" placeholder="Subtitle 3">
                           
                          </div>
                          <span class="text-danger">@error('subtitle3'){{ $message }}@enderror</span>
                          
                          <div class="input-group mb-3">
                            <input type="text" class="form-control" name="link" value="{{old('link')}}" placeholder="Link">
                            <div class="input-group-append">
                              <div class="input-group-text">
                                <span class="fas fa-link"></span>
                              </div>
                            </div>
                          </div>
                          <span class="text-danger">@error('link'){{ $message }}@enderror</span>

                          <div class="input-group mb-3">
                            <input type="text" class="form-control" name="link_text" value="{{old('link_text')}}" placeholder="Link Text">
                            <div class="input-group-append">
                              <div class="input-group-text">
                                <span class="fas fa-comment"></span>
                              </div>
                            </div>
                          </div>
                          <span class="text-danger">@error('link_text'){{ $message }}@enderror</span>

                          <div class="input-group mb-3">
                            <textarea name="description" class="form-control" placeholder="Description">{{old('description')}}</textarea>  
                          </div>
                          <span class="text-danger">@error('description'){{ $message }}@enderror</span>

                          <div class="input-group mb-3">
                            <label for="image" class="mr-3">Content Image</label>
                            <input type="file" name="image" id="image" class="">
                            <span class="text-danger">@error('image'){{ $message }}@enderror</span>
                          </div>
                          <br><br>
  
                        
                        <button type="submit" class="btn btn-primary">Register</button>
                        </form>
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
                        <th>Sl.</th>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Section</th>
                        <th>Subtitle1</th>
                        <th>Subtitle2</th>
                        <th>Subtitle3</th>
                        <th>Link</th>
                        <th>Description</th>
                        <th>Action</th>
                      </tr>
                      </thead>
                      <tbody>
                        @foreach ($all_data as $user)
                        <tr>
                          <td>{{ $user->id }}</td>
                          <td><img src="{{ url('general/'.$user->image) }}" width="90"></td>
                          <td>{{ $user->title }}</td>
                          <td>{{ $user->section }}</td>
                          <td>{{ $user->subtitle1 }}</td>
                          <td>{{ $user->subtitle2 }}</td>
                          <td>{{ $user->subtitle3 }}</td>
                          <td>{{ $user->link }}</td>
                          <td>{{ $user->description }}</td>
                          <td><a class="btn btn-danger" href="{{ "cms-remove/".$user->id }}"><i class="fas fa-trash"></i></a></td>
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