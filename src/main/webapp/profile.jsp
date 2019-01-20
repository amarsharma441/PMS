<!DOCTYPE html>
<html>
<head>
    <title>Performance Managment System</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet'>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    body{
        background-image: url("c4.jpg");

        background-size: cover;
        font-family: 'ABeeZee';

    }
    .logo
{
  background-color: transparent;
}
#fa1{
	margin-top: 0.6%;
}

.fa:hover{
	cursor:pointer;
	background-color: rgb(181, 181, 255);
	border-radius:10px;
}

    </style>
</head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>
 <div class="container-fluid">
    <center>
      <a href="#"><img src="u2.jpg" class="img-circle" ></a>
      <i style="font-size:24px" class="fa" id="fa1">&#xf044;</i>
      <h3 style="color:black;" >${obj.name} <i style="font-size:24px" class="fa">&#xf044;</i> <h3>
      <h3 style="color:black;" >${obj.id}  <i style="font-size:24px" class="fa">&#xf044;</i> <h3>
      <h3 style="color:black;" >${obj.designation}  <i style="font-size:24px" class="fa">&#xf044;</i> <h3>
      <h3 style="color:black;" >${obj.department}  <i style="font-size:24px" class="fa">&#xf044;</i> <h3>
      <h3 style="color:black;" >${obj.qualifications}  <i style="font-size:24px" class="fa">&#xf044;</i> <h3>
      <h3 style="color:black;" >${obj.dob}  <i style="font-size:24px" class="fa">&#xf044;</i> <h3>
      <h3 style="color:black;" >${obj.doj}  <i style="font-size:24px" class="fa">&#xf044;</i> <h3>
      <h3 style="color:black;" >${obj.appraiser_name}  <i style="font-size:24px" class="fa">&#xf044;</i> <h3>
        </center>
    </div>
</body>
</html>