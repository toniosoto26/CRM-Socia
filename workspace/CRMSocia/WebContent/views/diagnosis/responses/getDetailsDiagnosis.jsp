<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<c:choose>
	<c:when test="${not empty sessionScope.lstLastUpdate}">
		<div class="row top">
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<label class="col-sm-12 col-md-6">Fecha �ltima actualizaci�n</label>
					<input type="text" class="col-sm-12 col-md-6 form-control" placeholder="<c:out value="${lstLastUpdate.dateUpdate}"></c:out>" disabled>
				</div>
			</div>
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<label class="col-sm-12 col-md-6">Persona que levant� info</label>
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
					<label class="col-sm-12 col-md-6">Fecha �ltima actualizaci�n</label>
					<input type="text" class="col-sm-12 col-md-6 form-control" placeholder="Sin registro a�n" disabled>
				</div>
			</div>
			<div class="col-sm-6 col-md-6">
				<div class="form-group">
					<label class="col-sm-12 col-md-6">Persona que levant� info</label>
					<input type="text" class="col-sm-12 col-md-6 form-control" placeholder="Sin registro a�n" disabled>
				</div>
				<div class="form-group">
					<label class="col-sm-12 col-md-6">Tipo de cliente</label>
					<input type="text" class="col-sm-12 col-md-6 form-control" placeholder="Sin registro a�n" disabled>
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
               	<label class="col-sm-6 col-md-6">Direcci�n</label>
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
               	<label class="col-sm-6 col-md-6">Direcci�n</label>
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
	                    Car�tula cuenta (banco)<input type="file"> 
	                   </label>
	               </div>
	               <div class="col-sm-6 col-md-4">
	                 <label>Otros� </label>
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
     	<h5>INFORMACI�N REQUERIDA COMO L�NEA DE NEGOCIO</h5>
     		
                <div class="table-responsive" id="blTable">
                	
                </div>
              </div>
              <div class="contactos">
            	<h5>COMPRAS RECURRENTES (RUN RATE)</h5>
            	<div class="row">
            		<div class="col-sm-5 col-md-4 lista">Consumibles <br>
Refacciones<br>
Monitores/pantallas/videoproyectores<br>
Accesorios<br>
Energ�a<br>
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
            	<h5>PROBLEM�TICAS DETECTADAS</h5>
         <div class="table-responsive">
                	<div class="centrado">
                	<table align="center" class="table table-bordered ">
                    <tbody class="cuerpo-tabla">
                    	<tr>
                        	<td>Cliente</td>
                            <td>
	                            <textarea class="campo-tabla-gris" placeholder="(Problem�tica que tiene el cliente y necesita que se le resuelva puede ser externa o interna, es decir de su(s) proveedores o de sus procesos internos)"><c:out value="${sessionScope.opportunities.comments}"></c:out></textarea>
                            </td>
                        </tr>
                        <tr>
                        	<td>Socia</td>
                            <td>
                            	<textarea class="campo-tabla-gris" placeholder="Problema que se observe que podemos toparnos con la cuenta y que necesitamos ver la forma de que no sea un obst�culo"><c:out value="${sessionScope.opportunities.nextStep}"></c:out></textarea>
                            </td>
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
	   
	   <div class="contactos">
		  	<div class="text-center">
				<button type="submit" class="btn btn-primary" onClick="return addDiagnosis(1);">Guardar</button>
		  	  </div>
		</div>
</form>