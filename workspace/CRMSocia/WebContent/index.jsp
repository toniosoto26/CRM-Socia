<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>CRM-Socia</title>
	<script src="js/jquery.min.js"></script>
	<script src="js/script.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
</head>
<body>
	<nav class="navbar navbar-default">
	  <div class="container">
	        <div class="navbar-header">
	          <a class="navbar-brand" href="#">
	          <img src="images/icono.png" width="46" height="49" alt=""/> </a>
	          <span class="navbar-text logo">GRUPO SOCIA CRM</span>
	          <span class="navbar-text derecha">IT Solutions</span>
	        </div>
	  </div>
	</nav>
	<div class="login">
		<form>
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