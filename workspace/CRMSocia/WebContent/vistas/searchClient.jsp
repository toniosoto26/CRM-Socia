<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div id="form1">
	<form>
		<div class="form-group">
				<label for="inputCompanyName">Raz�n social:</label>
				<div id="selectClient"></div>
		<div>
		<div id="contactInfo">
		  <div class="form-group">
		    <label for="inputCompanyContact">Contacto</label>
		    <input type="text" class="form-control" id="companyContact" placeholder="Contacto">
		  </div>
	  	  <div class="form-group">
		    <label for="inputCompanyEmail">Email:</label>
		    <input type="text" class="form-control" id="companyEmail" placeholder="email">
		  </div>
		  <div class="form-group">
		    <label for="inputCompanyPhone">Tel�fono:</label>
		    <input type="text" class="form-control" id="companyPhone" placeholder="Tel�fono">
		  </div>
	   </div>
	   <div class="form-group">
	    <label for="inputObservation">Observaciones</label>
	    <input type="textarea" class="form-control" id="observation" placeholder="Observaciones">
	  </div>
	   <div class="form-group">
	    <label for="inputFirstCall">Primera Llamada</label>
	    <input type="checkbox" class="form-control" id="firstCall" checked>
	  </div>
	   <div class="form-group">
	    <input type="button" id="btnGuardar" name="Guardar" value="Guardar" onclick="validar();">
	  </div>
	</form>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
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