<?php 
session_start();
if(isset($_SESSION['patients'])==false)
header("location: plogin.php");
include_once("pheader.php");?>
<?php include_once("dbconfig.php");?>
<section class="page-title bg-1">
  <div class="overlay"></div>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="block text-center">
          <span class="text-white">Get in Touch</span>
          <h1 class="text-capitalize mb-5 text-lg">my appointment</h1>

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
<table class="table hover multiple-select-row data-table-export nowrap">
							<thead>
								
							<tr>
                                <th>Appointment_id</th>
                                <th>Doctor </th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Status</th>
                                <th>Type</th>
                                <th>charge</th>
                                <th>Complaints</th>
                                <th>Action</th>
                </tr>
							</thead>
							<tbody>
                                <?php
                                $pid=$_SESSION['patients'];
                                $sql = "select * from appointmentview where Patient_id=$pid";
                                $result = $con->query($sql);
                                if ($result->num_rows > 0)
                                {   
                                    while ($row = $result->fetch_assoc()) 
                                    {
                                ?>
                                   <tr>
                                        <td><?php echo $row["Appointment_id"];?></td>
                                      <td><?php echo $row["Name"];?></td>
                                      <td><?php echo $row["Date"];?></td>
                                      <td><?php echo $row["Time"];?></td>
                                      <td><?php echo $row["Status"];?></td>
                                        <td><?php echo $row["Type"];?></td>
                                        <td><?php echo $row["Charge"];?></td>
                                        <td><?php echo $row["Complaints"];?></td>
                                        <td><a href="appointmentdelete.php?id=<?php echo $row["Appointment_id"];?>">Delete</a></td>
                                        
									</tr>
                                <?php 
                                    }
                                }?>
							</tbody>
						</table>		
<?php include_once("pfooter.php");?>