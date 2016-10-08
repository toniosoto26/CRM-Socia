<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Cotizaciones</title>
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
</head>
<body>
	
	<form>
	  <div class="form-group">
	    <label for="inputCompanyName">Razón social:</label>
	    <input type="text" class="form-control" id="companyName" aria-describedby="companyNameHelp" placeholder="Razón Social">
	    <small id="companyNameHelp" class="form-text text-muted">Por favor, selecciona la razón social que necesites.</small>
	  </div>
	  <div class="form-group">
	    <label for="inputCompanyAddress">Dirección:</label>
	    <input type="text" class="form-control" id="companyAddress" placeholder="Razón Social">
	  </div>
	  <div class="form-group">
	    <label for="inputCompanyPhone">Teléfono:</label>
	    <input type="text" class="form-control" id="companyPhone" placeholder="Teléfono">
	  </div>
	  <div class="form-group">
	    <label for="inputCompanyContact">Contacto</label>
	    <input type="text" class="form-control" id="companyContact" placeholder="Contacto">
	  </div>
  	  <div class="form-group">
	    <label for="inputCompanyEmail">Email:</label>
	    <input type="text" class="form-control" id="companyEmail" placeholder="email">
	  </div>
	  <div class="form-group">
	    <label for="selectCurrency">Moneda</label>
	    <select class="form-control" id="currency">
	      <option>MXN</option>
	      <option>USD</option>
	    </select>
	  </div>
	  <div class="form-group">
	    <label for="inputExchangeRate">Tipo de cambio:</label>
	    <input type="text" class="form-control" id="exchangeRate" placeholder="Tipo de cambio">
	  </div>
	  <div class="form-group">
	    <label for="products">Registro de partidas</label>
	    <table class="table">
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
	    		<tr>
		    		<td>
		    			<input type="text" class="form-control" id="itemNum" />
		    		</td>
		    		<td>
		    			<input type="text" class="form-control" id="quantity" />
		    		</td>
		    		<td>
		    			<input type="text" class="form-control" id="description" />
		    		</td>
		    		<td>
		    			<input type="text" class="form-control" id="warranty" />
		    		</td>
		    		<td>
		    			<input type="text" class="form-control" id="estimatedShipping" />
		    		</td>
		    		<td>
		    			<input type="text" class="form-control" id="unitPrice" />
		    		</td>
		    	</tr>
	    	</tbody>
	    </table>
	  </div>
	  
	  <div class="text-right">
		  <button type="button" class="btn btn-primary">Previsualizar</button>
	  	  <button type="submit" class="btn btn-primary">Enviar</button>
  	  </div>
	</form>

</body>
</html>