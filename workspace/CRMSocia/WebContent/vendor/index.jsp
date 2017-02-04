<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Grupo Socia CRM</title>
		
		<link rel="stylesheet" type="text/css" href="/CRMSocia/css/bootstrap_new.css">
		<link rel="stylesheet" type="text/css" href="/CRMSocia/css/alerts/alertify.core.css">
		<link rel="stylesheet" type="text/css" href="/CRMSocia/css/alerts/alertify.default.css">
		<link rel="stylesheet" type="text/css" href="/CRMSocia/css/alerts/alertify.bootstrap.css">
		<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
		<link rel="stylesheet" href="/CRMSocia/css/prism.css">
		<link rel="stylesheet" href="/CRMSocia/css/chosen.css">	
		<link rel="stylesheet" href="/CRMSocia/css/jquery.dataTables.css">	
		
		<style>
			.spacer{
			    background-color:#f2f2f2;
			    border-top:none !important;
			    border-bottom:none !important;
			}
			
			body  table{
				font-size: 10px;
			}
		</style>
	</head>
	<body>
		
		
				<nav class="navbar navbar-default">
				  <div class="container-fluid">
				    <!-- Brand and toggle get grouped for better mobile display -->
				    <div class="navbar-header">
				      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
				      <a class="navbar-brand" href="#">
				          <img src="/CRMSocia/images/grupo-socia.png" width="200" height="33" alt=""/></a>
				    </div>
				
				    <!-- Collect the nav links, forms, and other content for toggling -->
				    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				      <ul class="nav navbar-nav navbar-right">
				        <li onClick="loadMenu('call', this);"><a href="#">LLAMADAS</a></li>
				        <li onClick="loadMenu('appointment', this);"><a href="#">CITAS</a></li>
				        <li onClick="loadMenu('quotation', this);"><a href="#">COTIZACIONES</a></li>
				        <li onClick="loadMenu('calendar', this);"><a href="#">CALENDARIO</a></li>
				        <!-- li onClick="loadMenu('callLog', this);"><a href="#">INDICADORES</a></li -->
				        <li onClick="loadMenu('indicators', this);"><a href="#">INDICADORES</a></li>
				        <li><a href="ControllerLogin?cerrarSesion=T"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>  CERRAR SESIÓN</a></li>
				      </ul>
				    </div><!-- /.navbar-collapse -->
				  </div><!-- /.container-fluid -->
				</nav>
			
		
		<div class="contenido" >
		    	<div class="row">
			    	<div class="col-sm-12 col-md-12">
						<div class="form-group">
					 		<label class="col-sm-2 col-md-2">Proveedor </label>
							<div id="selectVendor"> </div>
						</div>
						<br />
					 	<div class="form-group">
				            <label class="col-sm-2 col-md-2" >Tipo de reporte</label>
			                <div class="input-group">
			                    <div id="radioBtn" class="btn-group">
			                        <span class="btn btn-primary btn-sm active" data-toggle="tipo" data-value="1">Mensual</span>
			                        <span class="btn btn-default btn-sm notActive" data-toggle="tipo" data-value="0">Anual</span>
			                    </div>
			                    <input type="hidden" name="tipo" id="tipo" value="1" />
			                </div>
				       	</div>
				       	<br />
						<div class="form-group">
					 		<label class="col-sm-2 col-md-2">Año </label>
				       		<div id="selectYear"></div>
						</div>
						
						<br/>
				       	<div class="form-group" id="contenidoMes">
					 		<label class="col-sm-2 col-md-2">Mes </label>
					       	<select data-placeholder="Selecciona el mes" id="mes" class="chosen-select" tabindex="-1" name="mes" onchange="" style="width: 50%; display: none;">
								<option value="0">--Selecciona el mes--</option>
								<option value="1">Enero </option>
								<option value="2">Febrero </option>
								<option value="3">Marzo</option>
								<option value="4">Abril </option>
								<option value="5">Mayo </option>
								<option value="6">Junio</option>
								<option value="7">Julio </option>
								<option value="8">Agosto </option>
								<option value="9">Septiembre</option>
								<option value="10">Octubre </option>
								<option value="11">Noviembre </option>
								<option value=12">Diciembre</option>
							</select>
						</div>
					</div>
				</div>
		</div>
		<table id="example" class="display" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th>First name</th>
	                <th>Last name</th>
	                <td>&nbsp;</td>
	                <th>Position</th>
	                <th>Office</th>
	                <th>&nbsp;</th>
	                <th>Age</th>
	                <th>Start date</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td>Brenden</td>
	                <td>Wagner</td>
	                <td>&nbsp;</td>
	                <td>Software Engineer</td>
	                <td>San Francisco</td>
	                <td>&nbsp;</td>
	                <td>28</td>
	                <td>2011/06/07</td>
	            </tr>
	            <tr>
	                <td>Fiona</td>
	                <td>Green</td>
	                <td>&nbsp;</td>
	                <td>Chief Operating Officer (COO)</td>
	                <td>San Francisco</td>
	                <td>&nbsp;</td>
	                <td>48</td>
	                <td>2010/03/11</td>
	            </tr>
	            <tr>
	                <td>Shou</td>
	                <td>Itou</td>
	                <td>&nbsp;</td>
	                <td>Regional Marketing</td>
	                <td>Tokyo</td>
	                <td>&nbsp;</td>
	                <td>20</td>
	                <td>2011/08/14</td>
	            </tr>
	            <tr>
	                <td>Michelle</td>
	                <td>House</td>
	                <td>&nbsp;</td>
	                <td>Integration Specialist</td>
	                <td>Sidney</td>
	                <td>&nbsp;</td>
	                <td>37</td>
	                <td>2011/06/02</td>
	            </tr>
	            <tr>
	                <td>Suki</td>
	                <td>Burks</td>
	                <td>&nbsp;</td>
	                <td>Developer</td>
	                <td>London</td>
	                <td>&nbsp;</td>
	                <td>53</td>
	                <td>2009/10/22</td>
	            </tr>
	            <tr>
	                <td>Prescott</td>
	                <td>Bartlett</td>
	                <td>&nbsp;</td>
	                <td>Technical Author</td>
	                <td>London</td>
	                <td>&nbsp;</td>
	                <td>27</td>
	                <td>2011/05/07</td>
	            </tr>
	            <tr>
	                <td>Gavin</td>
	                <td>Cortez</td>
	                <td>&nbsp;</td>
	                <td>Team Leader</td>
	                <td>San Francisco</td>
	                <td>&nbsp;</td>
	                <td>22</td>
	                <td>2008/10/26</td>
	            </tr>
	            <tr>
	                <td>Martena</td>
	                <td>Mccray</td>
	                <td>&nbsp;</td>
	                <td>Post-Sales support</td>
	                <td>Edinburgh</td>
	                <td>&nbsp;</td>
	                <td>46</td>
	                <td>2011/03/09</td>
	            </tr>
	            <tr>
	                <td>Unity</td>
	                <td>Butler</td>
	                <td>&nbsp;</td>
	                <td>Marketing Designer</td>
	                <td>San Francisco</td>
	                <td>&nbsp;</td>
	                <td>47</td>
	                <td>2009/12/09</td>
	            </tr>
	            <tr>
	                <td>Howard</td>
	                <td>Hatfield</td>
	                <td>&nbsp;</td>
	                <td>Office Manager</td>
	                <td>San Francisco</td>
	                <td>&nbsp;</td>
	                <td>51</td>
	                <td>2008/12/16</td>
	            </tr>
	            <tr>
	                <td>Hope</td>
	                <td>Fuentes</td>
	                <td>&nbsp;</td>
	                <td>Secretary</td>
	                <td>San Francisco</td>
	                <td>&nbsp;</td>
	                <td>41</td>
	                <td>2010/02/12</td>
	            </tr>
	            <tr>
	                <td>Vivian</td>
	                <td>Harrell</td>
	                <td>&nbsp;</td>
	                <td>Financial Controller</td>
	                <td>San Francisco</td>
	                <td>&nbsp;</td>
	                <td>62</td>
	                <td>2009/02/14</td>
	            </tr>
	            <tr>
	                <td>Timothy</td>
	                <td>Mooney</td>
	                <td>&nbsp;</td>
	                <td>Office Manager</td>
	                <td>London</td>
	                <td>&nbsp;</td>
	                <td>37</td>
	                <td>2008/12/11</td>
	            </tr>
	            <tr>
	                <td>Jackson</td>
	                <td>Bradshaw</td>
	                <td>&nbsp;</td>
	                <td>Director</td>
	                <td>New York</td>
	                <td>&nbsp;</td>
	                <td>65</td>
	                <td>2008/09/26</td>
	            </tr>
	            <tr>
	                <td>Olivia</td>
	                <td>Liang</td>
	                <td>&nbsp;</td>
	                <td>Support Engineer</td>
	                <td>Singapore</td>
	                <td>&nbsp;</td>
	                <td>64</td>
	                <td>2011/02/03</td>
	            </tr>
	            <tr>
	                <td>Bruno</td>
	                <td>Nash</td>
	                <td>&nbsp;</td>
	                <td>Software Engineer</td>
	                <td>London</td>
	                <td>&nbsp;</td>
	                <td>38</td>
	                <td>2011/05/03</td>
	            </tr>
	            <tr>
	                <td>Sakura</td>
	                <td>Yamamoto</td>
	                <td>&nbsp;</td>
	                <td>Support Engineer</td>
	                <td>Tokyo</td>
	                <td>&nbsp;</td>
	                <td>37</td>
	                <td>2009/08/19</td>
	            </tr>
	            <tr>
	                <td>Thor</td>
	                <td>Walton</td>
	                <td>&nbsp;</td>
	                <td>Developer</td>
	                <td>New York</td>
	                <td>&nbsp;</td>
	                <td>61</td>
	                <td>2013/08/11</td>
	            </tr>
	            <tr>
	                <td>Finn</td>
	                <td>Camacho</td>
	                <td>&nbsp;</td>
	                <td>Support Engineer</td>
	                <td>San Francisco</td>
	                <td>&nbsp;</td>
	                <td>47</td>
	                <td>2009/07/07</td>
	            </tr>
	            <tr>
	                <td>Serge</td>
	                <td>Baldwin</td>
	                <td>&nbsp;</td>
	                <td>Data Coordinator</td>
	                <td>Singapore</td>
	                <td>&nbsp;</td>
	                <td>64</td>
	                <td>2012/04/09</td>
	            </tr>
	            <tr>
	                <td>Zenaida</td>
	                <td>Frank</td>
	                <td>&nbsp;</td>
	                <td>Software Engineer</td>
	                <td>New York</td>
	                <td>&nbsp;</td>
	                <td>63</td>
	                <td>2010/01/04</td>
	            </tr>
	            <tr>
	                <td>Zorita</td>
	                <td>Serrano</td>
	                <td>&nbsp;</td>
	                <td>Software Engineer</td>
	                <td>San Francisco</td>
	                <td>&nbsp;</td>
	                <td>56</td>
	                <td>2012/06/01</td>
	            </tr>
	            <tr>
	                <td>Jennifer</td>
	                <td>Acosta</td>
	                <td>&nbsp;</td>
	                <td>Junior Javascript Developer</td>
	                <td>Edinburgh</td>
	                <td>&nbsp;</td>
	                <td>43</td>
	                <td>2013/02/01</td>
	            </tr>
	            <tr>
	                <td>Cara</td>
	                <td>Stevens</td>
	                <td>&nbsp;</td>
	                <td>Sales Assistant</td>
	                <td>New York</td>
	                <td>&nbsp;</td>
	                <td>46</td>
	                <td>2011/12/06</td>
	            </tr>
	            <tr>
	                <td>Hermione</td>
	                <td>Butler</td>
	                <td>&nbsp;</td>
	                <td>Regional Director</td>
	                <td>London</td>
	                <td>&nbsp;</td>
	                <td>47</td>
	                <td>2011/03/21</td>
	            </tr>
	            <tr>
	                <td>Lael</td>
	                <td>Greer</td>
	                <td>&nbsp;</td>
	                <td>Systems Administrator</td>
	                <td>London</td>
	                <td>&nbsp;</td>
	                <td>21</td>
	                <td>2009/02/27</td>
	            </tr>
	            <tr>
	                <td>Jonas</td>
	                <td>Alexander</td>
	                <td>&nbsp;</td>
	                <td>Developer</td>
	                <td>San Francisco</td>
	                <td>&nbsp;</td>
	                <td>30</td>
	                <td>2010/07/14</td>
	            </tr>
	            <tr>
	                <td>Shad</td>
	                <td>Decker</td>
	                <td>&nbsp;</td>
	                <td>Regional Director</td>
	                <td>Edinburgh</td>
	                <td>&nbsp;</td>
	                <td>51</td>
	                <td>2008/11/13</td>
	            </tr>
	            <tr>
	                <td>Michael</td>
	                <td>Bruce</td>
	                <td>&nbsp;</td>
	                <td>Javascript Developer</td>
	                <td>Singapore</td>
	                <td>&nbsp;</td>
	                <td>29</td>
	                <td>2011/06/27</td>
	            </tr>
	            <tr>
	                <td>Donna</td>
	                <td>Snider</td>
	                <td>&nbsp;</td>
	                <td>Customer Support</td>
	                <td>New York</td>
	                <td>&nbsp;</td>
	                <td>27</td>
	                <td>2011/01/25</td>
	            </tr>
	        </tbody>
	    </table>
	    
	    
		
		<script src="/CRMSocia/js/jquery.min.js" type="text/javascript"></script>
		<script src="/CRMSocia/js/bootstrap.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="/CRMSocia/js/vendor/vendor.js"></script>
		<script type="text/javascript" src="/CRMSocia/js/alerts/alertify.js"></script>
		<script src="/CRMSocia/js/chosen.jquery.js" type="text/javascript"></script>
		<script src="/CRMSocia/js/prism.js" type="text/javascript" charset="utf-8"></script>
		<script src="/CRMSocia/js/jquery.dataTables.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript"> 
			$(document).ready(function(){
				selectVendor();
				selectYear();
				
				$('#radioBtn span').on('click', function(){
			        var sel = $(this).data('value');
			        var tog = $(this).data('toggle');
			        $('#'+tog).val(sel);
			        
			        if(sel == 1)
			        	$('#contenidoMes').css('display', 'block');
			        else
			        	$('#contenidoMes').css('display', 'none');
			        
			        // You can change these lines to change classes (Ex. btn-default to btn-danger)
			        $('span[data-toggle="'+tog+'"]').not('[data-value="'+sel+'"]').removeClass('active btn-primary').addClass('notActive btn-default');
			        $('span[data-toggle="'+tog+'"][data-value="'+sel+'"]').removeClass('notActive btn-default').addClass('active btn-primary');
			    });
				
				var table = $('#example').DataTable({
					        "columnDefs":[
					            {"sortable":false, "class":"spacer", "targets": 2},

					            {"sortable":false, "class":"spacer", "targets": 5}
					    ]
					});
			
			});
		</script>
	
	</body>
</html>