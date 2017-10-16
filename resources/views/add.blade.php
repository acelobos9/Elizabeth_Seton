@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard</div>

                <div class="panel-body">
				<table class="table table-responsive table-bordered">
				<thead>
					<tr>
						<th>User ID</th>
						<th>First Name</th>
						<th>First Last</th>

					</tr>
				</thead>
					<tbody>
		
                    @foreach($users as $userData)
                    <tr>
                    	<td>{{ $userData->id }}</td>
                    	<td>{{ $userData->firstName }}</td>
                    	<td>{{ $userData->lastName }}</td>	
                    </tr>
                    @endforeach

					</tbody>
				</table>
<hr>
		<form action="{{ url('/add-user') }}" method="post">
			{{ csrf_field() }}
		
		<div class="row">
			<div class="col-lg-12">
				
				<h3>New User Details</h3>
				<br>
				<div class="col-md-6">
					<div class="form-material form-material-primary floating">
			            <input class="form-control" type="text" id="firstName" name="firstName" required="" autofocus="">
			            <label>First Name</label>
					</div>	
				</div>
				<div class="col-md-6">
					<div class="form-material form-material-primary floating">
			            <input class="form-control" type="text" id="firstName" name="lastName" required="" autofocus="">
			            <label>Last Name</label>
					</div>
				</div>
				
                
            </div>
            <div class="col-md-8">
            	<div class="block block-themed">
<div class="block-header bg-success">
<ul class="block-options">
<li>
<button type="button" data-toggle="block-option" data-action="refresh_toggle" data-action-mode="demo"><i class="si si-refresh"></i></button>
</li>
<li>
<button type="button" data-toggle="block-option" data-action="content_toggle"><i class="si si-arrow-up"></i></button>
</li>
</ul>
<h3 class="block-title">Bootstrap</h3>
</div>
<div class="block-content">
<form class="form-horizontal push-5-t" action="base_forms_premade.php" method="post" onsubmit="return false;">
<div class="form-group">
<label class="col-xs-12" for="register1-username">Username</label>
<div class="col-xs-12">
<input class="form-control" type="text" id="register1-username" name="register1-username" placeholder="Enter your username..">
</div>
</div>
<div class="form-group">
<label class="col-xs-12" for="register1-email">Email</label>
<div class="col-xs-12">
<input class="form-control" type="email" id="register1-email" name="register1-email" placeholder="Enter your email..">
</div>
</div>
<div class="form-group">
<label class="col-xs-12" for="register1-password">Password</label>
<div class="col-xs-12">
<input class="form-control" type="password" id="register1-password" name="register1-password" placeholder="Enter your password..">
</div>
</div>
<div class="form-group">
<label class="col-xs-12" for="register1-password2">Confirm Password</label>
<div class="col-xs-12">
<input class="form-control" type="password" id="register1-password2" name="register1-password2" placeholder="Confirm your password..">
</div>
</div>
<div class="form-group">
<div class="col-xs-12">
<label class="css-input switch switch-sm switch-success">
<input type="checkbox" id="register1-terms" name="register1-terms"><span></span> Agree to terms?
</label>
</div>
</div>
<div class="form-group">
<div class="col-xs-12">
<button class="btn btn-sm btn-success" type="submit"><i class="fa fa-plus push-5-r"></i> Register</button>
</div>
</div>
</form>
</div>
</div>
            </div>
        </div>
        <hr>
        <div align="right">
        	<button class="btn btn-success btn-lg" type="submit">Add User</button>
        </div>
		</form>	
    </div>
    </div>
</div>
@endsection
