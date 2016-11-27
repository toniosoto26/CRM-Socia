<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<link rel="stylesheet" href="/CRMSocia/css/prism.css">
<link rel="stylesheet" href="/CRMSocia/css/chosen.css">
<link rel="stylesheet" href="/CRMSocia/css/address.css">
<link rel="stylesheet" href="/CRMSocia/css/bootstrap-datetimepicker.css">

<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="/CRMSocia/js/script.js"></script>

<script type="text/javascript" src="/CRMSocia/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/CRMSocia/js/bootstrap-datetimepicker.fr.js"></script>
<script type="text/javascript" src="/CRMSocia/js/appointments/appointment.js"></script>

<ol class="breadcrumb">
  <li><a href="#">Inicio</a></li>
  <li class="active">Citas</li>
</ol>
<div class="titulo"><h3>Formato de generación de citas</h3></div>

<div class="form-group">
   <label for="inputCompanyName">Razón social:</label>
   <div id="selectClient"></div>
   <small id="companyNameHelp" class="form-text text-muted">Por favor, selecciona la razón social que necesites.</small>
</div>

<label for="selectCompanyAddress" >Seleccione fecha y hora: </label>
<div class="card12222">
	<div class="col-md-12">
	  	<div class="form-group row">
	  		<div class="col-md-6">
			<div class="form-group">
				<label for="dtp_input2" class="col-md-2 control-label">Fecha: </label>
			    <div class="input-group date form_date col-md-5" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
			    	<input class="form-control" size="16" type="text" value="" readonly>
			        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			    </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
			</div>
			</div>
			<div class="col-md-6">
			<div class="form-group">
				<label for="dtp_input3" class="col-md-2 control-label">Hora: </label>
				<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
					<input class="form-control" size="16" type="text" value="" readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
				</div>
				<input type="hidden" id="dtp_input3" value="" /><br/>
		    </div>
		    </div>
		  </div>
	</div>
</div>

<div class="card">
	<div id="result">
		<div class="col-md-12">
		  	<div class="form-group row">
		  		<div class="col-md-6">
				    <label for="inputCompanyEmail">Contacto:</label>
				    <input type="text" class="form-control" id="companyEmail" name="companyEmail" placeholder="contacto">
				</div>	  	
			</div>
		</div>
		<div class="col-md-12">
		  	<div class="form-group row">
		  		<div class="col-md-6">
				    <label for="inputCompanyEmail">Telefono:</label>
				    <input type="text" class="form-control" id="companyEmail" name="companyEmail" placeholder="telefono">
				</div>	  	
			</div>
		</div>
		<div class="col-md-12">
		  	<div class="form-group row">
		  		<div class="col-md-6">
				    <label for="inputCompanyEmail">Email:</label>
				    <input type="text" class="form-control" id="companyEmail" name="companyEmail" placeholder="email">
				</div>	  	
			</div>
		</div>
	</div>
	<div class="col-md-12">
	  	<div class="form-group row">
	  		<div class="col-md-6">
			    <div class="form-group">
	   <label for="inputCompanyName">BDM: </label>
	   <div id="selectBDM"></div>
	</div>
			</div>	  	
		</div>
	</div>
	
</div>

 <div class="text-left">
	  <button type="button" class="btn btn-primary" onclick="saveInfo();">Agendar</button>
 </div>