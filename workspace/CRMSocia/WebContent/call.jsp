<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" href="css/prism.css">
<link rel="stylesheet" href="css/chosen.css">

<h4>LLAMADAS</h4>


<div id="form1">
<div class="form-group">
		<label for="lastName">Seleccione Tipo de Cliente:</label>
</div>
<input type="button" class="btn btn-primary" id="btnConSelect" name="btnConSelect" value="Existente" onclick="pintar(1);">
<input type="button" class="btn btn-primary" id="btnSinSelect" name="btnSinSelect" value="Nuevo" onclick="pintar(0);">
</div>

<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/script.js"></script>