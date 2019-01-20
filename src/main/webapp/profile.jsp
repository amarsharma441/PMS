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
 @-webkit-keyframes open{
      from{left:-500px;}
      to{left:0px;}
     }
     @keyframes open{
      from{left:-500px;}
      to{left:0px;}
     }
     .open-dialog{
      animation-name: open;
      animation-duration: 1s;
      animation-fill-mode: forwards;
      -webkit-animation-name:open;
      -webkit-animation-duration: 1s;
      -webkit-animation-fill-mode: forwards;
     }
     .close-dialog{
      animation-name: close;
      animation-duration: 1s;
      animation-fill-mode: forwards;
      -webkit-animation-name:close;
      -webkit-animation-duration: 1s;
      -webkit-animation-fill-mode: forwards;

     }
      @-webkit-keyframes close{
      from{left:0px;}
      to{left:-500px;}
     }
     @keyframes close{
      from{left:0px;}
      to{left:-500px;}
     }

.navbar-default{
  background-color: transparent;
}


.a{
    width:250px;
    position: absolute;
    top: 0px;
    left:0px;
    height: 100%;
    background-image: url("c4.jpg");
    background-size: cover;
    display: none;
}
.card {
  padding: 10px;
}
.card-image{
  padding-bottom: 20px;
}
.padding-bottom{
  padding-bottom: 20px;
}
.logo
{
  background-color: transparent;
}


    </style>
</head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>
<nav class="navbar-default ">
  <div class="container-fluid">
    <ul class=" nav navbar-header " style="font-size:30px;">
      <li>
      <button onclick=opendialog() style="background-color: transparent;border:none;font-size:40px;"><span class="glyphicon glyphicon-align-left"></span></button>
      </li>
    </ul>
    <ul class="nav navbar-right">
        <li><img src="mulogo.png" class="logo"></li>
    </ul>
  </div>
</nav>

<div class="card a" id="dailog">
  <div class="text-right padding-bottom">
    <button onclick=closedialog() style="background-color: transparent;border:none;font-size:20px;"><span class="glyphicon glyphicon-remove"></span></button>
  </div>
  <div class="card-image">
    <img src="u2.jpg" class="img-circle" >
  </div>
  <div class="card-title text-center padding-bottom">
    <h3>${obj.name}</h3>
  </div>
  <div class="card-space ">
    <ul style="list-style-type: none;font-size:20px;padding-left: 4%;">
      <li class="padding-bottom text-center"><a href="/profile">Profile</a></li>
      <li class="padding-bottom text-center "><a href="/logout">Logout</a></li>
    </ul>



  </div>
</div>


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

<script type="text/javascript">

  function opendialog()
  {
    var ele=document.getElementById("dailog");
    ele.classList.add("open-dialog");
    ele.classList.remove("close-dialog");
    ele.style.cssText='display:block';
  }
  function closedialog()
  {
    var ele=document.getElementById("dailog");
    ele.classList.add("close-dialog");
    ele.classList.remove("open-dialog");
  }
</script>
</html>