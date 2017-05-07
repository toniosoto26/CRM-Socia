<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
<div id="formNewContact">
	<div class="col-sm-10 col-md-10">
		<div class="row">
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<label for="inputCompanyName" class="col-sm-6 col-md-6">Nombre Contacto</label>
					<input required type="text" class="form-control" id="nameContact"  placeholder="Nombre contacto" name="selectContact">
					<input type="hidden" name="AddContact" value="1">
				</div>
				</div>
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<label class="col-sm-6 col-md-6" for="inputCompanyContact">Apellido</label>
				    <input required type="text" class="form-control" id="lastName" placeholder="Apellido" name="lastName">
			  	</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-md-6">
			  	<div class="form-group top">
				    <label class="col-sm-6 col-md-6" for="inputCompanyEmail">Email</label>
				    <input required type="email" class="form-control" id="companyEmail" placeholder="email" name="companyEmail">
		  		</div>
		  	</div>
		  	<div class="col-sm-6 col-md-6">
			  	<div class="form-group">
				    <label class="col-sm-6 col-md-6" for="inputCompanyPhone">Teléfono</label>
		    		<input required type="text" pattern="[0-9\(\)\-\+]+"  class="form-control col-lg-4 col-md-4" style="width:25%" id="companyPhone" placeholder="[###]##-##-##-##" name="companyPhone">
		  		
		    		<label class="col-sm-1 col-md-1" for="inputExt">Ext.</label>
		    		<input  type="text" pattern="[0-9]+" class="col-sm-2 col-md-2" id="ext" placeholder="ext." name="ext">
			  	</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-md-6">
		  		<div class="form-group top">
		    		<label class="col-sm-6 col-md-6" for="inputCompanyPhone">Área</label>
			     	<div id="selectDivision" name="selectDivision"> </div>
		  		</div>
		  	</div>
		  	<div class="col-sm-6 col-md-6">
			   	<div class="form-group top">
				    <label class="col-sm-6 col-md-6" for="inputCompanyPhone">Puesto</label>
				    <div id="selectPosition" name="selectPosition"> </div>
			  	</div>
	   		</div>
	   	</div>
	   	<div class="row">
		   	<div class="col-sm-12 col-md-12">
				<div class="form-group">
				    <label class="col-sm-3 col-md3" for="inputObservation">Observaciones de la llamada</label>
				    <textarea required class="form-control" id="observation" placeholder="Observaciones" name="observation"></textarea>
				</div>
		   		<div class="form-group top">
	            	<label class="col-sm-3 col-md-3" for="happy2">Estado de llamada</label>
	                <div class="input-group">
	                    <div id="radioBtnV2" class="btn-group">
	                        <span class="btn btn-success btn-sm active" data-toggle="estadollamda" data-value="1" data-active="btn-success" data-notactive="btn-default">CITA/COT/CONCURSO</span>
	                        <span class="btn btn-default btn-sm notActive" data-toggle="estadollamda" data-value="2" data-active="btn-warning" data-notactive="btn-default">CARTA/INTERES/COBRANZA</span>
	                        <span class="btn btn-default btn-sm notActive" data-toggle="estadollamda" data-value="3" data-active="btn-danger" data-notactive="btn-default">NO INTE/NO CONTESTO</span>
	                    </div>
	                    <input type="hidden" name="estadoLlamada" id="estadollamda" value="1">
	                </div>
	        	</div>
		   		<div class="form-group top">
	            	<label class="col-sm-3 col-md-3" for="happy" >Se envió carta:</label>
	                <div class="input-group">
	                    <div id="radioBtn" class="btn-group">
	                        <span class="btn btn-primary btn-sm active" data-toggle="carta" data-value="1">SI</span>
	                        <span class="btn btn-default btn-sm notActive" data-toggle="carta" data-value="0">NO</span>
	                    </div>
	                    <input type="hidden" name="carta" id="carta" value="1">
	                </div>
	       	 	</div>
	       	 	<div class="form-group top">
				            <label class="col-sm-3 col-md-3" for="happy" >Se detectó concurso</label>
				                <div class="input-group">
				                    <div id="radioBtn" class="btn-group">
				                        <span class="btn btn-primary btn-sm active" data-toggle="concurso" data-value="1">SI</span>
				                        <span class="btn btn-default btn-sm notActive" data-toggle="concurso" data-value="0">NO</span>
				                    </div>
				                    <input type="hidden" name="concurso" id="concurso" value="1">
				                </div>
				</div>
	      	</div>
	    </div>
	    <div class="row">
	    	<div class="col-sm-12 col-md-12">
			   	<div class="text-center">
	    			<input type="submit" id="btnGuardar" class="btn btn-primary" name="Guardar" value="Guardar" >
	  			</div>
	  		</div>
	  	</div>
	</div>
	<div class="col-sm-2 col-md-2">
				<button type="button" class="btn btn-primary" id="myBtn" onclick="modalCalls(1);" style="width: 180px;">Speech</button>
				<br><br>
				<button type="button" class="btn btn-primary" id="myBtn" onclick="modalCalls(2);" style="width: 180px;">Guía</button>
				<br><br>
				<button type="button" class="btn btn-primary" id="myBtn" onclick="modalCalls(3);" style="width: 180px;">Manejo de objeciones</button>
				<br><br>
				<input type="button" class="btn btn-primary" id="btnConSelect" name="btnConSelect" value="Envío Carta" onclick="sendMailCall(9);" style="width: 180px;">
				<br><br>
				<input type="button" class="btn btn-primary" id="btnConSelect" name="btnConSelect" value="Envío presentación" onclick="sendMailCall(10);" style="width: 180px;">
				<br><br>
				<input type="button" class="btn btn-primary" id="btnConSelect" name="btnConSelect" value="Envío promociones" onclick="" style="width: 180px;" disabled>
				<br><br>
				<input type="button" class="btn btn-primary" id="btnConSelect" name="btnConSelect" value="Envío Cartera" onclick="" style="width: 180px;" disabled>
				<br><br>
				<button type="button" class="btn btn-primary" id="myBtn" onclick="modalCalls(4);" style="width: 180px;">Líneas de Negocio</button>
			</div>
</div>


 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" style="width:80%">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Titulo</h4>
        </div>
        <div class="modal-body">
          <p>Cuerpo de modal</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
  

	<script src="js/chosen.jquery.js" type="text/javascript"></script>
	<script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/call/callModal.js"></script>
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


