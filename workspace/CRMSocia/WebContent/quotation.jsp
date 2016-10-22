<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<link rel="stylesheet" href="css/prism.css">
	<link rel="stylesheet" href="css/chosen.css">
	<link rel="stylesheet" href="css/address.css">
	
	<form id="addQuotation" onSubmit="return addQuotation();">
				
	  <div class="form-group">
	    <label for="inputCompanyName">Razón social:</label>
	    <div id="selectClient"></div>
	    <small id="companyNameHelp" class="form-text text-muted">Por favor, selecciona la razón social que necesites.</small>
	  </div>
	  <label for="selectCompanyAddress" >Dirección</label>
	  <div class="card">
          <ul class="nav nav-tabs" role="tablist">
              <li role="presentation" class="active"><a href="#select" aria-controls="home" role="tab" data-toggle="tab">SELECCIONAR</a></li>
              <li role="presentation"><a href="#add" aria-controls="profile" role="tab" data-toggle="tab">AGREGAR</a></li>
          </ul>
          <!-- Tab panes -->
          <div class="tab-content">
              <div role="tabpanel" class="tab-pane active" id="select">
              	<div class="row">
              		<div class="form-group" id="addressInfo">No hay direcciones por seleccionar</div>
              	</div>
			  </div>
              <div role="tabpanel" class="tab-pane fade" id="add">
              	<div class="row">
              	  <div class="col-md-12">
					  <div class="form-group row">
					    <div class="col-md-8">
					    	<label for="inputCompanyAddress" >Calle</label>
					    	<input type="text" class="form-control" name="street" id="street" placeholder="Calle">
					  	</div>
					    <div class="col-md-2">
					    	<label for="inputExtNum">Exterior</label>
					    	<input type="text" class="form-control" name="extNum" id="extNum" placeholder="Número exterior">
					    </div>
					    <div class="col-md-2">
					    	<label for="inputIntNum">Interior</label>
					    	<input type="text" class="form-control" name="intNum" id="intNum" placeholder="Número interior">
					    </div>
					  </div>
				  </div>
				  <div class="col-md-12">
					  <div class="form-group row">
						  <div class="col-md-4">
						    <label for="inputCity">Colonia</label>
						    <input type="text" class="form-control" name="suburb" id="suburb" placeholder="Colonia">
						  </div>
						  <div class="col-md-4">
						    <label for="inputExchangeRate">Delegación/Municipio</label>
						    <input type="text" class="form-control" name="city" id="city" placeholder="Delegación / Municipio">
						  </div>
						  <div class="col-md-4">
						    <label for="inputExchangeRate">Estado</label>
						    <input type="text" class="form-control" name="state" id="state" placeholder="Estado">
						  </div>
					</div>
				  </div>
				  <div class="col-md-12">
					  <div class="form-group row">
						  <div class="col-md-6">
						    <label for="inputExchangeRate">País</label>
						    <input type="text" class="form-control" name="country" id="country" placeholder="País">
						  </div>
						  <div class="col-md-6">
						    <label for="inputExchangeRate">Código postal</label>
						    <input type="text" class="form-control" name="zipCode" id="zipCode" placeholder="Código postal">
						  </div>
					  </div>
				  </div>
              </div>
            </div>
          </div>
	  </div>
	  
	  <div id="contactInfo">
	  	<div class="col-md-12">
		  <div class="form-group row">
		  	<div class="col-md-12">
			    <label for="inputCompanyContact">Contacto</label>
			    <input type="text" class="form-control" id="companyContact" name="companyContact" placeholder="Contacto">
			</div>
		  </div>
		</div>
		<div class="col-md-12">
	  	  <div class="form-group row">
	  	  	<div class="col-md-6">
			    <label for="inputCompanyEmail">Email:</label>
			    <input type="text" class="form-control" id="companyEmail" name="companyEmail" placeholder="email">
		  	</div>
		  	<div class="col-md-6">
			    <label for="inputCompanyPhone">Teléfono:</label>
			    <input type="text" class="form-control" id="companyPhone" name="companyPhone" placeholder="Teléfono">
			</div>
		  </div>
	    </div>
	  </div>
	  <div class="col-md-12">
		  <div class="form-group row">
		    <div class="col-md-6">
			    <label for="selectCurrency">Moneda</label>
			    <select class="form-control" id="currency" name="currency" onChange="displayExchangeRate(this);">
			      <option value="MXN">MXN</option>
			      <option value="USD">USD</option>
			    </select>
			</div>
			<div class="col-md-6">
			  <div class="form-group" id="exchangeRate" style="display:none;">
			    <label for="inputExchangeRate">Tipo de cambio:</label>
			    <input type="text" class="form-control" id="exchangeRate" name="exchangeRate" placeholder="Tipo de cambio">
			  </div>
			</div>
		</div>
	  </div>
	  <div class="form-group">
	    <label for="products">Registro de partidas</label>
	    <table class="table" id="productsTable">
	    	<thead>
	    		<tr>
		    		<th>No. Parte</th>
		    		<th>Cantidad</th>
		    		<th>Descripción</th>
		    		<th>Garantía</th>
		    		<th>Tiempo de entrega</th>
		    		<th>Precio unitario</th>
	    		</tr>
	    	</thead>
	    	<tbody>
	    	</tbody>
	    </table>
	    <input type="hidden" name="totalProducts" id="totalProducts" value="1" />
	    <button type="button" class="btn btn-primary" onClick="addProduct();">+</button>
	  </div>
	  
	  <div class="text-right">
		  <button type="button" class="btn btn-primary" data-toggle="modal" href="utils/quotationPreview.jsp" data-target="#modal">Previsualizar</button>
	  	  <button type="submit" class="btn btn-primary" >Enviar</button>
  	  </div>
	</form>

	<script src="js/chosen.jquery.js" type="text/javascript"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/quotation.js"></script>