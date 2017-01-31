<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	<script type="text/javascript" src="/CRMSocia/js/script.js"></script>
	<script type="text/javascript" src="/CRMSocia/js/diagnosis/diagnosis.js"></script>
	   
	<ol class="breadcrumb">
      <li><a href="#">Inicio</a></li>
      <li><a href="#">Cotizaciones</a></li>
      <li class="active">Formato de Diagnóstico</li>
    </ol>
    
    <div class="titulo"><h3>Formato de Diagnóstico Cliente Corporativo</h3></div>
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
		    	<div id="selectClientD" style="padding: 6px 12px; text-align:left"></div>
		    	<small id="companyNameHelp" class="form-text text-muted" style="padding: 6px 12px;">Por favor, selecciona la razón social que necesites.</small>
		  	</div>
		</div>
	</div>
	<div id="response"></div>
        