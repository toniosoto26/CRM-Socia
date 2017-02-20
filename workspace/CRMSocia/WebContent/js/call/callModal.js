function modalCalls(options){
	 $("#myModal").modal();
	 
	if(options == 1){
		 $(".modal-body").html("Datos de Speech");
		 $(".modal-title").html("Speech");
		 
	}
	if(options == 2){
		$(".modal-body").html("Datos de Guia");
		 $(".modal-title").html("Guia");
	}
	if(options == 3){
		$(".modal-body").html("Datos de Manejo de objeciones");
		 $(".modal-title").html("Manejo de Objeciones");
	}
	if(options == 4){
		$(".modal-body").html("Datos de Líneas de Negocio");
		 $(".modal-title").html("Líneas de Negocio");
	}
   
   
}