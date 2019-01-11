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

        font-family: 'ABeeZee';
		background-color:rgb(235, 235, 224);
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
     .label{
     	color:black;
     	margin-right: 5px;
     	font-size: 14px;
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


<div class="container-fluid ">
	<div class="text-center ">
		<h1>Performance Managment System</h1>
	</div>
	<div class="text-center" style="margin-top: 70px;margin-bottom: 60px;">
		<h3> <a href="#">UPDATE</a> | <a href="#">VIEW</a> | <a href="#">DOWNLOAD</a> </h3>
	</div>

<c:if test ="${sessionScope.wdrm.isEmpty() == true}">
<div class="row">
	<div class="col-lg-3 col-md-3 col-sm-3">
		<h3 class="text-center">SET WEIGHT</h3>
		

<form action="/setweight">
<div class="row">
	<div class="col-lg-6">
		<label class="label" for="branch">Academic weight</label>
	</div>
	<div class="col-lg-6">
		<input type="text" name="academics_weight" required><br>
	</div>
</div>
<div class="row">
	<div class="col-lg-6">
		<label class="label" for="branch">Administration weight</label>
	</div>
	<div class="col-lg-6">
		<input type="text" name="administration_weight" required><br>
	</div>
</div>
<div class="row">
	<div class="col-lg-6">
		<label class="label" for="branch">Research weight</label>
	</div>
	<div class="col-lg-6">
		<input type="text" name="research_weight" required><br>
	</div>
</div>



<input type="submit" class="btn btn">
</form>
</div>
<div class="col-md-6 col-sm-6 col-lg-6 text-center">
	<img src="weight_table1.jpg"/><br>
</div>
</c:if>

<c:if test ="${sessionScope.wdrm.isEmpty() == false}">
<table>
   <tr>
      <th>Academics Weight</th>
      <th>Research Weight</th>
      <th>Administration Weight</th>
     </tr>

  <c:forEach items="${sessionScope.wdrm}" var="w">
      <tr>
        <td>${w.getAcademics_weight()}</td>
        <td>${w.getResearch_weight()}</td>
        <td>${w.getAdministration_weight()}</td>
     </tr>
  </c:forEach>
  </table>
<br><br>
</c:if>


<div class="col-sm-3 col-md-3 col-lg-3">
<h1>UPDATE</h1>

 <h3>SELECT CRITERIA</h3>
<form action="/selectcriteria">
 <select name="tablename">
    <option value="Academics and Academic Administration">Academics and Academic Administration</option>
    <option value="Research and Consultancy">Research and Consultancy</option>
    <option value="Administration">Administration</option>
  </select>
  <br><br>
  <input type="submit" class="btn btn-primary">
</form>
</div>
</div>

</body>

</html>