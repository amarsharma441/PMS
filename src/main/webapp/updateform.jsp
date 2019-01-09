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
     .finalb{
      align-self: center;
      margin-left: 44%;
     }
     
     .btn {
    background-color: DodgerBlue;
    border: none;
    color: white;
    padding: 7px 18px;
    cursor: pointer;
    font-size: 12px;
}

/* Darker background on mouse-over */
.btn:hover {
    background-color: RoyalBlue;
}
</style>

</head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
<div class="text-center">
  <h3>Performance Managment System</h3>
</div>
<div class="conatiner">
  <c:if test ="${sessionScope.trm != null}">
	
  <form action="/updatepoints" method="post" enctype="multipart/form-data">
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
        <td><input type="text" name="ep_row${t.getRow_id()}" value="${fprm.get(t.getRow_id()-1).getExpected_points()}"/></td>
        <td>0</td>
        <td><input type="text" name="comment_row${t.getRow_id()}"  value="${fprm.get(t.getRow_id()-1).getComment()}"/></td>
        
        	<c:if test ="${fn:length(fprm.get(t.getRow_id()-1).getProof_filename()) == 0}">
        		<td><input type="file" name="files" /></td>
        	</c:if>
        	<c:if test ="${fn:length(fprm.get(t.getRow_id()-1).getProof_filename()) > 0}">
        		<td>
        		<form action="/download" method="post">
				<button class="btn" name="filename" type="submit" value="${fprm.get(t.getRow_id()-1).getProof_filename()}">${fprm.get(t.getRow_id()-1).getProof_filename()}</button>
			<!--	</form>  -->
			<!--	<form action="/removefile" method="get">  -->
			<!--	<button class="btn">Remove</button>   -->
				</form>
        		</td>
       		</c:if>
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