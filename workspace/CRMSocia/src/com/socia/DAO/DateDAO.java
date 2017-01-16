package com.socia.DAO;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import com.socia.DTO.DateDTO;

public class DateDAO {

	public ArrayList<DateDTO> getDaysArray(Date startDate, Date endDate){
		ArrayList<DateDTO>	arrDate	= new ArrayList<DateDTO>();
		DateDTO				date 	= null;
		Calendar			start 	= Calendar.getInstance();
		Calendar			end 	= Calendar.getInstance();
		
		Calendar			temp = null;
		
		start.setTime(startDate);
		end.setTime(endDate);
		
		while(start.compareTo(end) < 0){
			if(start.get(Calendar.DAY_OF_WEEK) > 1 && start.get(Calendar.DAY_OF_WEEK) < 7){
				temp = (Calendar)start.clone();
				date = new DateDTO(getWeekDayName(start.get(Calendar.DAY_OF_WEEK)), temp);
				
				arrDate.add(date);
			}
			
			start.add(Calendar.DATE, 1);
		}
		
		return arrDate;
	}
	
	private String getWeekDayName(int weekDay){
		String	weekDayName = "";
		
		switch(weekDay){
			case 2: weekDayName= "Lunes";
					break;
			case 3: weekDayName= "Martes";
					break;
			case 4: weekDayName= "Miércoles";
					break;
			case 5: weekDayName= "Jueves";
					break;
			case 6: weekDayName= "Viernes";
					break;
		}
		
		return weekDayName;
	}
	
}
