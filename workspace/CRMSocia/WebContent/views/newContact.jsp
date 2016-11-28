<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
<div id="formNewContact">

		<div class="form-group">
			<label for="inputCompanyName">Nombre Contacto:</label>
			<input type="text" class="form-control" id="nameContact"  placeholder="Nombre contacto" name="selectContact">
			<input type="hidden" name="AddContact" value="1">
		  <div class="form-group">
		    <label for="inputCompanyContact">Apellido</label>
		    <input type="text" class="form-control" id="lastName" placeholder="Apellido" name="lastName">
		  </div>
	  	  <div class="form-group">
		    <label for="inputCompanyEmail">Email:</label>
		    <input type="text" class="form-control" id="companyEmail" placeholder="email" name="companyEmail">
		  </div>
		  <div class="form-group">
		    <label for="inputCompanyPhone">Teléfono:</label>
		    <input type="text" class="form-control" id="companyPhone" placeholder="Teléfono" name="companyPhone">
		  </div>
		  <div class="form-group">
		    <label for="inputCompanyPhone">Area:</label>
		     <div id="selectDivision" name="selectDivision"> </div>
		  </div>
		   <div class="form-group">
		    <label for="inputCompanyPhone">Puesto:</label>
		    <div id="selectPosition" name="selectPosition"> </div>
		  </div>
	   </div>
	   <div class="form-group">
	    <label for="inputObservation">Observaciones de la llamada</label>
	    <input type="textarea" class="form-control" id="observation" placeholder="Observaciones" name="observation">
	  </div>
	   <div class="form-group">
            <label for="happy2">Estado de llamada:</label>
                <div class="input-group">
                    <div id="radioBtnV2" class="btn-group">
                        <span class="btn btn-success btn-sm active" data-toggle="estadollamda" data-value="1" data-active="btn-success" data-notactive="btn-default">CITA/COT/CONCURSO</span>
                        <span class="btn btn-default btn-sm notActive" data-toggle="estadollamda" data-value="2" data-active="btn-warning" data-notactive="btn-default">CARTA/INTERES</span>
                        <span class="btn btn-default btn-sm notActive" data-toggle="estadollamda" data-value="3" data-active="btn-danger" data-notactive="btn-default">NO INTE/NO CONTESTO</span>
                    </div>
                    <input type="hidden" name="estadoLlamada" id="estadollamda">
                </div>
        </div>
	   <div class="form-group">
            <label for="happy" >Se envio Carta:</label>
                <div class="input-group">
                    <div id="radioBtn" class="btn-group">
                        <span class="btn btn-primary btn-sm active" data-toggle="carta" data-value="1">SI</span>
                        <span class="btn btn-default btn-sm notActive" data-toggle="carta" data-value="0">NO</span>
                    </div>
                    <input type="hidden" name="carta" id="carta">
                </div>
       	 </div>
       	 
       	 
	   <div class="form-group">
	    <input type="button" id="btnGuardar" class="btn btn-primary" name="Guardar" value="Guardar" onclick="registreCall(1);">
	  </div>

</div>
	
	<script src="js/chosen.jquery.js" type="text/javascript"></script>
	<script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript"> 
		$(document).ready(function(){
			selectContact();
			selectDivision();
			selectPosition();
			
			 $('#radioBtn span').on('click', function(){
			        var sel = $(this).data('value');
			        var tog = $(this).data('toggle');
			        $('#'+tog).val(sel);
			        // You can change these lines to change classes (Ex. btn-default to btn-danger)
			        $('span[data-toggle="'+tog+'"]').not('[data-value="'+sel+'"]').removeClass('active btn-primary').addClass('notActive btn-default');
			        $('span[data-toggle="'+tog+'"][data-value="'+sel+'"]').removeClass('notActive btn-default').addClass('active btn-primary');
			    });
			
			 $('#radioBtnV2 span').on('click', function(){
			        var sel = $(this).data('value');
			        var tog = $(this).data('toggle');
			        var active = $(this).data('active');
			        var classes = "btn-default btn-primary btn-success btn-info btn-warning btn-danger btn-link";
			        var notactive = $(this).data('notactive');
			        $('#'+tog).val(sel);
			        $('span[data-toggle="'+tog+'"]').not('[data-value="'+sel+'"]').removeClass('active '+classes).addClass('notActive '+notactive);
			        $('span[data-toggle="'+tog+'"][data-value="'+sel+'"]').removeClass('notActive '+classes).addClass('active '+active);
			    });
			
		});
		
	</script>


