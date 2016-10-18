<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Cotizaciones</title>
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
	<link rel="stylesheet" href="css/prism.css">
	<link rel="stylesheet" href="css/chosen.css">
</head>
<body>
	
	<form id="addQuotation" onSubmit="return addQuotation();">
				
	  <div class="form-group">
	    <label for="inputCompanyName">Razón social:</label>
	    <div id="selectClient"></div>
	    <small id="companyNameHelp" class="form-text text-muted">Por favor, selecciona la razón social que necesites.</small>
	  </div>
	  <div class="form-group" id="addressInfo">
	  </div>
	  <div class="form-group">
	  	<button type="button" class="btn btn-primary" onClick="showNewAddress();">Agregar dirección</button>
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
		  <button type="button" class="btn btn-primary" onClick="" >Previsualizar</button>
	  	  <button type="submit" class="btn btn-primary" >Enviar</button>
  	  </div>
	</form>

	<script src="js/chosen.jquery.js" type="text/javascript"></script>
	<script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/quotation.js"></script>
</body>
</html>