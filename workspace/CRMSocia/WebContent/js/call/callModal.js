function modalCalls(options){
	 $("#myModal").modal();
	 
	if(options == 1){
		 $(".modal-body").html("Datos de Speech");
		 $(".modal-title").html("Speech");
		 
	}
	if(options == 2){
		$(".modal-title").html("Guia");
		$(".modal-body").html("Datos de Guia");
	}
	if(options == 3){
		$(".modal-title").html("Manejo de Objeciones - PRIME");
		$(".modal-body").html("<table class='table table-striped table-bordered table-hover'>" +
								"<thead>" +
									"<tr>" +
										"<th></th>" +
										"<th>Tipos de objeciones</th>" +
										"<th>Objeciones más comúnes</th>" +
										"<th>¿Qué se debe hacer?</th>" +
									"</tr>" +
								"</thead>" +
								"<tbody>" +
									"<tr>" +
										"<th>P</th>" +
										"<td><b>Objeciones Reales (R):</b>  pueden surgir cuando existe una desventaja dentro del producto, servicio u oferta.</td>" +
										"<td>" +
											"<ul>" +
												"<li>Llámame en unos meses…</li>" +
												"<li>No creo que sea el momento…</li>" +
												"<li>Voy a pensarlo…</li>" +
												"<li>No tengo tiempo…</li>" +
											"</ul>" +
										"</td>" +
										"<td>" +
											"<ul>" +
												"<li>¡Pregunta! Es momento de ver qué es lo que sucede.</li>" +
												"<li>Investiga si el presupuesto es muy alto para las necesidades de tu cliente o si no se llenaron las expectativas del cliente.</li>" +
												"<li>Preguntar si algo no quedó claro durante la presentación o si existe alguna duda de tu producto o servicio.</li>" +
											"</ul>" +
										"</td>" +
									"</tr>" +
									"<tr>" +
										"<th>R</th>" +
										"<td><b>Objeciones de Pretexto (P):</b> cuando se llega a postergar alguna decisión sin ningún motivo aparente, los clientes suelen dar negativas sin fundamento.</td>" +
										"<td>" +
											"<ul>" +
												"<li>Lo que me ofreces no es lo que necesita mi empresa.</li>" +
												"<li>Necesito un servicio más especializado.</li>" +
												"<li>Tus costos están por arriba de lo esperado.</li>" +
												"<li>No tienes capacidad para manejar lo que necesito.</li>" +
											"</ul>" +
										"</td>" +
										"<td>" +
											"<ul>" +
												"<li>Reconocer y aceptar los comentarios del cliente sin dar importancia de más.</li>" +
												"<li>No permitir que esto afecte tu autoestima o tu proceso de venta.</li>" +
												"<li>Minimiza desventajas, maximiza las fortalezas.</li>" +
											"</ul>" +
										"</td>" +
									"</tr>" +
									"<tr>" +
										"<th>I</th>" +
										"<td><b>Objeciones por Indiferencia (I):</b>cuando el cliente no quiere reconocer el valor de la propuesta que se le ha realizado. Estas objeciones suelen presentarse no por desinterés sino en dudas. </td>" +
										"<td>" +
											"<ul>" +
												"<li>No creo que sea lo que necesito…</li>" +
												"<li>¿Existe algo mejor?</li>" +
												"<li>Y si… </li>" +
												"<li>Pero es que…</li>" +
											"</ul>" +
										"</td>" +
										"<td>" +
											"<ul>" +
												"<li>Romper con la indiferencia.</li>" +
												"<li>Evita que la situación sea más grande, comienza a desentrañar las necesidades del cliente y analiza qué es lo que quiere.</li>" +
												"<li>" +
													"Puedes emplear frases como:<br/>" +
														"<i>Estará de acuerdo conmigo en que …</i>" +
														"<i>Le parece si…</i>" +
														"<i>Dado que…</i>" +
												"</li>" +
											"</ul>" +
										"</td>" +
									"</tr>" +
									"<tr>" +
										"<th>M</th>" +
										"<td><b>Objeciones por Malentendidos (M):</b> cuando no queda claro algún punto de nuestra presentación; el cliente puede malinterpretar algún punto que le haga dudar de nuestros servicios.</td>" +
										"<td>" +
											"<ul>" +
												"<li>Creo que no nos entendemos.</li>" +
												"<li>No comprendo cómo es que…</li>" +
												"<li>Me comentas que…, pero lo que ofreces es… </li>" +
												"<li>No entiendo que…</li>" +
											"</ul>" +
										"</td>" +
										"<td>" +
											"<ul>" +
												"<li>Reaccionar de manera rápida, evita dar rodeos sobre el tema y lanza una estrategia objetiva. </li>" +
												"<li>Aclarar el malentendido de manera sencilla y replantear la situación.</li>" +
												"<li>Evitar dar largas, sentido de urgencia: el tiempo es oro.</li>" +
											"</ul>" +
										"</td>" +
									"</tr>" +
									"<tr>" +
										"<th>E</th>" +
										"<td><b>Objeciones por Escepticismo (E):</b> cuando existe algún tipo de desconfianza por parte del cliente, no quiere decir que lo que ofrezcamos no sea lo que él necesita, sino que tenemos que reforzar nuestra estrategia de ventas.</td>" +
										"<td>" +
											"<ul>" +
												"<li>Voy a pensarlo…</li>" +
												"<li>Necesito corroborar algunos números…</li>" +
												"<li>Tengo que plantearlo con mi superior…</li>" +
												"<li>Tal vez en unos meses…</li>" +
											"</ul>" +
										"</td>" +
										"<td>" +
											"<ul>" +
												"<li>Potencializa tu propuesta.</li>" +
												"<li>Enseña resultados positivos de tu servicio, habla sobre tus clientes y comenta algunos casos de éxito, saca folletos, contratos, garantías, cotizaciones, etc.</li>" +
												"<li>Ser objetivos y contundentes.</li>" +
											"</ul>" +
										"</td>" +
									"</tr>" +
								"</tbody>" +
							"</table>");
	}
	if(options == 4){
		$(".modal-body").html("Datos de Líneas de Negocio");
		$(".modal-title").html("Líneas de Negocio");
	}
   
   
}