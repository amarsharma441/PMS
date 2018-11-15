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
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}


body{
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
     .finalb{
      align-self: center;
      margin-left: 44%;
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
        <a href="#"><span class="glyphicon glyphicon-log-in a"></span> Signout </a>
      </li>
    </ul>
</div>
</nav>
<div class="container-fluid">
<div class="text-center">
  <h3>Performance Managment System</h3>
</div>
<div class="conatiner">
  <c:if test ="${sessionScope.trm != null}">

  <form action="/updatepoints">

  <table id="customers">
   <tr>
      <th>S.No.</th>
      <th>Parameters</th>
      <th>Maximum Points</th>
      <th>Expected Points</th>
      <th>Points Earned</th>
      <th>Comment</th>
      <th>Proof</th>
     </tr>

  <c:forEach items="${trm}" var="t">
      <tr>
        <td>${t.getRow_id()}</td>
        <td>${t.getParameter()}</td>
        <td>${t.getMaximum_points()}</td>
        <td><input type="text" name="ep_row${t.getRow_id()}"/></td>
        <td>0</td>
        <td><input type="text" name="comment_row${t.getRow_id()}"/></td>
        <td><input type="file" name="file_row${t.getRow_id()}" /></td>
     </tr>
  </c:forEach>

  </table>
  <br><br>
  <input type="submit" class="btn btn-lg btn-primary finalb" value="UPDATE">
  </form>
  </c:if>
</div>
</div>
</body>

</html>