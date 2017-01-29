<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" href="css/prism.css">
<link rel="stylesheet" href="css/chosen.css">
<link rel="stylesheet" href="css/address.css">
<link rel="stylesheet" href="css/font-awesome.min.css">

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
											    <div class="form-group">
											    	<label class="col-sm-6 col-md-6">Interior</label>
											    	<input type="number" class="form-control col-md-6" name="intNum" id="intNum" placeholder="N�mero interior">
											    </div>
												<div class="form-group">
													<label class="col-sm-6 col-md-6">Delegaci�n/Municipio</label>
												    <input type="text" class="form-control col-md-6" name="city" id="city" placeholder="Delegaci�n / Municipio">
												</div>
												<div class="form-group">
												    <label class="col-sm-6 col-md-6">C�digo postal</label>
												    <input type="number" class="form-control col-md-6" name="zipCode" id="zipCode" placeholder="C�digo postal">
												</div>
											</div>
						             		<div class="col-sm-6 col-md-6">
												<div class="form-group">
											    	<label class="col-sm-6 col-md-6">Exterior</label>
											    	<input type="number" class="form-control col-md-6" name="extNum" id="extNum" placeholder="N�mero exterior">
												</div>
												<div class="form-group">
													<label class="col-sm-6 col-md-6">Colonia</label>
												    <input type="text" class="form-control col-md-6" name="suburb" id="suburb" placeholder="Colonia">
												</div>
												<div class="form-group">
													<label class="col-sm-6 col-md-6">Estado</label>
												    <input type="text" class="form-control col-md-6" name="state" id="state" placeholder="Estado">
												</div>
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
		  		<div class="table-responsive">
			    	<h5>Registro de partidas</h5>
			    	<table class="table table-bordered" id="productsTable">
			    		<thead class="tabla-grande">
			    			<tr>
				    			<th>No. Parte</th>
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

<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/quotations/quotation.js"></script>