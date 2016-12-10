/**  Loading menus */
function loadMenu(menuName, option){
	$("li").removeClass("active");
	$(option).addClass("active");
	
	if(menuName === "call"){
		$("#pageContent").removeClass("welcome");
		$("#pageContent").load("call.jsp");
		$("#pageHeader").html('<ol class="breadcrumb">'+
				  '<li><a href="#">Inicio</a></li>'+
				  '<li class="active">Llamadas</li>'+
				'</ol>'+
				'<div id="openPanel" class="panel">'+
					'<small>Haz clic para abrir un panel secundario </small><button type="button" class="btn btn-default btn-sm" onclick="openSecondaryPanel(0,0);" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Segundo Panel</button>'+
				'</div>');
	}else if(menuName === "quotation"){
		$("#pageContent").removeClass("welcome");
		$("#pageContent").load("/CRMSocia/views/quotations/quotation.jsp");
		$("#pageHeader").html('<ol class="breadcrumb">'+
								  '<li><a href="#">Inicio</a></li>'+
								  '<li class="active">Cotizaciones</li>'+
								'</ol>'+
								'<div id="openPanel" class="panel">'+
									'<small>Haz clic para abrir un panel secundario </small><button type="button" class="btn btn-default btn-sm" onclick="openSecondaryPanel(0,1);" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Segundo Panel</button>'+
								'</div>');
	}else if(menuName === "calendar"){
		$("#pageContent").removeClass("welcome");
		$("#pageContent").load("/CRMSocia/views/calendar/calendar.jsp");
		$("#pageHeader").html('<ol class="breadcrumb">'+
				  '<li><a href="#">Inicio</a></li>'+
				  '<li class="active">Calendario</li>'+
				'</ol>'+
				'<div id="openPanel" class="panel">'+
					'<small>Haz clic para abrir un panel secundario </small><button type="button" class="btn btn-default btn-sm" onclick="openSecondaryPanel(0,2);" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Segundo Panel</button>'+
				'</div>');
	}else if(menuName === "appointment"){
		$("#pageContent").removeClass("welcome");
		$("#pageContent").load("/CRMSocia/views/appointments/generateAppointments.jsp");
		$("#pageHeader").html('<ol class="breadcrumb">'+
				  '<li><a href="#">Inicio</a></li>'+
				  '<li class="active">Citas</li>'+
				'</ol>'+
				'<div id="openPanel" class="panel">'+
					'<small>Haz clic para abrir un panel secundario </small><button type="button" class="btn btn-default btn-sm" onclick="openSecondaryPanel(0,3);" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Segundo Panel</button>'+
				'</div>');
	}else if(menuName === "diagnosis"){
		$("#pageContent").removeClass("welcome");
		$("#pageContent").load("/CRMSocia/views/diagnosis/diagnosis.jsp");
	}
}