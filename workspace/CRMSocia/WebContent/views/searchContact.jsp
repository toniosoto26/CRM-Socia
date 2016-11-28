<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <div id="searchContact">
		<div class="form-group">
				<label for="inputCompanyName">Nombre Contacto:</label>
				<div id="selectContact" name="selectContact"> </div>
				<input type="hidden" name="AddContact" value="0">
		</div>
		<div id="contactInfo">
		
		</div>
		
</div>
	
	<script src="js/chosen.jquery.js" type="text/javascript"></script>
	<script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript"> 
		$(document).ready(function(){
			selectContact();

			
		});
		
	</script>


</body>
</html>