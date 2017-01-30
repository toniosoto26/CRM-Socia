<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<ol class="breadcrumb">
  <li><a href="#">Inicio</a></li>
  <li><a href="#">Cotizaciones</a></li>
  <li class="active">Formato de Diagnóstico</li>
</ol>

<c:choose>
	<c:when test="${not empty sessionScope.lstLastUpdate}">
		<div class="row top">
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<label class="col-sm-12 col-md-6">Fecha última actualización</label>
					<input type="text" class="col-sm-12 col-md-6 form-control" placeholder="<c:out value="${lstLastUpdate.dateUpdate}"></c:out>" disabled>
				</div>
			</div>
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<label class="col-sm-12 col-md-6">Persona que levantó info</label>
					<input type="text" class="col-sm-12 col-md-6 form-control" placeholder="<c:out value="${lstLastUpdate.name}"></c:out>" disabled>
				</div>
				<div class="form-group">
					<label class="col-sm-12 col-md-6">Tipo de cliente</label>
					<input type="text" class="col-sm-12 col-md-6 form-control" placeholder="<c:out value="${lstLastUpdate.clientType}"></c:out>" disabled>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="row top">
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<label class="col-sm-12 col-md-6">Fecha última actualización</label>
					<input type="text" class="col-sm-12 col-md-6 form-control" placeholder="Sin registro aun" disabled>
				</div>
			</div>
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<label class="col-sm-12 col-md-6">Persona que levantó info</label>
					<input type="text" class="col-sm-12 col-md-6 form-control" placeholder="Sin registro aun" disabled>
				</div>
				<div class="form-group">
					<label class="col-sm-12 col-md-6">Tipo de cliente</label>
					<input type="text" class="col-sm-12 col-md-6 form-control" placeholder="Sin registro aun" disabled>
				</div>
			</div>
		</div>
	
	</c:otherwise>
</c:choose>
<c:choose>	
	<c:when test="${not empty sessionScope.lstDetailsClient}">
		<div class="row">
	  		<div class="col-sm-6 col-md-6">
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">Empresa (cliente)</label>
                 <input type="text" class="col-md-6 form-control" placeholder="<c:out value="${lstlstDetailsClientLastUpdate.companyName}"></c:out>" disabled>
               </div>
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">Dirección</label>
                 <input type="text" class="col-md-6 form-control" placeholder="<c:out value="${lstlstDetailsClientLastUpdate.street}"></c:out>" disabled>
               </div>
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">Tel. conmutador</label>
                 <input type="text" class="col-md-6 form-control" placeholder="<c:out value="${lstlstDetailsClientLastUpdate.phone}"></c:out>" disabled>
               </div>
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">No. sucursales</label>
                 <input type="text" class="col-md-6 form-control" placeholder="Sin valor">
               </div>
             </div>
             <div class="col-sm-6 col-md-6">
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">Giro</label>
                 <input type="text" class="col-md-6 form-control" placeholder="<c:out value="${lstlstDetailsClientLastUpdate.bussinesTurn}"></c:out>" disabled>
               </div>
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">No. empleados</label>
                 <input type="text" class="col-md-6 form-control" placeholder="<c:out value="${lstlstDetailsClientLastUpdate.employees}"></c:out>" disabled>
               </div>
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">Compas anuales</label>
                 <input type="text" class="col-md-6 form-control" placeholder="<c:out value="${lstlstDetailsClientLastUpdate.annualSales}"></c:out>" disabled>
               </div>
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">Sitio web</label>
                 <input type="text" class="col-md-6 form-control" placeholder="<c:out value="${lstlstDetailsClientLastUpdate.webSite}"></c:out>" disabled>
               </div>
           </div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="row">
           	<div class="col-sm-6 col-md-6">
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">Empresa (cliente)</label>
                 <input type="text" class="col-md-6 form-control">
               </div>
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">Dirección</label>
                 <input type="text" class="col-md-6 form-control">
               </div>
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">Tel. conmutador</label>
                 <input type="text" class="col-md-6 form-control">
               </div>
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">No. sucursales</label>
                 <input type="text" class="col-md-6 form-control">
               </div>
             </div>
             <div class="col-sm-6 col-md-6">
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">Giro</label>
                 <input type="text" class="col-md-6 form-control">
               </div>
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">No. empleados</label>
                 <input type="text" class="col-md-6 form-control">
               </div>
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">Compas anuales</label>
                 <input type="text" class="col-md-6 form-control">
               </div>
               <div class="form-group">
               	<label class="col-sm-6 col-md-6">Sitio web</label>
                 <input type="text" class="col-md-6 form-control">
               </div>
           </div>
         </div>
	</c:otherwise>

</c:choose>

<form>
		<div class="requisitos">
	       	<h5>Requisitos de alta como proveedor</h5>
	           <div class="row alta">
	           	<div class="col-sm-6 col-md-4">
	                   <label class="checkbox">
	                     Acta constitutiva / poderes <input type="file">
	                   </label>
	                   <label class="checkbox">
	                     RFC<input type="file">
	                   </label>
	                   <label class="checkbox">
	                    R1<input type="file"> R1
	                   </label>
	                   <label class="checkbox">
	                     Comprobante de domicilio<input type="file"> 
	                   </label>
	                </div>
	               <div class="col-sm-6 col-md-4">
	               	<label class="checkbox">
	                      Estados financieros<input type="file">
	                   </label>
	                   <label class="checkbox">
	                      Formato especial (cliente)<input type="file">
	                   </label>
	                   <label class="checkbox">
	                    ID representante legal<input type="file"> 
	                   </label>
	                   <label class="checkbox">
	                    Carátula cuenta (banco)<input type="file"> 
	                   </label>
	               </div>
	               <div class="col-sm-6 col-md-4">
	                 <label>Otros  </label>
	               	<input type="text" class="form-control">
	               </div>
	           </div>
	       </div>
    <div class="contactos">
	 	<h5>Contactos clave</h5>
	 	<div class="table-responsive">
			<c:choose>
				<c:when test="${not empty sessionScope.lstDetailsContact}">
			 
			 		<c:forEach items="${sessionScope.lstDetailsContact}" var="lst">
			 			<table class="table table-bordered table-striped">
			 				<tr>
			 					<td><h4><c:out value="${lst.name_division}"></c:out></h4></td>
			 				</tr>
			 			</table>
			 			<table class="table table-bordered table-striped">
			 				<thead>
		                    	<th>Puesto</th>
		                        <th>Nombre</th>
		                        <th>Email</th>
		                        <th>Tel&eacute;fono</th>
		                        <th>Celular</th>
		                        <th>Fecha Nacimiento</th>
		                    </thead>
		                    <tbody class="cuerpo-tabla">
		                    	<tr>
		                        	<td><c:out value="${lst.position}"></c:out></td>
		                            <td><c:out value="${lst.firstName}"></c:out></td>
		                            <td><c:out value="${lst.email}"></c:out></td>
		                            <td><c:out value="${lst.phone}"></c:out></td>
		                            <td><c:out value="${lst.cellPhone}"></c:out></td>
		                            <td><c:out value="${lst.birthday}"></c:out></td>
		                        </tr>
		                    </tbody>
			 			</table>
			 		</c:forEach>
			 	
				</c:when>
				<c:otherwise>
					<table class="table table-bordered table-striped">
		 				<thead>
	                    	<th>Puesto</th>
	                        <th>Nombre</th>
	                        <th>Email</th>
	                        <th>Tel&eacute;fono</th>
	                        <th>Celular</th>
	                        <th>Fecha Nacimiento</th>
	                    </thead>
	                    <tbody class="cuerpo-tabla">
	                    	<tr>
	                        	<td></td>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                        </tr>
	                    </tbody>
		 			</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	 <div class="requisitos">
            	<h5>INFORMACIÓN REQUERIDA COMO LÍNEA DE NEGOCIO</h5>
                <div class="table-responsive">
                	<table class="table table-bordered">
                    	<thead class="tabla-grande">
                    		<th></th>
                            <th>Impresión e imagen</th>
                            <th>Papel</th>
                            <th>Cómputo</th>
                            <th>Servidores</th>
                            <th>Networking (switches, etc.)</th>
                            <th>Cómputo uso rudo</th>
                            <th>CCTV</th>
                            <th>Tabletas</th>
                            <th>Software</th>
                        </thead>
                        <tbody class="cuerpo-tabla-grande">
                        	<tr>
                        		<th class="tabla-grande" scope="row">Marca actual cliente</th>
                                <td><input type="text" class="campo-tabla-gris" placeholder="3"></td>
                                <td><input type="text" class="campo-tabla-gris" placeholder="Xérox Ecológico"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Modelo(s) de equipo(s)</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Tipo equipo</th>
                                <td><input type="text" class="campo-tabla-gris" placeholder="2"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Volumen base actual (unidades)</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris" placeholder="300 cajas"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande destacado" scope="row">PRECIO REFERENCIA</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris" placeholder="$395.00"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Proveedor actual</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris" placeholder="Cicovisa"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Cuenta con contrato de servicios administrados</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris" placeholder="N/A"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr class="azul">
                        		<th class="tabla-grande destacado" scope="row">Configuraciones especiales</th>
                                <td><input type="text" class="campo-tabla-azul" placeholder="Configuración de centro de costos en los equipos"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                        	</tr>
                            <tr class="azul">
                        		<th class="tabla-grande destacado" scope="row">Disperción de entregas</th>
                                <td><input type="text" class="campo-tabla-azul" placeholder="1"></td>
                                <td><input type="text" class="campo-tabla-azul" placeholder="Entrega a 89 sucursales"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Cuenta con arrendamiento</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris" placeholder="N/A"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Fecha de próximo concurso</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris" placeholder="Consumo mensual"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Concursa sus requerimientos</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Requiere equipo demo</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Se le ha hecho venta</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Ejecutivo de la marca que los atiende</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr class="azul">
                        		<th class="tabla-grande destacado" scope="row">Factor de gane detectado</th>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul" placeholder="Mejorar Precio y congelarlo por periodos de 3 meses"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Responsable toma de decisión de compra</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris" placeholder="Pedro Gómez"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Puesto</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris" placeholder="Jefe de Compras"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Tel / Cel</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris" placeholder="58968899"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Correo</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris" placeholder="pgomez@ejemplo.com.mx"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Requisitos o comentarios</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris" placeholder="Mandar cotizaciones los últimos 5 días de mes"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr>
                        		<th class="tabla-grande" scope="row">Próxima acción acordada con el cliente
</th>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris" placeholder="llevar resma demo y propuesta para 7/Sep/2015"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                                <td><input type="text" class="campo-tabla-gris"></td>
                        	</tr>
                            <tr class="azul">
                        		<th class="tabla-grande destacado" scope="row">Propuesta comercial (marca/precio/fecha)</th>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul" placeholder="Xerox Ecológico/$390/5 de septiembre"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                                <td><input type="text" class="campo-tabla-azul"></td>
                        	</tr>
                        </tbody>
                    </table>
                </div>
              </div>
              <div class="contactos">
            	<h5>COMPRAS RECURRENTES (RUN RATE)</h5>
            	<div class="row">
            		<div class="col-sm-5 col-md-4 lista">Consumibles <br>
Refacciones<br>
Monitores/pantallas/videoproyectores<br>
Accesorios<br>
Energía<br>
Otro</div>
				  <div class="col-sm-6 col-md-7">
  						<div class="table-responsive">
                  <table class="table table-bordered table-striped">
                    <thead>
                    	<th>Marca</th>
                        <th>Modelo</th>
                        <th>Cantidad compra</th>
                        <th>Recurrencia</th>
                    </thead>
                    <tbody class="cuerpo-tabla">
                    	<tr>
                        	<td><input type="text" class="campo-tabla-gris" placeholder="HP"></td>
                            <td><input type="text" class="campo-tabla-gris" placeholder="Q2612A"></td>
                            <td><input type="text" class="campo-tabla-gris" placeholder="500"></td>
                            <td><input type="text" class="campo-tabla-gris" placeholder="mensual"></td>
                        </tr>
                        <tr>
                        	<td><input type="text" class="campo-tabla"></td>
                            <td><input type="text" class="campo-tabla"></td>
                            <td><input type="text" class="campo-tabla"></td>
                            <td><input type="text" class="campo-tabla"></td>
                        </tr>
                        <tr>
                        	<td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                        </tr>
                        <tr>
                        	<td><input type="text" class="campo-tabla" placeholder="Microsoft teclados"></td>
                            <td><input type="text" class="campo-tabla" placeholder="Indistinta"></td>
                            <td><input type="text" class="campo-tabla" placeholder="150"></td>
                            <td><input type="text" class="campo-tabla" placeholder="bimestre"></td>
                        </tr>
                        <tr>
                        	<td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                        </tr>
                        <tr>
                        	<td colspan="4"><input type="text" class="campo-tabla" placeholder="estan por licitar concurso de reparacion de sucursales"></td>
                        </tr>
                    </tbody>
                  </table>
                </div>
  					</div>
            	</div>
			</div>
       <div class="requisitos">
            	<h5>PROBLEMÁTICAS DETECTADAS</h5>
         <div class="table-responsive">
                	<div class="centrado">
                	<table align="center" class="table table-bordered ">
                    <tbody class="cuerpo-tabla">
                    	<tr>
                        	<td>Cliente</td>
                            <td><input type="text" class="campo-tabla-gris" placeholder="(Problemática que tiene el cliente y necesita que se le resuelva puede ser externa o interna, es decir de su(s) proveedores o de sus procesos internos)"></td>
                        </tr>
                        <tr>
                        	<td>Socia</td>
                            <td><input type="text" class="campo-tabla-gris" placeholder="Problema que se observe que podemos toparnos con la cuenta y que necesitamos ver la forma de que no sea un obstáculo"></td>
                        </tr>
                        <tr>
                        	<td>Pareja de ventas</td>
                            <td><input type="text" class="campo-tabla-gris" placeholder="1"></td>
                        </tr>
                    </tbody>
                  </table>
                  </div>
		   		</div>
	   </div>
</form>