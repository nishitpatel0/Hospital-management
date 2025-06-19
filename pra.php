<?php
if($_SERVER['REQUEST_METHOD']=="POST")
{
    $servername="localhost";
    $username= "root";
    $password= "";
    $dbname= "rachana_hospital";
    $con=new mysqli($servername, $username, $password, $dbname);
    if ($con->connect_error) {
        die("Some Error:". $con->connect_error);
    }
    $pname= $_POST["pname"];
    $padd= $_POST["padd"];
    $pdate= $_POST["pdate"];
    $pcon= $_POST["pcon"];
	$Email_id= $_POST["Email_id"];
	$Password= $_POST["Password"];
    $pgender= $_POST["gender"];
    $pheight= $_POST["pheight"];
    $pweight= $_POST["pweight"];
    $pblood= $_POST["pblood"];
    $sql = "INSERT INTO `patients`( `Name`, `Address`, `Date_of_birth`, `Contact_no`, `Email_id`, `Password`, `Gender`, `Height`, `Weight`, `Blood_Group`) VALUES ('$pname','$padd','$pdate','$pcon','$Email_id','$Password','$pgender','$pheight','$pweight','$pblood')";
    $result = $con->query($sql);
    echo "Inserted";
    header("location: plogin.php");
}
?>
<?php include_once("dbconfig.php");?>
<?php include_once("pheader.php");?>
<section class="page-title bg-1">
  <div class="overlay"></div>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="block text-center">
          <span class="text-white">Get in Touch</span>
          <h1 class="text-capitalize mb-5 text-lg">Registration</h1>

          <!-- <ul class="list-inline breadcumb-nav">
            <li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
            <li class="list-inline-item"><span class="text-white">/</span></li>
            <li class="list-inline-item"><a href="#" class="text-white-50">Contact Us</a></li>
          </ul> -->
        </div>
      </div>
    </div>
  </div>
</section>
<div class="col-lg-6">
                <div class="section-title text-center">
                    <h2 class="text-md mb-2"> Registration</h2>
                    <div class="divider mx-auto my-4"></div>
                    <p class="mb-5"></p>
                </div>
            </div>

					<form method="POST">
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">patients Name:</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" type="text" name="pname" placeholder="Enter Name">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">address</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" placeholder="address" type="text"name="padd">
							</div>
						</div>
                        <div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Date</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" placeholder="Select Date" type="date"name="pdate">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">contact</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" value="" type="tel"name="pcon">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Email_id</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" value="" type="text"name="Email_id">
							</div>
						</div>
                        <div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Password</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" placeholder="" type="password"name="Password">
							</div>
						</div>
                        <div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">gender</label>
							<div class="col-sm-12 col-md-10">
								
								<label>
								<input type="radio" name="gender" value="male"> Male
							</label>
							<label>
								<input type="radio" name="gender" value="female"> Female
							</label>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">hight</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" placeholder="hight" type="text"name="pheight">
							</div>
						</div>
                        <div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">weight</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" placeholder="weight" type="text"name="pweight">
							</div>
						</div>
                        <div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">blood_group</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" placeholder="blood_group" type="text"name="pblood">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-12 col-md-10">
							<input class="btn btn-primary" value="Add" type="submit">
							</div>
						</div>

					</form>
					



<?php include_once("pfooter.php");?>
