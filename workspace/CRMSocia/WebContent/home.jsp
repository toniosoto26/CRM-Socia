<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Grupo Socia CRM</title>
		<link rel="stylesheet" type="text/css" href="./css/bootstrap_new.css">
		<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	</head>
	<body>
		<c:choose>
			<c:when test="${sessionScope.sessionLogin == null}">
				<c:redirect url="index.jsp"/>	
			</c:when>
		</c:choose>
		
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#">
		          <img src="images/grupo-socia.png" width="200" height="33" alt=""/></a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav navbar-right">
		        <li onClick="loadMenu('call', this);"><a href="#">LLAMADAS</a></li>
		        <li onClick="loadMenu('appointment', this);"><a href="#">CITAS</a></li>
		        <li onClick="loadMenu('quotation', this);"><a href="#">COTIZACIONES</a></li>
		        <li onClick="loadMenu('calendar', this);"><a href="#">CALENDARIO</a></li>
		        <li><a href="#">INDICADORES</a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		
		<!-- div id="page-content-wrapper">
			<span class="navbar-text derecha">
				IT Solutions 
				&nbsp;&nbsp; 
				<a href="ControllerLogin?cerrarSesion=T"><span id="salir">Salir</span></a>
			</span>
		</div-->
		<div class="contenido"  id="pageContent">
		    <div class="titulo"><h3>Bienvenido <c:out value="${sessionScope.sessionLogin.firstName}" ></c:out> <c:out value="${sessionScope.sessionLogin.lastName}" ></c:out></h3></div>
		    
		</div>	
		
		
		<script src="js/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/menu.js"></script>
	</body>
</html>