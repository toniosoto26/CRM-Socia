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
<script type="text/javascript" src="/CRMSocia/js/appointments/appointment.js"></script>


<div class="row">
	<div id="primaryPanel" class="col-sm-12 col-md-12">
	<div class="titulo"><h3>Formato de generación de citas</h3></div>
	<form id="addAppointment" onSubmit="return saveInfo();" data-toggle="validator" role="form">
	<div class="row top">
    	<div class="col-sm-8 col-md-8">
			<div class="form-group">
		 		<label class="col-sm-12 col-md-6">Razón social</label>
		    	<div id="selectClient" style="padding: 6px 12px;"></div>
		    	<small id="companyNameHelp" class="form-text text-muted" style="padding: 6px 12px;">Por favor, selecciona la razón social que necesites.</small>
		  	</div>
		</div>
	</div>
	
	<label class="col-sm-12 col-md-6">Dirección</label>
  	<div class="row">
    	<div class="col-sm-12 col-md-12">
  			<div class="card" id="tabs">
		    	<ul class="nav nav-tabs" role="tablist">
		        	<li role="presentation" class="active"><a href="#select" aria-controls="home" role="tab" data-toggle="tab">SELECCIONAR</a></li>
		            <li role="epresentation"><a href="#add" aria-controls="profile" role="tab" data-toggle="tab">AGREGAR</a></li>
		       	</ul>
		        <!-- Tab panes -->
		        <div class="tab-content">
		        	<div role="tabpanel" class="tab-pane active" id="select">
		            	<div class="row">
		            		<div class="col-md-8 col-sm-12">
			             		<div class="form-group" id="addressInfo">
			             			<label class="col-sm-12 col-md-6">No hay direcciones por seleccionar</label>
			             		</div>
		             		</div>
		             	</div>
		             </div>
		             <div role="tabpanel" class="tab-pane fade" id="add">
					 	<div class="row">
					    	<div class="col-sm-12 col-md-12">
				            	<div class="row">
				             		<div class="col-sm-6 col-md-6">
				                		<div class="form-group">
									    	<label class="col-sm-6 col-md-6">Calle</label>
									    	<input  type="text" class="form-control col-md-6" name="street" id="street" placeholder="Calle">
									  	</div>
									    <div class="form-group">
									    	<label class="col-sm-6 col-md-6">Interior</label>
									    	<input  type="number" class="form-control col-md-6" name="intNum" id="intNum" placeholder="Número interior">
									    </div>
										<div class="form-group">
											<label class="col-sm-6 col-md-6">Delegación/Municipio</label>
										    <input  type="text" class="form-control col-md-6" name="city" id="city" placeholder="Delegación / Municipio">
										</div>
										<div class="form-group">
										    <label class="col-sm-6 col-md-6">Código postal</label>
										    <input  type="number" class="form-control col-md-6" name="zipCode" id="zipCode" placeholder="Código postal">
										</div>
									</div>
				             		<div class="col-sm-6 col-md-6">
										<div class="form-group">
									    	<label class="col-sm-6 col-md-6">Exterior</label>
									    	<input  type="number" class="form-control col-md-6" name="extNum" id="extNum" placeholder="Número exterior">
										</div>
										<div class="form-group">
											<label class="col-sm-6 col-md-6">Colonia</label>
										    <input  type="text" class="form-control col-md-6" name="suburb" id="suburb" placeholder="Colonia">
										</div>
										<div class="form-group">
											<label class="col-sm-6 col-md-6">Estado</label>
										    <input  type="text" class="form-control col-md-6" name="state" id="state" placeholder="Estado">
										</div>
										<div class="form-group">
											<label class="col-sm-6 col-md-6">País</label>
										    <input  type="text" class="form-control col-md-6" name="country" id="country" placeholder="País">
										</div>
								 	</div>
					        	</div>
					    	</div>
						</div>
		        	</div>
	        	</div>
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
				<input type="hidden" id="dtp_input2" name="dtp_input2" value="" /><br/>
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
				<input type="hidden" id="dtp_input3" name="dtp_input3" value="" /><br/>
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
				    <input required type="text" class="form-control" id="contactApo" name="contactApo" placeholder="contacto">
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
		<!--   <button type="button" class="btn btn-primary" onclick="saveInfo();">Agendar</button>-->
		<button type="submit" class="btn btn-primary" >Agendar</button>
		  <button type="button" id="modified" class="btn btn-primary" onclick="SaveModifiedInformation();">Guardar cambios</button>
	 </div>
 </form>
 </div>
 	<div id="secondaryPanel"></div>
 </div>