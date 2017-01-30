<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <link rel="stylesheet" href="css/prism.css">
	<link rel="stylesheet" href="css/chosen.css">
	<link rel="stylesheet" href="css/address.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="/CRMSocia/css/bootstrap-datetimepicker.css">
	
	<script src="js/chosen.jquery.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="/CRMSocia/js/script.js"></script>
	
	<script type="text/javascript" src="/CRMSocia/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="/CRMSocia/js/bootstrap-datetimepicker.es.js"></script>
	<script type="text/javascript" src="/CRMSocia/js/diagnosis/diagnosis.js"></script>
	    
    
    
	<ol class="breadcrumb">
      <li><a href="#">Inicio</a></li>
      <li><a href="#">Cotizaciones</a></li>
      <li class="active">Formato de Diagnóstico</li>
    </ol>
    
    <div class="titulo"><h3>Formato de Diagnóstico Cliente Corporativo</h3></div>
    <div align="center"><h4>DESARROLLO DE LINEAS DE NEGOCIO</h4></div>
    <br />
    <div class="row top">
    	<div class="col-sm-6 col-md-6" style="text-align:center">
			<div class="form-group">
		 		<label class="col-sm-12 col-md-6" style="text-align:right">Prospecto: </label>
		    	<div id="selectProspD" style="padding: 6px 12px; text-align:left"></div>
		    	<small id="companyNameHelp" class="form-text text-muted" style="padding: 6px 12px;">Por favor, selecciona la razón social que necesites.</small>
		  	</div>
		</div>
		<div class="col-sm-6 col-md-6" style="text-align:center">
			<div class="form-group">
		 		<label class="col-sm-12 col-md-6" style="text-align:right">Cliente: </label>
		    	<div id="selectClientD" style="padding: 6px 12px; text-align:left""></div>
		    	<small id="companyNameHelp" class="form-text text-muted" style="padding: 6px 12px;">Por favor, selecciona la razón social que necesites.</small>
		  	</div>
		</div>
	</div>
	<div id="response"></div>
        