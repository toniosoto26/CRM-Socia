function selectVendor(){
	$.ajax({
		type:"post",
		url:"/CRMSocia/ControllerVendor",
		data: {"option":1},
		success: function(response){
			$("#selectVendor").html(response);
			$(".chosen-select").chosen();
		},
		error: function(){
			alertify.alert("no funciona");
		}
	})
}

function selectYear(){
	var today = new Date();
	var contenido = '<select data-placeholder="Selecciona el año" id="anio" class="chosen-select" tabindex="-1" name="anio" onchange="" style="width: 50%; display: none;">'+
						'<option value="0">--Selecciona el año--</option>';
	
	for(var i=today.getFullYear()-5; i < today.getFullYear()+15; i++){
		contenido += '<option value="'+i+'"'+(today.getFullYear()==i?'selected':'')+'>'+i+'</option>';
	}
	
	contenido+='</select>';
	
	
	$("#mes").val(today.getMonth()+1);
	$("#selectYear").html(contenido);
}