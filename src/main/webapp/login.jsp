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

    }
        .input-form{
            text-align:center;
            border-radius :3px;
            color:black;
            position:relative;
            padding:10px;
            margin: auto;
			min-width: 250px;
			width:400px;
			  background-color:rgb(230, 230, 230);


        }
        .jumbotron{background-color:white;}
        .heade{
            margin-top:10%:
            color:black;
        }
        .logo{
            background-color:white;

      }
    </style>

</head>
<body>
<div class="logo">
    <img src="mulogo.png"/>
</div>
    <div class="jumbotron text-center">
        <h2>Performance Managment System</h2>
    </div>
<div class="container-fluid " style="text-align :center;">
<center>
        <div class="input-form" >

        <h2 class="heade ">LOGIN</h2>


        <form class="form-horizontal" action="login-dashboard" method="post">
            	<div class="form-group ">
            		<div class="row">
            			<div class="col-lg-6 col-md-6">
            				<label class="control-label">Employee ID:</label>
            			</div>
						<div class="col-lg-6 col-md-6">
							<input type="text" name="id" maxlength="8" />
						</div>
					</div>
            	</div>
                <div class="form-group ">
                    <div class="row">
            			<div class="col-lg-6 col-md-6">
            				<label class="control-label">Password : </label>
            			</div>
						<div class="col-lg-6 col-md-6">
							<input type="password" name="password"/>
						</div>
					</div>
				</div>
                <input class="btn btn-primary" type="submit"/>
         </form>
         </div>

    </div>
</center>
</div>


 </body>
</html>