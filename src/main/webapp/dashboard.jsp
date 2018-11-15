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
    <style>
    body{
        background-color:rgb(235, 235, 224);
        font-family: 'ABeeZee';

    }
     .welcome_mes{
      color:black;
      margin: 5px;

     }
     .block{
      width: auto;
      cursor: pointer;
      padding: 30px;
      text-align: center;

     }
     .block-sm{
      width: auto;
      cursor: pointer;
      padding-top: 30px;
      text-align: center;
     }
     .block1 ,.final{
      display: none;
     }
     .bloackdis{
      display: block;
     }
     .btn{
      margin-top: 50px;
     }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
<div class="container-fluid">
<div class="navbar-header" >
  <span class="glyphicon glyphicon-tasks btn-lg"></span>
</div>

  <ul class="nav navbar-nav navbar-right">
      <li>
        <a href="/logout"><span class="glyphicon glyphicon-log-in a"></span> Signout </a>
      </li>
    </ul>
</div>
</nav>
<div class="container-fluid">
  <div class="welcome_mes text-center">
    <h2>Welcome ${obj.name} to PMS</h2>
  </div>


  <center>
<button class="btn btn-primary btn-lg" onclick="window.location.href='\pmsform'">Procced to Portal</button>

</center>

 </div>

</body>
</html>