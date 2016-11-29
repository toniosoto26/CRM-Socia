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
<script type="text/javascript" src="/CRMSocia/js/bootstrap-datetimepicker.fr.js"></script>
<script type="text/javascript" src="/CRMSocia/js/appointments/appointment.js"></script>

<ol class="breadcrumb">
  <li><a href="#">Inicio</a></li>
  <li class="active">Citas</li>
</ol>
<div class="titulo"><h3>Formato de generación de citas</h3></div>

	<div class="row top">
    	<div class="col-sm-8 col-md-8">
			<div class="form-group">
		 		<label class="col-sm-12 col-md-6">Razón social</label>
		    	<div id="selectClient" style="padding: 6px 12px;"></div>
		    	<small id="companyNameHelp" class="form-text text-muted" style="padding: 6px 12px;">Por favor, selecciona la razón social que necesites.</small>
		  	</div>
		</div>
	</div>
	


<label for="selectCompanyAddress" class="col-sm-12 col-md-6">Seleccione fecha y hora: </label>
<div class="card12222">
	<div class="col-md-12">
	  	<div class="form-group row">
	  		<div class="col-md-6">
			<div class="form-group">
				<label for="dtp_input2" class="col-md-2 control-label">Fecha: </label>
			    <div class="input-group date form_date col-md-5" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
			    	<input required class="form-control" size="16" type="text" value="" readonly>
			        <span  class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			    </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
			</div>
			</div>
			<div class="col-md-6">
			<div class="form-group">
				<label for="dtp_input3" class="col-md-2 control-label">Hora: </label>
				<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
					<input required class="form-control" size="16" type="text" value="" readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
				</div>
				<input type="hidden" id="dtp_input3" value="" /><br/>
		    </div>
		    </div>
		  </div>
	</div>
</div>


	<div id="result">
		<div class="row">
			<div class="col-sm-12 col-md-6">
	  			<div class="form-group">
			    	<label class="col-sm-3 col-md-6">Contacto:</label>
				    <input type="text" class="form-control" id="contactApo" name="contactApo" placeholder="contacto">
				</div>
	  		</div>
		</div>
	
		<div class="row">
	    	<div class="col-sm-6 col-md-6">
		  		<div class="form-group">
				    <label class="col-sm-6 col-md-6">Telefono:</label>
					<input required type="text" class="form-control" id="phoneContact" name="phoneContact" placeholder="telefono" >
				</div>
		  	</div>
	  	</div>
	  	<div class="row">
	    	<div class="col-sm-6 col-md-6">
		  		<div class="form-group">
				    <label class="col-sm-6 col-md-6">Email:</label>
					<input required type="text" class="form-control" id="emailContact" name="emailContact" placeholder="email" >
				</div>
		  	</div>
	  	</div>
  	</div>
  	<div class="row top">
    	<div class="col-sm-8 col-md-8">
			<div class="form-group">
		 		<label class="col-sm-12 col-md-6">BDM:</label>
		    	<div id="selectClient" style="padding: 6px 12px;"></div>
		    	<div id="selectBDM" style="padding: 6px 12px;"></div>
		  	</div>
		</div>
	</div>
	

 <div class="text-left"  style="padding: 6px 12px;">
	  <button type="button" class="btn btn-primary" onclick="saveInfo();">Agendar</button>
	  <button type="button" id="modified" class="btn btn-primary" onclick="SaveModifiedInformation();">Guardar cambios</button>
 </div>