<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <div id="searchClient">
	<form id="formCalls" onSubmit="return registreCall(1);" data-toggle="validator" role="form">
		<div class="row top">
	    	<div class="col-sm-6 col-md-6">
				<div class="form-group">
			 		<label class="col-sm-6 col-md-6">Razón social:</label>
					<div id="selectClient" name="selectClient"> </div>
					<input type="hidden" name="AddClient" value="0">
				</div>
			</div>
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<div class="row">
						<div class="col-md-6 col-lg-6"">
							<div id="countCalls"></div>
						</div>
						<div class="col-md-6 col-lg-6">
							<div class="input-group" id="clientTypeContainer" style="float:right">
					        </div>
				   		</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="form2" class="row">
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
		  			<label class="col-sm-6 col-md-6">Seleccione tipo de contacto:</label>
					<input type="button" class="btn btn-primary" id="btnConSelect3" name="btnConSelect3" value="Existente" onclick="pintar(3);">
					<input type="button" class="btn btn-primary" id="btnSinSelect2" name="btnSinSelect2" value="Nuevo" onclick="pintar(2);">
				</div>
			</div>
		</div>
	</form>
</div>

<script type="text/javascript"> 
	$(document).ready(function(){
		selectClient('Call');
	});
</script>