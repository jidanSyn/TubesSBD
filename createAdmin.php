<?php
    include('function.php');
    if(isset($_POST["register"])) {
        if(register($_POST) > 0) {
            echo "<script>
                    alert('New Admin has been created');
                    document.location.href = 'login.php';
                    </script>";
        } else {
            echo mysqli_error($conn);
        }
    }
?>

<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        label {
            display: block;
        }
    </style>
    <title>Document</title>
</head>
<body>
    <h1>Create Admin</h1>

    <form action="" method="post">
        <ul style="list-style: none;">
                <li>
                    <label for="username">Username: </label>
                    <input type="text" name="username" id="username">
                </li>
                <li>
                    <label for="password">Password: </label>
                    <input type="password" name="password" id="password">
                </li>
                <li>
                    <label for="confirm">Confirm Password: </label>
                    <input type="password" name="confirm" id="confirm">
                </li>
                <li>
                    <button type="submit" name="register">Register</button>
                </li>
        </ul>
    </form>
</body>
</html> -->


<!doctype html>
<html lang="en">
  <head>
  	<title>Register</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="loginpack/css/style.css">

	</head>
	<body>
			
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<!-- <div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Register</h2>
				</div> -->
			</div>
			<div class="row justify-content-center">
				<div class="col-md-12 col-lg-10">
					<div class="wrap d-md-flex">
						<div class="img" style="background-image: url(loginpack/images/ex.jpg);">
			      </div>
						<div class="login-wrap p-4 p-md-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3 class="mb-4">Sign Up</h3>
			      		</div>
								<div class="w-100">
									<p class="social-media d-flex justify-content-end">
										<a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
										<a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
									</p>
								</div>
			      	</div>
							<form action="" class="signin-form" method="post">
			      		<div class="form-group mb-3">
			      			<label class="label" for="username">Username</label>
			      			<input type="text" class="form-control" placeholder="Username" name="username" id="username" required>
			      		</div>
		            <div class="form-group mb-3">
		            	<label class="label" for="password">Password</label>
		              <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
		            </div>
                    <div class="form-group mb-3">
		            	<label class="label" for="confirm">Confirm Password</label>
		              <input type="password" name="confirm" id="confirm" class="form-control" placeholder="Confirm Password" required>
		            </div>
		            <div class="form-group">
		            	<button type="submit" name="register" class="form-control btn btn-primary rounded submit px-3">Register</button>
		            </div>
		            
		          </form>
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

    <script src="loginpack/js/jquery.min.js"></script>
  <script src="loginpack/js/popper.js"></script>
  <script src="loginpack/js/bootstrap.min.js"></script>
  <script src="loginpack/js/main.js"></script>

	</body>
</html>

