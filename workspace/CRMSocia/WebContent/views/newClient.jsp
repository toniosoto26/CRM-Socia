<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div id="formNewClient">
	<form id="formCalls">
		<div class="form-group">
			<label for="inputCompanyName">Razón social:</label>
			<input type="text" class="form-control" id="companyName" placeholder="Razon social" name="selectClient">
			<input type="hidden" name="AddClient" value="1">
		</div>
		
		<div id="form2">
			<input type="button" class="btn btn-primary" id="btnConSelect2" name="btnConSelect2" value="Existente" onclick="pintar(3);">
			<input type="button" class="btn btn-primary" id="btnSinSelect2" name="btnSinSelect2" value="Nuevo" onclick="pintar(2);">
			
		</div>
		
	</form>
</div>
		
