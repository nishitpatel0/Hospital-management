<?php
$servername="localhost";
$username= "root";
$password= "";
$dbname= "rachana_hospital";
$con=new mysqli($servername, $username, $password, $dbname);
if ($con->connect_error) {
    die("Some Error:". $con->connect_error);
}
?>