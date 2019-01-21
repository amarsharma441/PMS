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
background-image: url("c4.jpg");
    background-size: cover;
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
.navbar-default{
  background-color: transparent;
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
.logo
{
  background-color: transparent;
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
     .input-form{
            text-align:center;
            border-radius :3px;
            color:black;
            padding: 7px;
        background-color:rgb(230, 230, 230);
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


<div class="container-fluid ">
  <div class="text-center " style="padding-bottom: 80px">
    <h1>Performance Managment System</h1>
  </div>


<c:if test ="${sessionScope.wdrm.isEmpty() == true}">
<div class="row pd">
  <div class="col-lg-4 col-md-4 col-sm-4 input-form" >
    <h2 class="text-center">SET WEIGHT</h2>


<form action="/setweight">
<div class="row pd">
  <div class="col-lg-6"><label class="label" for="branch">Academic weight</label>
  </div>
  <div class="col-lg-6">
    <input type="text" name="academics_weight" required><br>
  </div>
</div>
<div class="row pd">
  <div class="col-lg-6">
    <label class="label" for="branch">Administration weight</label>
  </div>
  <div class="col-lg-6">
    <input type="text" name="administration_weight" required><br>
  </div>
</div>
<div class="row pd">
  <div class="col-lg-6">
    <label class="label" for="branch">Research weight</label>
  </div>
  <div class="col-lg-6">
    <input type="text" name="research_weight" required><br>
  </div>
</div>



<input type="submit" class="btn btn-primary">
</form>
</div>
<div class="col-md-4 col-sm-4 col-lg-4 text-center" style="padding: 0px">
  <img src="weight_table1.jpg" width="435px" /><br>
</div>
</c:if>


<c:if test ="${sessionScope.wdrm.isEmpty() == false}">
<table>
   <h2> PMS : Weight Details </h2>
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



<div class="col-sm-4 col-md-4 col-lg-4 input-form">
<h2 class="pd">UPDATE</h2>

 <h4 class="pd">SELECT CRITERIA</h4>
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