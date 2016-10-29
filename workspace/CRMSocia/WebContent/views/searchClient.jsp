<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <div id="form1">
	<form id="formCalls">
		<div class="form-group">
				<label for="inputCompanyName">Razón social:</label>
				<div id="selectClient" name="selectClient"> </div>
		</div>
		<div id="clientInfo">
		  <div class="form-group">
		    <label for="inputCompanyContact">Contacto</label>
		    <input type="text" class="form-control" id="companyContact" placeholder="Contacto" name="companyContact">
		  </div>
		  </div>
		 <div id="contactInfo">
	  	  <div class="form-group">
		    <label for="inputCompanyEmail">Email:</label>
		    <input type="text" class="form-control" id="companyEmail" placeholder="email" name="companyEmail">
		  </div>
		  <div class="form-group">
		    <label for="inputCompanyPhone">Teléfono:</label>
		    <input type="text" class="form-control" id="companyPhone" placeholder="Teléfono" name="companyPhone">
		  </div>
	   </div>
	   <div class="form-group">
	    <label for="inputObservation">Observaciones</label>
	    <input type="textarea" class="form-control" id="observation" placeholder="Observaciones" name="observation">
	  </div>
	   <div class="form-group">
	    <input type="button" id="btnGuardar"  class="btn btn-primary" name="Guardar" value="Guardar" onclick="registreCall(0);">
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