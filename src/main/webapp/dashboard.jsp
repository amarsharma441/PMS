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
     
@import "compass/css3";

.flex-container {
  padding: 0;
  margin: 0;
  list-style: none;
  
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  
  -webkit-flex-flow: row wrap;
  justify-content: space-around;
  
}

.flex-item {
  background: darkgrey;
  padding: 5px;
  width: 250px;
  height: 200px;
  margin-top: 20px;
  
  line-height: 200px;
  color: black;
  font-weight: bold;
  font-size: 1.5em;
  text-align: center;
  border-radius: 15px;
}
    </style>
</head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <h2>Welcome ${obj.name}</h2>
  </div>


  <center>
<ul class="flex-container">
<c:forEach begin="1" end="${sessionScope.years}" var="y">
  <a href="/pmsform?year_id=${y}"><li class="flex-item">PMS ${2017+y}-${18+y}</li></a>
 </c:forEach>
 <a href="/pmsform?year_id=${sessionScope.years + 1}"><li class="flex-item">+</li></a>
</ul>
</center>

 </div>

</body>
</html>