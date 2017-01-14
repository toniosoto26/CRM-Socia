<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <link rel="stylesheet" href="/CRMSocia/css/bootstrap-datetimepicker.css">
    <script type="text/javascript" src="/CRMSocia/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="/CRMSocia/js/bootstrap-datetimepicker.fr.js"></script>
	<script type="text/javascript" src="/CRMSocia/js/call/callLog.js"></script>
	<script type="text/javascript" src="/CRMSocia/js/script.js"></script>
    
    <link rel="stylesheet" href="/CRMSocia/css/jquery.dataTables.css">
    <script type="text/javascript" src="/CRMSocia/js/jquery.dataTables.js"></script>
    
         <div class="row">
              <div class="col-lg-12">
                   <h1 class="page-header">Indicador de Llamadas</h1>
              </div>
         	<div class="col-lg-4">
         			<div class="form-group">
						<label for="dtp_input2" class="col-md-4 control-label">Fecha Inicial: </label>
					    <div class="input-group date form_date col-md-8" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
					    	<input required class="form-control" size="16" type="text" value="" readonly>
					        <span  class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
					    </div>
						<input type="hidden" id="dtp_input2" value="" /><br/>
					</div>
         	</div>
         	<div class="col-lg-4">
         			<div class="form-group">
						<label for="dtp_input2" class="col-md-4 control-label">Fecha Final: </label>
					    <div class="input-group date form_date col-md-8" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
					    	<input required class="form-control" size="16" type="text" value="" readonly>
					        <span  class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
					    </div>
						<input type="hidden" id="dtp_input2" value="" /><br/>
					</div>
         	</div>
         	<div class="col-lg-4">
         		<button type="button" class="btn btn-primary btn-lg" onclick ="ValidaIndicadorLlamadas();">Muestra Llamadas</button>
         	</div>	
         </div>
         <br/><br/>
         <div id="alertaFecha">
         	
         </div>
         <div class="row">
         	<div class="col-lg-12" id="tablaLlamadas">

         		
         	</div>
         </div>