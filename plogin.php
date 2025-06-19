<?php include_once("pheader.php");?>

<?php
include_once("dbconfig.php");
if($_SERVER['REQUEST_METHOD']=="POST")
{
	$email=$_POST["email"];
	$pass=$_POST["password"];
		$sql = "select * from patients where Email_id='$email' and Password='$pass'";
        $result = $con->query($sql);
		if ($result->num_rows > 0)
		{   
            $row = $result->fetch_assoc();
			session_start();
			$_SESSION['patients']=$row['Patient_id'];
			$_SESSION['patientsname']=$row['Name'];
			
			header("location: myappointmentlist.php");
		}
		else
		{
			echo "<script> alert('invalid details');</script>";
		}
		
}
?>	
<section class="page-title bg-1">
  <div class="overlay"></div>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="block text-center">
          <span class="text-white">Get in Touch</span>
          <h1 class="text-capitalize mb-5 text-lg">Login</h1>

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
<!-- contact form start -->

<section class="contact-form-wrap section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section-title text-center">
                    <h2 class="text-md mb-2">Login</h2>
                    <div class="divider mx-auto my-4"></div>
                    <!-- <p class="mb-5">Laboriosam exercitationem molestias beatae eos pariatur, similique, excepturi mollitia sit perferendis maiores ratione aliquam?</p> -->
                </div>
            </div>
        </div>
        <div class="row">
		<div class="col-lg-3 col-md-3 col-sm-3">
		</div>	
            <div class="col-lg-6 col-md-6 col-sm-6">
                <form id="contact-form" class="contact__form " method="post">
                 <!-- form message -->
                    <div class="row">
                        <div class="col-12">
                            <div class="alert alert-success contact__msg" style="display: none" role="alert">
                                Your message was sent successfully.
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        
						
					<div class="col-lg-12">
                            <div class="form-group">
							Email:   <input name="email" id="email" type="email" class="form-control" placeholder="Your Email Address">
                            </div>
                        </div>
						
					Password: 	<div class="col-lg-12">
							<div class="form-group">
								<input type="password" class="form-control form-control-lg" placeholder="**********" name="password">
								</div>
							</div>
                        
                    </div>

                    
                    <div class="text-center">
                        <input class="btn btn-main btn-round-full" name="submit" type="submit" value="submit"></input>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<?php include_once("pfooter.php");?>