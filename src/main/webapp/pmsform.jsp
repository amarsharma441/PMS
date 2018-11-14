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
</style>
   
</head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Permformance Managment System</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="\dashboard">Home</a></li>

        <li><a href="#">Settings </a></li>
        <li><a href="/logout">Logout</a></li>
      </ul>

    </div>
  </div>
</nav>


<div style="background:darkgery; display:inline-block; width:80%;">

<h3>UPDATE   |  VIEW  |  DOWNLOAD</h3>
</div>


<div>
<h1>SET WEIGHT</h1>
    
<form action="/setweight">
<img src="weight_table.jpg"/><br>
<label class="label" for="branch">academic_weight</label>
<input type="text" name="academics_weight" required><br>
<label class="label" for="branch">research_weight</label>
<input type="text" name="research_weight" required><br>
<label class="label" for="branch">administration_weight</label>
<input type="text" name="administration_weight" required><br>
<input type="submit">
</form>
</div>

<div>
<h1>UPDATE</h1>

 <h3>SELECT CRITERIA</h3>    
<form action="/selectcriteria">
 <select name="tablename">
    <option value="Academics and Academic Administration">Academics and Academic Administration</option>
    <option value="Research and Consultancy">Research and Consultancy</option>
    <option value="Administration">Administration</option>
  </select>
  <br><br>
  <input type="submit">
</form>
</div>

</body>

</html>