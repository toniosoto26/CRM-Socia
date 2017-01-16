<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<div class="titulo"><h3>Indicadores</h3></div>

<div class="row">
	<div id="primaryPanel" class="col-sm-12 col-md-12">
		<div class="text-center">
			<label>Seleccione el rango:</label><div class="week-picker" style="margin: 0 auto;width: 240px;"></div>
		</div>
		<br /><br />
		<div class="text-center">
			<label>Semana:</label> <input type="text" id="startDate" readonly/> - <input type="text" id="endDate" readonly/>
		</div>
		<input type="button" class="btn btn-primary" value="Generar" onclick="loadIndicator();">
		<div id="indicators">
		</div>
	</div>
	<div id="secondaryPanel">
	</div>
</div>
	
<script>
	$(function() {
	    var startDate;
	    var endDate;
	    
	    var selectCurrentWeek = function() {
		   	window.setTimeout(function () {
		    	$('.week-picker').find('.ui-datepicker-current-day a').addClass('ui-state-active')
		    }, 1);
	    }
	    
		var today =new Date();
	    startDate = new Date(today.getFullYear(), today.getMonth(), today.getDate() - today.getDay() +1);
	    endDate = new Date(today.getFullYear(), today.getMonth(), today.getDate() - today.getDay() +7);
	    $('#startDate').val(startDate.getFullYear()+"-"+(startDate.getMonth()+1<10 ? "0"+(startDate.getMonth()+1) : (startDate.getMonth()+1))+"-"+(startDate.getDate()<10 ? "0"+startDate.getDate() : startDate.getDate()));
	    $('#endDate').val(endDate.getFullYear()+"-"+(endDate.getMonth()+1<10 ? "0"+(endDate.getMonth()+1) : (endDate.getMonth()+1))+"-"+(endDate.getDate()<10 ? "0"+endDate.getDate() : endDate.getDate()));
	    selectCurrentWeek();
	    
	    $('.week-picker').datepicker( {
	    	dateFormat:'yy-mm-dd',
	        showOtherMonths: true,
	        selectOtherMonths: true,
	        onSelect: function(dateText, inst) { 
	            var date = $(this).datepicker('getDate');
	            startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() +1);
	            endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() +7);
	            var dateFormat = inst.settings.dateFormat || $.datepicker._defaults.dateFormat;
	            $('#startDate').val($.datepicker.formatDate( dateFormat, startDate, inst.settings ));
	            $('#endDate').val($.datepicker.formatDate( dateFormat, endDate, inst.settings ));
	            selectCurrentWeek();
	        },
	        beforeShowDay: function(date) {
	            var cssClass = '';
	            if(date >= startDate && date <= endDate)
	                cssClass = 'ui-datepicker-current-day';
	            return [true, cssClass];
	        },
	        onChangeMonthYear: function(year, month, inst) {
	            selectCurrentWeek();
	        }
	    });
	    
	    $('.week-picker .ui-datepicker-calendar').on('mousemove', 'tr', function() { $(this).find('td a').addClass('ui-state-hover'); });
	    $('.week-picker .ui-datepicker-calendar').on('mouseleave', 'tr', function() { $(this).find('td a').removeClass('ui-state-hover'); });
	
	});
</script>	
<script type="text/javascript" src="js/indicators/indicator.js"></script>