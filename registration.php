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
    $pgender= $_POST["pgender"];
    $pheight= $_POST["pheight"];
    $pweight= $_POST["pweight"];
    $pblood= $_POST["pblood"];
    $sql = "insert into patients( Name, Address, Date_of_birth, Contact_no,Email_id,Gender,Height, Weight, Blood_Group) values('$pname','$padd','$pdate','$pcon','$Email_id','$Password','$pgender','$pheight','$pweight','$pblood')";
    $result = $con->query($sql);
    echo "Inserted";
    // header("location: patientslist.php");
}
?>
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

<section class="registration-form-wrap section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section-title text-center">
                    <h2 class="text-md mb-2"> Registration</h2>
                    <div class="divider mx-auto my-4"></div>
                    <p class="mb-5"></p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                
            </div>
        </div>
    </div>
</section>
<?php include_once("pfooter.php");?>