<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	<ol class="breadcrumb">
      <li><a href="#">Inicio</a></li>
      <li><a href="#">Cotizaciones</a></li>
      <li class="active">Formato de Diagnóstico</li>
    </ol>
    
    <div class="titulo"><h3>Formato de Diagnóstico Cliente Corporativo</h3></div>
        <form>
           	<div class="row top">
            	<div class="col-sm-6 col-md-6">
                  <div class="form-group">
                  	<label class="col-sm-12 col-md-6">Fecha última actualización</label>
                    <input type="text" class="col-sm-12 col-md-6 form-control" placeholder="06-oct-16">
                  </div>
                  </div>
                  <div class="col-sm-6 col-md-6">
                  	<div class="form-group">
                  	<label class="col-sm-12 col-md-6">Persona que levantó info</label>
                    <select class="col-sm-12 col-md-6 form-control">
                      <option>Ricardo Camacho</option>
                    </select>
              	  </div>
                  <div class="form-group">
                  	<label class="col-sm-12 col-md-6">Tipo de cliente</label>
                    <select class="col-sm-12 col-md-6 form-control">
                      <option>Nuevo</option>
                    </select>
              	  </div>
                  </div>
               </div>
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
            <div class="requisitos">
            	<h5>Requisitos de alta como proveedor</h5>
                <div class="row alta">
                	<div class="col-sm-6 col-md-4">
                        <label class="checkbox">
                          <input type="checkbox"> Acta constitutiva / poderes
                        </label>
                        <label class="checkbox">
                          <input type="checkbox"> RFC
                        </label>
                        <label class="checkbox">
                          <input type="checkbox"> R1
                        </label>
                        <label class="checkbox">
                          <input type="checkbox"> Comprobante de domicilio
                        </label>
                     </div>
                    <div class="col-sm-6 col-md-4">
                    	<label class="checkbox">
                          <input type="checkbox"> Estados financieros
                        </label>
                        <label class="checkbox">
                          <input type="checkbox"> Formato especial (cliente)
                        </label>
                        <label class="checkbox">
                          <input type="checkbox"> ID representante legal
                        </label>
                        <label class="checkbox">
                          <input type="checkbox"> Carátula cuenta (banco)
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
                  <table class="table table-bordered table-striped">
                    <thead>
                    	<th>Nombre</th>
                        <th>Cargo</th>
                        <th>Teléfono</th>
                        <th>Celular</th>
                        <th>Correo</th>
                        <th>Observaciones</th>
                    </thead>
                    <tbody class="cuerpo-tabla">
                    	<tr>
                        	<td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris" placeholder="Director Sistemas"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                        </tr>
                        <tr>
                        	<td><input type="text" class="campo-tabla"></td>
                            <td><input type="text" class="campo-tabla" placeholder="Director Compras"></td>
                            <td><input type="text" class="campo-tabla"></td>
                            <td><input type="text" class="campo-tabla"></td>
                            <td><input type="text" class="campo-tabla"></td>
                            <td><input type="text" class="campo-tabla"></td>
                        </tr>
                        <tr>
                        	<td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris" placeholder="Director de Finanzas"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                        </tr>
                        <tr>
                        	<td><input type="text" class="campo-tabla"></td>
                            <td><input type="text" class="campo-tabla" placeholder="Director Operaciones"></td>
                            <td><input type="text" class="campo-tabla"></td>
                            <td><input type="text" class="campo-tabla"></td>
                            <td><input type="text" class="campo-tabla"></td>
                            <td><input type="text" class="campo-tabla"></td>
                        </tr>
                        <tr>
                        	<td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris" placeholder="Contacto de CXP"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                            <td><input type="text" class="campo-tabla-gris"></td>
                        </tr>
                    </tbody>
                  </table>
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