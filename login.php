<?php
include_once("dbconfig.php");
if($_SERVER['REQUEST_METHOD']=="POST")
{
	$user=$_POST["options"];
	$email=$_POST["email"];
	$pass=$_POST["password"];
	if($user=="staff")
	{
		$sql = "select * from staff where Email_id='$email' and password='$pass'";
        $result = $con->query($sql);
		if ($result->num_rows > 0)
		{   
            $row = $result->fetch_assoc();
			session_start();
			$_SESSION['staff']=$row['Staff_id'];
			$_SESSION['staffname']=$row['Name'];
			
			 header("location: staff/dashboard.php");
		}
		else
		{
			echo "<script> alert('invalid details');</script>";
		}
	}	
	if($user=="doctor")
	{
		$sql = "select * from doctor where email_id='$email' and password='$pass'";
        $result = $con->query($sql);
		if ($result->num_rows > 0)
		{   
            $row = $result->fetch_assoc();
			session_start();
			$_SESSION['doctor']=$row['Doctor_id'];
			$_SESSION['doctorname']=$row['Name'];
			
			header("location: doctor/dashboard.php");
		}
		else
		{
			echo "<script> alert('invalid details');</script>";
		}
	}
	if($user=="admin")
	{
		$sql = "select * from admin where email_id='$email' and Password='$pass'";
        $result = $con->query($sql);
		if ($result->num_rows > 0)
		{   
            $row = $result->fetch_assoc();
			session_start();
			$_SESSION['admin']=$row['Admin_id'];
			$_SESSION['Admin_name']=$row['Name'];
			
			header("location: admin/dashboard.php");
		}
		else
		{
			echo "<script> alert('invalid details');</script>";
		}
	}
	
}	                   
?>
<!DOCTYPE html>
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>Rachana Hospital Bootstrap Admin Dashboard HTML Template</title>

	<!-- Site favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="vendors/images/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="vendors/images/favicon-16x16.png">

	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="vendors/styles/style.css">

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>
</head>
<body class="login-page">
	<div class="login-header box-shadow">
		<div class="container-fluid d-flex justify-content-between align-items-center">
			<div class="brand-logo">
				<a href="login.php">
					<img src="vendors/images/hospital5.png" widht="10" alt="">
				</a>
			</div>
			<div class="login-menu">
				<ul>
					<li><a href="register.html">Register</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7">
					<img src="vendors/images/logo1.png" alt="">
				</div>
				<div class="col-md-6 col-lg-5">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-primary">Login To Rachana Hospital</h2>
						</div>
						<form method="post">
							<div class="select-role">
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn active">
										<input type="radio" name="options" id="options" value="doctor">
										<div class="icon"><img src="vendors/images/briefcase.svg" class="svg" alt=""></div>
										<span>I'm</span>
										Doctor
									</label>
									<label class="btn">
										<input type="radio" name="options" id="options" value="staff">
										<div class="icon"><img src="vendors/images/person.svg" class="svg" alt=""></div>
										<span>I'm</span>
										Staff
									</label>
									<label class="btn">
										<input type="radio" name="options" id="options" value="admin">
										<div class="icon"><img src="vendors/images/person.svg" class="svg" alt=""></div>
										<span>I'm</span>
										Admin
									</label>
									
								</div>
							</div>
							<div class="input-group custom">
								<input type="email" class="form-control form-control-lg" placeholder="Username" name="email">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
								</div>
							</div>
							<div class="input-group custom">
								<input type="password" class="form-control form-control-lg" placeholder="**********" name="password">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
								</div>
							</div>
							<!-- <div class="row pb-30">
								<div class="col-6">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck1">
										<label class="custom-control-label" for="customCheck1">Remember</label>
									</div>
								</div>
								<div class="col-6">
									<div class="forgot-password"><a href="forgot-password.html">Forgot Password</a></div>
								</div>
							</div> -->
							<div class="row">
								<div class="col-sm-12">
									<div class="input-group mb-0">
										<!--
											use code for form submit
											<input class="btn btn-primary btn-lg btn-block" type="submit" value="Sign In">
										-->
										<button class="btn btn-primary btn-lg btn-block" >Sign In</button>
									</div>
									<!-- <div class="font-16 weight-600 pt-10 pb-10 text-center" data-color="#707373">OR</div>
									<div class="input-group mb-0">
										<a class="btn btn-outline-primary btn-lg btn-block" href="register.html">Register To Create Account</a>
									</div> -->
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="vendors/scripts/core.js"></script>
	<script src="vendors/scripts/script.min.js"></script>
	<script src="vendors/scripts/process.js"></script>
	<script src="vendors/scripts/layout-settings.js"></script>
</body>
</html>