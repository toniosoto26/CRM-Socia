<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <div id="searchClient">
	<form id="formCalls">
		<div class="row top">
	    	<div class="col-sm-6 col-md-6">
				<div class="form-group">
			 		<label class="col-sm-12 col-md-6">Razón social:</label>
					<div id="selectClient" name="selectClient"> </div>
					<input type="hidden" name="AddClient" value="0">
				</div>
			</div>
		</div>
		
		<div id="form2">
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
		  			<label class="col-sm-6 col-md-6">Seleccione Tipo de contacto:</label>
				</div>
				<input type="button" class="btn btn-primary" id="btnConSelect3" name="btnConSelect3" value="Existente" onclick="pintar(3);">
				<input type="button" class="btn btn-primary" id="btnSinSelect2" name="btnSinSelect2" value="Nuevo" onclick="pintar(2);">
			</div>
		</div>
	</form>
</div>

		
	
	<script src="js/chosen.jquery.js" type="text/javascript"></script>
	<script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript"> 
		$(document).ready(function(){
			selectClient();
			
		});
		
	</script>


</body>
</html>