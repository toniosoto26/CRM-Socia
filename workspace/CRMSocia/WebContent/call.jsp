<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" href="css/prism.css">
<link rel="stylesheet" href="css/chosen.css">

<ol class="breadcrumb">
  <li><a href="#">Inicio</a></li>
  <li class="active">Llamadas</li>
</ol>
<div class="panel">
	<small>Haz clic para abrir un panel secundario </small><button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Segundo Panel</button>
</div>

<div class="titulo"><h3>Llamadas</h3></div>    

<div id="form1">
	<div class="col-sm-6 col-md-6">
		<div class="form-group">
  			<label class="col-sm-6 col-md-6">Seleccione Tipo de Cliente :</label>
		</div>
		<input type="button" class="btn btn-primary" id="btnConSelect" name="btnConSelect" value="Existente" onclick="pintar(1);">
		<input type="button" class="btn btn-primary" id="btnSinSelect" name="btnSinSelect" value="Nuevo" onclick="pintar(0);">
	</div>
</div>

<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/script.js"></script>