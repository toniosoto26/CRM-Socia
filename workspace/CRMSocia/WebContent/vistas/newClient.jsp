<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="form2">
	<form>
		<table>
			<div class="form-group">
				<label for="inputCompanyName">Razón social:</label>
				<input type="text" class="form-control" id="companyName" placeholder="Razon social">
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
		    <label for="inputCompanyPhone">Teléfono:</label>
		    <input type="text" class="form-control" id="companyPhone" placeholder="Teléfono">
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
</body>
</html>