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

    <style>
		    body{
        			background-color:rgb(245, 245, 239);

    			}
        	.input-form{
            		text-align:center;
            		border-radius :3px;
            		color:black;
           		    margin-top:15%:
        		}
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

<div class="container-fluid" style="text-align :center;padding-top:10%;">
    <div class="input-form">
        <div class="heade">
       		 <h2>LOGIN</h2>
        </div>
        <form class="form-horizontal" action="loginsubmit" method="post">
            	<div class="form-group">
            	    <label class="control-label">Employee ID</label>
            	    <input type="text" name="id"/>
            	</div>
                <div class="form-group">
                    <label class="control-label">Password</label>
                    <input type="password" name="password"/>
                 </div>
                <input class="btn btn-primary" type="submit"/>
         </form>
    </div>


 </body>
</html>