
<?php include_once("pheader.php");?>
<?php include_once("dbconfig.php");?>
<?php
if($_SERVER['REQUEST_METHOD']=="POST")
{
    if ($con->connect_error) {
        die("Some Error:". $con->connect_error);
    }
    session_start();
    $Patient_id = $_SESSION["patients"];
    $Doctor_id = $_POST["Doctor_id"];
    $Date= $_POST["Date"];
    $Time= $_POST["Time"];
    $Status= "Pending";
    $Typeid= $_POST["Typeid"];
    $sql = "select * from appointment_type where atype_id='$Typeid'";
    $result = $con->query($sql);
    $row=$result->fetch_assoc();
    $atype=$row['TYPE'];
    $charge=$row['CHARGE'];
    $Complaints= $_POST["Complaints"];
    $sql = "insert into appointment (`Patient_id`, `Doctor_id`, `Date`, `Time`, `Status`, `TYPE`, `CHARGE`, `Complaints`) values('$Patient_id','$Doctor_id','$Date','$Time','$Status','$atype','$charge','$Complaints')";
    $result = $con->query($sql);
    echo "Inserted";
    header("location: myappointmentlist.php");
}
?><section class="page-title bg-1">
  <div class="overlay"></div>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="block text-center">
          <span class="text-white">Book your Seat</span>
          <h1 class="text-capitalize mb-5 text-lg">Appoinment</h1>

          <!-- <ul class="list-inline breadcumb-nav">
            <li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
            <li class="list-inline-item"><span class="text-white">/</span></li>
            <li class="list-inline-item"><a href="#" class="text-white-50">Book your Seat</a></li>
          </ul> -->
        </div>
      </div>
    </div>
  </div>
</section>

<section class="appoinment section">
  <div class="container">
    <div class="row">
      <div class="col-lg-4">
          <div class="mt-3">
            <div class="feature-icon mb-3">
              <i class="icofont-support text-lg"></i>
            </div>
             <span class="h3">Call for an Emergency Service!</span>
              <h2 class="text-color mt-3">+91 9316767191 </h2>
          </div>
      </div>

      <div class="col-lg-8">
           <div class="appoinment-wrap mt-5 mt-lg-0 pl-lg-5">
            <h2 class="mb-2 title-color">Book an appoinment</h2>
               <form id="post" class="appoinment-form" method="POST">
                    <div class="row">
                         <div class="col-lg-10">
              
                        <div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Doctor_id</label>
							<div class="col-sm-12 col-md-10">
                            <?php 
                                $sql = "select * from doctor";
                                $result = $con->query($sql);
                                ?>
                            <select name="Doctor_id" class="form-control">
                            <?php
                            while ($row = $result->fetch_assoc()) {?>
                                <option value="<?php echo $row['Doctor_id'];?>"><?php echo $row['Name'];?></option>
                            <?php } ?>
                            </select>
                            </div>
						</div>
                        <div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Date</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" placeholder="" type="Date"name="Date">
							</div>
						</div>
                        <div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Time</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" placeholder="" type="Time"name="Time">
							</div>
						</div>
              
                        <div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Type</label>
							<div class="col-sm-12 col-md-10">
              <?php 
                                $sql = "select * from appointment_type";
                                $result = $con->query($sql);
                                ?>
                            <select name="Typeid" class="form-control">
                            <?php
                            while ($row = $result->fetch_assoc()) {?>
                                <option value="<?php echo $row['atype_id'];?>"><?php echo $row['TYPE'];?></option>
                            <?php } ?>
                            </select>
							</div>
						</div>
                        <div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Complaints</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" placeholder="" type="text"name="Complaints">
							</div>
						</div>

                    <button type="submit" class="btn btn-main btn-round-full" >Make Appoinment <i class="icofont-simple-right ml-2"></i></button>
                </form>
            </div>
        </div>
      </div>
    </div>
  </div>
</section>


<?php include_once("pfooter.php");?>

   

    