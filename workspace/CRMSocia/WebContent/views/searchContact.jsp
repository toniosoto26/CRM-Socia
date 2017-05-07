<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <div id="searchContact">
	<div class="col-sm-6 col-md-6">
		<div class="form-group">
				<label class="col-sm-6 col-md-6">Nombre Contacto:</label>
				<div id="selectContact" class="top"> </div>
				<input type="hidden" name="AddContact" value="0">
		</div>
	</div>
	<div id="contactInfo"></div>
</div>

<script type="text/javascript"> 
	$(document).ready(function(){
		selectContact();
	});
</script>