<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CRM-Socia</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
</head>
<body>
	<c:choose>
	<c:when test="${sessionScope.sessionLogin == null}">
		<c:redirect url="index.jsp"/>	
	</c:when>
</c:choose>
	<div id="wrapper">
		<div id="sidebar-wrapper">
            <nav id="spy">
                <ul class="sidebar-nav nav">
                    <li class="sidebar-brand">
                        <a href="#home"><span class="fa fa-home solo">Home</span></a>
                    </li>
                    <li>
                        <a href="#anch1" data-scroll onClick="loadMenu('call');">
                            <span class="fa fa-anchor solo">Llamadas</span>
                        </a>
                    </li>
                    <li>
                        <a href="#anch2" data-scroll>
                            <span class="fa fa-anchor solo">Citas</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="#anch3" data-scroll  onClick="loadMenu('quotation');">
                            <span class="fa fa-anchor solo">Cotizaciones</span>
                        </a>
                    </li>
                    <li>
                        <a href="#anch3" data-scroll  onClick="loadMenu('calendar');">
                            <span class="fa fa-anchor solo">Calendario</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div id="page-content-wrapper">
			<div class="content-header">
				<nav class="navbar navbar-default">
					<div class="container">
						<div class="navbar-header">
          					<a class="navbar-brand" href="#">
          					<img src="images/icono.png" width="46" height="49" alt=""/> </a>
          					<span class="navbar-text logo">GRUPO SOCIA CRM</span>
          					<span class="navbar-text derecha">
          						IT Solutions 
          						&nbsp;&nbsp; 
          						<a href="ControllerLogin?cerrarSesion=T"><span id="salir">Salir</span></a>
          					</span>
        				</div>
  					</div>
				</nav>
            </div>
            <div class="page-content inset" data-spy="scroll" data-target="#spy" id="pageContent">
            	Bienvenido <c:out value="${sessionLogin.user}"></c:out>
            </div>
        </div>
	</div>
	
	
	<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/menu.js"></script>
</body>
</html>