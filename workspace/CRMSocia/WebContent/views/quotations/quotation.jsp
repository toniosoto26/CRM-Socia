<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" href="css/address.css">

<div class="row">
	<div id="primaryPanel" class="col-sm-12 col-md-12">
		<div class="titulo"><h3>Formato de generaci�n de cotizaciones</h3></div>	
	
		<form id="addQuotation" onSubmit="return addQuotation();" data-toggle="validator" role="form">
			<div class="row top">
		    	<div class="col-sm-8 col-md-8">
					<div class="form-group">
				 		<label class="col-sm-12 col-md-6">Raz�n social</label>
				    	<div id="selectClient" style="padding: 6px 12px;"></div>
				    	<small id="companyNameHelp" class="form-text text-muted" style="padding: 6px 12px;">Por favor, selecciona la raz�n social que necesites.</small>
				  	</div>
				</div>
				<div class="col-md-4 col-lg-4">
					<div class="input-group" id="clientTypeContainer" style="float:right"></div>
		   		</div>
		   	</div>
		   	<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="form-group top">
						<label for="inputDeadline" class="col-sm-6 col-md-6">Fecha cierre</label>
						<div class="input-group date form_date col-md-6 col-sm-6" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input1" data-link-format="yyyy-mm-dd">
					    	<input id="startUpDate" required class="form-control" size="16" type="text" value="" readonly>
					        <span  class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
					    </div>
						<input type="hidden" name="deadline" id="dtp_input1" value="" />
					</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<div class="form-group top">
						<label for="inputDeadline" class="col-sm-6 col-md-6">Vigencia</label>
						<div class="input-group date form_date col-md-6 col-sm-6" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
					    	<input id="startUpDate" required class="form-control" size="16" type="text" value="" readonly>
					        <span  class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
					    </div>
						<input type="hidden" name="effectiveDate" id="dtp_input2" value="" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="form-group">
				    	<label class="col-sm-6 col-md-6">Tiempos de entrega</label>
				    	<input type="text" class="form-control col-md-6" name="deliveryTimes" id="deliveryTimes" value="DE 24 A 48 HORAS H�BILES">
				  	</div>
				</div>
			</div>
			
		  	<label class="col-sm-12 col-md-6">Direcci�n</label>
		  	<div class="row">
		    	<div class="col-sm-12 col-md-12">
		  			<div class="card" id="tabs">
				    	<ul class="nav nav-tabs" role="tablist">
				        	<li role="presentation" class="active"><a href="#select" aria-controls="home" role="tab" data-toggle="tab">SELECCIONAR</a></li>
				            <li role="presentation"><a href="#add" aria-controls="profile" role="tab" data-toggle="tab">AGREGAR</a></li>
				       	</ul>
				        <!-- Tab panes -->
				        <div class="tab-content">
				        	<div role="tabpanel" class="tab-pane active" id="select">
				            	<div class="row">
				            		<div class="col-md-8 col-sm-12">
					             		<div class="form-group" id="addressInfo">
					             			<label class="col-sm-12 col-md-6">No hay direcciones por seleccionar</label>
					             		</div>
				             		</div>
				             	</div>
				             </div>
				             <div role="tabpanel" class="tab-pane fade" id="add">
							 	<div class="row">
							    	<div class="col-sm-12 col-md-12">
						            	<div class="row">
						             		<div class="col-sm-6 col-md-6">
						                		<div class="form-group">
											    	<label class="col-sm-6 col-md-6">Calle</label>
											    	<input type="text" class="form-control col-md-6" name="street" id="street" placeholder="Calle">
											  	</div>
											</div>
											<div class="col-sm-6 col-md-6">
												<div class="form-group">
											    	<label class="col-sm-6 col-md-6">Exterior</label>
											    	<input type="number" class="form-control col-md-6" name="extNum" id="extNum" placeholder="N�mero exterior">
												</div>
											</div>
										</div>
										<div class="row">
						             		<div class="col-sm-6 col-md-6">
						             			<div class="form-group">
											    	<label class="col-sm-6 col-md-6">Interior</label>
											    	<input type="number" class="form-control col-md-6" name="intNum" id="intNum" placeholder="N�mero interior">
											    </div>
											</div>
											<div class="col-sm-6 col-md-6">	
											  	<div class="form-group">
													<label class="col-sm-6 col-md-6">Colonia</label>
												    <input type="text" class="form-control col-md-6" name="suburb" id="suburb" placeholder="Colonia">
												</div>
											</div>
										</div>
										<div class="row">
						             		<div class="col-sm-6 col-md-6">
											  	<div class="form-group">
													<label class="col-sm-6 col-md-6">Delegaci�n/Municipio</label>
												    <input type="text" class="form-control col-md-6" name="city" id="city" placeholder="Delegaci�n / Municipio">
												</div>
											</div>
						             		<div class="col-sm-6 col-md-6">
											  <div class="form-group">
													<label class="col-sm-6 col-md-6">Estado</label>
												    <input type="text" class="form-control col-md-6" name="state" id="state" placeholder="Estado">
												</div>
											</div>
										</div>
										<div class="row">
						             		<div class="col-sm-6 col-md-6">
												<div class="form-group">
												    <label class="col-sm-6 col-md-6">C�digo postal</label>
												    <input type="number" class="form-control col-md-6" name="zipCode" id="zipCode" placeholder="C�digo postal">
												</div>
											</div>
						             		<div class="col-sm-6 col-md-6">
												<div class="form-group">
													<label class="col-sm-6 col-md-6">Pa�s</label>
												    <input type="text" class="form-control col-md-6" name="country" id="country" placeholder="Pa�s">
												</div>
										 	</div>
							        	</div>
							    	</div>
								</div>
				        	</div>
			        	</div>
			  		</div>
				</div>
			</div>
			
			<div class="row">
		    	<div class="col-sm-12 col-md-6">
			  		<div class="form-group">
					    <label class="col-sm-3 col-md-6">Contacto</label>
				  		<div id="clientInfo" style="margin-bottom: 10px;">
				  			<input required type="text" class="form-control" id="companyContact" name="companyContact" placeholder="Contacto">
						</div>
					</div>
			  	</div>
		  	</div>
		  	<div class="row">
		  		<div id="contactInfo">
		    		<div class="col-sm-6 col-md-6">
		  	  			<div class="form-group">
					    	<label class="col-sm-6 col-md-6">Tel�fono:</label>
					    	<input required type="text" class="form-control" id="companyPhone" name="companyPhone" placeholder="Tel�fono">
					    </div>
				    	<div class="form-group">
			    			<label class="col-sm-6 col-md-6">�rea:</label>
			    			<input required type="text" class="form-control" id="companyDivision" name="companyDivision" placeholder="�rea">
				    	</div>
				    </div>
				  	<div class="col-sm-6 col-md-6">
		  	  			<div class="form-group">
			    			<label class="col-sm-6 col-md-6">Email:</label>
			    			<input required type="email" class="form-control" id="companyEmail" name="companyEmail" placeholder="email">
				    	</div>
				    	<div class="form-group">
			    			<label class="col-sm-6 col-md-6">Puesto:</label>
			    			<input required type="text" class="form-control" id="companyPosition" name="companyPosition" placeholder="Puesto">
				    	</div>
					</div>
			  	</div>
			</div>
		  	<div class="row">
				<div class="col-sm-6 col-md-6">
			    	<div class="form-group">
					    <label class="col-sm-6 col-md-6">Moneda</label>
					    <select class="form-control col-md-6" id="currency" name="currency" onChange="displayExchangeRate(this);">
					      <option value="MXN">MXN</option>
					      <option value="USD">USD</option>
					    </select>
					</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<div class="form-group" id="exchangeRate" style="display:none;">
				    	<label class="col-sm-6 col-md-6">Tipo de cambio:</label>
				    	<input type="text" pattern="^[0-9]*[\.]?[0-9]*$" class="form-control" id="exchangeRateInp" name="exchangeRate" placeholder="Tipo de cambio">
				  	</div>
				</div>
			</div>
		 
		 	<div class="requisitos">
		  		<div class="table-responsive" style="overflow-x: inherit;">
			    	<h5>Registro de partidas</h5>
			    	<table class="table table-bordered" id="productsTable">
			    		<thead class="tabla-grande">
			    			<tr>
				    			<th>SKU / No. Parte</th>
				    			<th>Cantidad</th>
				    			<th>Descripci�n</th>
					    		<th>Garant�a</th>
					    		<th>Tiempo de entrega</th>
					    		<th>Precio unitario</th>
					    		<th>Margen</th>
				    		</tr>
				    	</thead>
				    	<tbody>
				    	</tbody>
				    </table>
				    <input type="hidden" name="totalProducts" id="totalProducts" value="1" />
				    <button type="button" class="btn btn-primary" style="float:right;" onClick="addProduct();">+</button>
		  		</div>
		  	</div>
		  
		 	<div class="contactos">
			  	<div class="text-center">
					<button type="button" class="btn btn-primary" data-toggle="modal" href="views/quotations/responses/quotationPreview.jsp" data-target="#modal">Previsualizar</button>
			  	  	<button type="submit" class="btn btn-primary" onClick="return sendMail(2);">Enviar</button>
			  	  	<button type="submit" class="btn btn-primary" onClick="return sendMail(6);">Enviar <i class="fa fa-paperclip" aria-hidden="true"></i></button>
				</div>
			</div>
		</form>
	</div>
	<div id="secondaryPanel">
	</div>                                     
</div>

<script type="text/javascript" src="js/quotations/quotation.js"></script>