<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div id="formNewClient">
	<form id="formCalls" onSubmit="return registreCall(1);" data-toggle="validator" role="form">
		<div class="row top">
	    	<div class="col-sm-6 col-md-6">
				<div class="form-group">
			 		<label class="col-sm-7 col-md-7">Razón social:</label>
					<input required type="text" class="form-control" id="companyName" placeholder="Razon social" name="selectClient">
					<input type="hidden" name="AddClient" value="1">
				</div>
			</div>
		</div>
		
		<div id="form2" class="row">
			<div class="col-sm-3 col-md-3">
				<div class="form-group">
		  			<label class="col-sm-6 col-md-6">Seleccione tipo de contacto:</label>
				</div>
				<input type="button" class="btn btn-primary" id="btnConSelect2" name="btnConSelect2" value="Actual" onclick="pintar(3);">
				<input type="button" class="btn btn-primary" id="btnSinSelect2" name="btnSinSelect2" value="Prospecto" onclick="pintar(2);">
			</div>
		</div>
	</form>
</div>