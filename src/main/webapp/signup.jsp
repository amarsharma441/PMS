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
        .input-form{
            text-align:center;
            border-radius :3px;
            color:black;
            position:relative;

            margin: auto;
			min-width: 250px;
			width:550px ;
			  background-color:rgb(230, 230, 230);


        }
        .jumbotron{background-color:rgb(235, 235, 224);}
        .heade{
            margin-top:10%:
            color:black;
        }
        .logo{
            background-color:white;

        }
  		.col-sm-2{
  			text-align: center;
  		}
    </style>
</head>
<body>
<div class="logo">
    <img src="mulogo.png"/>
</div>
    <div class="jumbotron text-center">
        <h3>Performance Managment System</h3>
    </div>
<div class="container-fluid " style="text-align :center;">
<center>
	<h2 class="heade ">Sign Up</h2>
        <div class="input-form" >
        <br/>
        <form class="form-horizontal" action="signupsubmit" method="post">
            	<div class="form-group form-group-lg">
            	    <label class="control-label col-sm-4">Employee ID:</label>
            	    <div class="col-sm-8"><input type="text" name="id" maxlength="8" size="30" /></div>
            	</div>
            	<div class="form-group ">
            	    <label class="control-label col-sm-4">Name:</label>
            	    <div class="col-sm-8"><input type="text" name="name" size="30" /></div>
            	</div>
            	<div class="form-group ">
            	    <label class="control-label col-sm-4">Designation:</label>
            	    <div class="col-sm-8"><input type="text" name="designation" size="30" /></div>
            	</div>
            	<div class="form-group ">
            	    <label class="control-label col-sm-4">Department:</label>
            	    <div class="col-sm-8"><input type="text" name="department" size="30"  /></div>
            	</div>
            	<div class="form-group ">
            	    <label class="control-label col-sm-4">Date of Joining:</label>
            	    <div class="col-sm-8"><input type="date" name="doj" size="30"/></div>
            	</div>
            	<div class="form-group ">
            	    <label class="control-label col-sm-4">Appraiser Name:</label>
            	    <div class="col-sm-8"><input type="text" name="appraiser_name"size="30" /></div>
            	</div>
            	<div class="form-group ">
            	    <label class="control-label col-sm-4">Password:</label>
            	    <div class="col-sm-8"><input type="password" name="password" size="30" /></div>
            	</div>
                <div class="form-group ">
                    <label class="control-label col-sm-4">Confirm Password : </label>
                    <div class="col-sm-8"><input type="password" name="conpassword" size="30"/></div>
                 </div>

                <input class="btn btn-primary" type="submit"/>

         </form>
         <br/>
         </div>
         	<br>
    </div>
</center>
</div>


 </body>
</html>