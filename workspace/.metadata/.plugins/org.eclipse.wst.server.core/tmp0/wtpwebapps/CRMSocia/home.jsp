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
		<link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="./css/alerts/alertify.core.css">
		<link rel="stylesheet" type="text/css" href="./css/alerts/alertify.default.css">
		<link rel="stylesheet" type="text/css" href="./css/alerts/alertify.bootstrap.css">
		<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
		<link href='/CRMSocia/css/calendar/fullcalendar.css' rel='stylesheet' />
		<link href='/CRMSocia/css/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
		<link rel="stylesheet" href="/CRMSocia/css/bootstrap-datetimepicker.css">
		<link rel="stylesheet" href="css/prism.css">
		<link rel="stylesheet" href="css/chosen.css">
		<link rel="stylesheet" type="text/css" media="screen" href="./css/ui/jquery-ui.min.css">
	</head>
	<body>
		<c:choose>
			<c:when test="${sessionScope.sessionLogin == null}">
				<c:redirect url="index.jsp"/>	
			</c:when>
		</c:choose>
		
		<c:choose>
			<c:when test="${sessionScope.sessionLogin.type == '2'}">
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
				        <!-- li onClick="loadMenu('callLog', this);"><a href="#">INDICADORES</a></li -->
				        <li onClick="loadMenu('indicators', this);"><a href="#">INDICADORES</a></li>
				        <li><a href="ControllerLogin?cerrarSesion=T"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>� CERRAR SESI�N</a></li>
				      </ul>
				    </div><!-- /.navbar-collapse -->
				  </div><!-- /.container-fluid -->
				</nav>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${sessionScope.sessionLogin.type == '1'}">
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
						        <li onClick="loadMenu('diagnosis', this);"><a href="#">DIAGN�STICO</a></li>
						        <li><a href="#">??</a></li>
						        <li><a href="#">??</a></li>
						        <li><a href="#">INDICADORES</a></li>
		        				<li><a href="ControllerLogin?cerrarSesion=T"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>� CERRAR SESI�N</a></li>
						      </ul>
						    </div><!-- /.navbar-collapse -->
						  </div><!-- /.container-fluid -->
						</nav>
					</c:when>
					<c:otherwise>
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
						        <li onClick="loadMenu('diagnosis', this);"><a href="#">COTIZACIONES</a></li>
						        <li><a href="#">CALENDARIO</a></li>
						        <li><a href="#">PERFIL DEL CLIENTE</a></li>
						        <li><a href="#">INDICADORES</a></li>
		        				<li><a href="ControllerLogin?cerrarSesion=T"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>� CERRAR SESI�N</a></li>
						      </ul>
						    </div><!-- /.navbar-collapse -->
						  </div><!-- /.container-fluid -->
						</nav>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		
		<div class="contenido" >
			<div id="pageHeader"></div>
			<div  id="pageContent" class="welcome">
		    	<h3 style="color:#ff0026;">Bienvenida <c:out value="${sessionScope.sessionLogin.firstName}" ></c:out> <c:out value="${sessionScope.sessionLogin.lastName}" ></c:out></h3>
		    	<br/> 
		    	<h2>Creemos en el trabajo bien realizado, el nuestro habla por s� mismo.</h2>
		    	<br/>
				<c:choose>
					<c:when test="${sessionScope.sessionLogin.type == '2'}">
		    			<p>Si lo deseas, puedes abrir dos paneles a la vez.</p>
		    		</c:when>
		    	</c:choose>
		    </div>
		</div>
		<script src="js/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/ui/jquery-ui.min.js"></script>
    
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/menu.js"></script>
		<script type="text/javascript" src="js/alerts/alertify.js"></script>
		<script src='/CRMSocia/js/calendar/moment.min.js'></script>
		<script src='/CRMSocia/js/calendar/fullcalendar.js'></script>
		<script src='/CRMSocia/js/calendar/lang/es.js'></script>
		<script type="text/javascript" src="/CRMSocia/js/bootstrap-datetimepicker.js"></script>
		<script type="text/javascript" src="/CRMSocia/js/bootstrap-datetimepicker.es.js"></script>
		<script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script src="js/prism.js" type="text/javascript" charset="utf-8"></script>

		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
	</body>
</html>