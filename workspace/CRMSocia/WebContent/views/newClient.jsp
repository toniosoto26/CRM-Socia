<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div id="formNewClient">
	<form id="formCalls">
		<div class="row top">
	    	<div class="col-sm-6 col-md-6">
				<div class="form-group">
			 		<label class="col-sm-12 col-md-6">Razón social:</label>
					<input type="text" class="form-control" id="companyName" placeholder="Razon social" name="selectClient">
					<input type="hidden" name="AddClient" value="1">
				</div>
			</div>
		</div>
		
		<div id="form2" class="row">
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
		  			<label class="col-sm-6 col-md-6">Seleccione tipo de contacto:</label>
				</div>
				<input type="button" class="btn btn-primary" id="btnConSelect2" name="btnConSelect2" value="Existente" onclick="pintar(3);">
				<input type="button" class="btn btn-primary" id="btnSinSelect2" name="btnSinSelect2" value="Nuevo" onclick="pintar(2);">
			</div>
		</div>
	</form>
</div>