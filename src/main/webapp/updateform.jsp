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
background-image: url("c4.jpg");
    background-size: cover;
        }
        .navbar-default{
  background-color: transparent;
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
.padding-bottom{
  padding-bottom: 50px;
}
.pd{
  padding-bottom: 10px;
}
.padding-left{
  padding-left: 30px;
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
    z-index: 1;
}
.card {
  padding: 10px;
}
.card-image{
  padding-bottom: 20px;
}


</style>

</head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
        <td><input type="number" name="ep_row${t.getRow_id()}" value="${fprm.get(t.getRow_id()-1).getExpected_points()}" min="0" max="${t.getMaximum_points()}" /></td>
        <td>0</td>
        <td><input type="text" name="comment_row${t.getRow_id()}"  value="${fprm.get(t.getRow_id()-1).getComment()}"/></td>

          <c:if test ="${fn:length(fprm.get(t.getRow_id()-1).getProof_filename()) == 0}">
            <td><input type="file" name="files" /></td>
          </c:if>
          <c:if test ="${fn:length(fprm.get(t.getRow_id()-1).getProof_filename()) > 0}">
            </form>
            <td style="display:inline">
            <form action="/download" method="post">
        <button class="btn btn-primary" name="filename" value="${fprm.get(t.getRow_id()-1).getProof_filename()}">${fprm.get(t.getRow_id()-1).getProof_filename()}</button>
        </form>
        <form action="/remove" method="post">
        <button class="btn btn-primary" name="filedetails" value="${fprm.get(t.getRow_id()-1).getProof_filename()},${fprm.get(t.getRow_id()-1).getYear_id()},${fprm.get(t.getRow_id()-1).getTable_id()},${fprm.get(t.getRow_id()-1).getRow_id()}">Remove</button>
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