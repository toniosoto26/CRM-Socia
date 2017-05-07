<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div class="row">
	<div id="primaryPanel" class="col-sm-12 col-md-12">
		<div class="titulo"><h3>Llamadas</h3></div>    
		
		<div id="form1">
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
		  			<label class="col-sm-6 col-md-6">Seleccione Tipo de Cliente :</label>
				</div>
				<input type="button" class="btn btn-primary" id="btnConSelect" name="btnConSelect" value="Actual" onclick="pintar(1);">
				<input type="button" class="btn btn-primary" id="btnSinSelect" name="btnSinSelect" value="Prospecto" onclick="pintar(0);">
			</div>
		</div>
	</div>
	<div id="secondaryPanel">
	</div>
</div>