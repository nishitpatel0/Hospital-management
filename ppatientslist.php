<?php include_once("pheader.php");?>
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>patients Table</h4>
							</div>
							
						</div>
						<div class="col-md-6 col-sm-12 text-right">
							
						</div>
					</div>
				</div>
				
				<div class="card-box mb-30">
					
					<div class="pb-20">
					
						<table class="table hover multiple-select-row data-table-export nowrap">
							<thead>
								
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Address</th>
								<th>Date_of_birth</th>
								<th>Contact_no</th>
								<th>Email</th>
								<th>Password</th>
								<th>Gender</th>
								<th>Height</th>
								<th>Weight</th>
								<th>Blood_Group</th>
								<th>Action</th>
							</tr>
							</thead>
							<tbody>
                                <?php
                                $sql = "select * from patients";
                                $result = $con->query($sql);
                                if ($result->num_rows > 0)
                                {   
                                    while ($row = $result->fetch_assoc()) 
                                    {
                                ?>
                                   <tr>
											<td><?php echo $row["Patient_id"];?></td>
											<td><?php echo $row["Name"];?></td>
											<td><?php echo $row["Address"];?></td>
											<td><?php echo $row["Date_of_birth"];?></td>
											<td><?php echo $row["Contact_no"];?></td>
											<td><?php echo $row["Email_id"];?></td>
											<td><?php echo $row["Password"];?></td>
											<td><?php echo $row["Gender"];?></td>
											<td><?php echo $row["Height"];?></td>
											<td><?php echo $row["Weight"];?></td>
											<td><?php echo $row["Blood_Group"];?></td>
											<td><a href="patientsdelete.php?id=<?php echo $row["Patient_id"];?>">Delete</a>   <a href="patientsedit.php?id=<?php echo $row["Patient_id"];?>">edit</a></td>     
									</tr>
                                <?php 
                                }
                            }?>
							</tbody>
						</table>						
					</div>
				</div>
				<!-- Export Datatable End -->
			</div>
			<div class="footer-wrap pd-20 mb-20 card-box">
				DeskApp - Bootstrap 4 Admin Template By <a href="" target="_blank">nilesh rathod</a>
			</div>
		</div>
	</div>
<?php include_once("pfooter.php");?>
