<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Grupo Socia CRM</title>
	<!-- Bootstrap -->
	<script src="js/jquery.min.js"></script>
	<script src="js/script.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/bootstrap_new.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-default">
	  <div class="container">
	        <div class="navbar-header">
	          <a class="navbar-brand" href="#">
	          <img src="images/grupo-socia.png" width="200" height="33" alt=""/></a>
	        </div>
	  </div>
	</nav>
	<div class="login">
    	<form class="ingresar" method="post">
			<div class="form-group">
				<input type="text" class="form-control" id="user" name="user"  placeholder="Usuario">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="passwd" name="passwd" placeholder="Contraseña">
			</div>
			<div class="text-center">
				<button type="button" id="btnLogin" name="btnLogin" class="btn btn-primary" onclick="validar();">INGRESAR</button>
			</div>
		</form>
	</div>
	
</body>
</html>