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
	
	<link rel="stylesheet" href="css/adminlte.min.css">
	<link rel="stylesheet" type="text/css" href="./css/bootstrap_new.css">

		<link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="./css/alerts/alertify.core.css">
		<link rel="stylesheet" type="text/css" href="./css/alerts/alertify.default.css">
		<link rel="stylesheet" type="text/css" href="./css/alerts/alertify.bootstrap.css">
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
		<div class="gradient"></div>
		<div id="experience">
			<canvas id="lines" width="1366" height="500" style="display: block;position: absolute;z-index: 2;"></canvas>
		</div>
	<div class="login">
    	<form class="ingresar" style="position: relative;z-index: 3;">
			<div class="form-group text-center">
				<input type="text" class="form-control" id="user" name="user"  placeholder="Usuario">
			</div>
			<div class="form-group text-center">
				<input type="password" class="form-control" id="passwd" name="passwd" placeholder="Contraseña">
			</div>
			<div class="text-center">
				<button type="button" id="btnLogin" name="btnLogin" class="btn btn-primary" onclick="validar();">INGRESAR</button>
			</div>
		</form>
	</div>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/script.js"></script>
	<script src="js/login/d3.v3.min.js"></script>
	<script src="js/login/trianglify.min.js"></script>
	<script src="js/login/functions.min.js"></script>
	<script type="text/javascript" src="js/validator/validator.js"></script>
	<script type="text/javascript" src="js/alerts/alertify.js"></script>
</body>
</html>