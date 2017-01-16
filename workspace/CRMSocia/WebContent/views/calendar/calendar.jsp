<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div class="titulo"><h3>Calendario</h3></div>

<link rel="stylesheet" href="css/bootstrap-datetimepicker.css">
<link rel="stylesheet" href="css/chosen.css">

<div class="row">
	<div id="primaryPanel" class="col-sm-12 col-md-12">
		<div id="resultAppointment">
			<input type="hidden" id="calendarAppo">
		</div>
	</div>
	<div id="secondaryPanel">
	</div>
	
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        		<h4 class="modal-title">Módulo de registro rápido de fechas concurso</h4>
	      		</div>
	      			<form id="addTender" onSubmit="return addTender();" data-toggle="validator" role="form">
		      			<div class="modal-body">
							<div class="row">
					    		<div class="col-sm-12 col-md-12">
									<div class="form-group top">
							 			<label class="col-sm-12 col-md-6">Razón social:</label>
										<div id="selectClient"></div>
									</div>
									<div class="form-group top">
										<label for="inputStartUpDate" class="col-sm-6 col-md-6">Fecha inicio de gestión</label>
										<div class="input-group date form_date col-md-6 col-sm-6" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input1" data-link-format="yyyy-mm-dd">
									    	<input id="startUpDate" required class="form-control" size="16" type="text" value="" readonly>
									        <span  class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
											<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
									    </div>
										<input type="hidden" name="startUpDate" id="dtp_input1" value="" />
									</div>
									<div class="form-group top">
									    <label class="col-sm-6 col-md-6" for="inputDeadline">Fecha concurso</label>
									    <div class="input-group date form_date col-md-6 col-sm-6" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
									    	<input id="deadline" required class="form-control" size="16" type="text" value="" readonly>
									        <span  class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
											<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
									    </div>
										<input type="hidden" name="deadline" id="dtp_input2" value="" />
								  	</div>
								  	<div class="form-group top">
									    <label class="col-sm-6 col-md-6" for="inputBusinessLine">Línea de negocio que se concursa</label>
									    <div id="selectBusinessLine"></div>
								  	</div>
								  	
								  	<div class="form-group">
									    <label class="col-sm-6 col-md-6" for="inputDecisionMaker">Tomador de decisión</label>
									    <input required type="text" class="form-control" id="decisionMaker" placeholder="Tomador de decisión" name="decisionMaker">
								  	</div>
								  	<div class="form-group">
									    <label class="col-sm-6 col-md-6" for="inputCurrentBrand">Marca actual</label>
									    <input required type="text" class="form-control" id="currentBrand" placeholder="Marca actual" name="currentBrand">
								  	</div>
								  	<div class="form-group">
									    <label class="col-sm-6 col-md-6" for="inputRequirements">Requisitos para concursar</label>
									    <textarea required class="form-control" id="requirements" placeholder="Requisitos" name="requirements"></textarea>
									</div>
									<div class="form-group">
									    <label class="col-sm-6 col-md-6" for="inputComments">Observaciones</label>
									    <textarea required class="form-control" id="comments" placeholder="Observaciones" name="comments"></textarea>
									</div>
						      	</div>
							</div>
		      		</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
		        		<button type="submit" class="btn btn-primary">Guardar</button>
		      		</div>
				</form>
	    	</div><!-- /.modal-content -->
	  	</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
		
</div>

<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.es.js"></script>
<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/calendar/calendar.js"></script>