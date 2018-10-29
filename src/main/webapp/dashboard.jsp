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
        <li class="active"><a href="#">Home</a></li>

        <li><a href="#">Settings </a></li>
        <li><a href="#">Logout</a></li>
      </ul>

    </div>
  </div>
</nav>
<div class="container-fluid">
	<div class="welcome_mes text-center">
		<h2>Welcome ${obj.name} to PMS</h2>
	</div>
	<h3 class="text-center">Choose one of the Performance Criteria</h3>
	<div class="main">

		<div class="col-lg-3 col-sm-3 col-md-3">
			<div class="block" onclick="myfunction()">
				<h3>Departmental Activites</h3>
			</div>
			<div class="block">
				<h3>Academic Activites</h3>
			</div>
			<div class="block">
				<h3>Research / Consultancy</h3>
			</div>
			<div class="block">
				<h3>University Service</h3>
			</div>
		</div>
		<div class="col-md-4 col-sm-4 col-lg-4">
			<div class="block1" id="id1">
				<div class="block-sm" onclick="third()">
					<h4>Headship of Department</h4>
				</div>
				<div class="block-sm" onclick="third()">
					<h4>Improvements in Lab</h4>
				</div>
				<div class="block-sm" onclick="third()">
					<h4>Developments in Teaching/Research</h4>
				</div>
				<div class="block-sm" onclick="third()">
					<h4>Contribution in Administrative Activites</h4>
				</div>
			</div>
		</div>
		<div class="col-sm-5 col-lg-5 col-md-5">
			<center>
				<div class="final" id="third">
					<div class="form-group">
 					 		<label for="comment">Comment:</label>
  							<textarea class="form-control" rows="5" id="comment"></textarea>
					</div>
					<button class="btn btn-primary">Submit</button>
				</div>
			</center>
		</div>
	</div>


</div>
 </body>
 <script type="text/javascript">
 	function myfunction()
 	{

 		document.getElementById('id1').setAttribute("class", "bloackdis");
 	}
 	function third()
 	{

 		document.getElementById('third').setAttribute("class", "bloackdis");
 	}
 </script>
</html>