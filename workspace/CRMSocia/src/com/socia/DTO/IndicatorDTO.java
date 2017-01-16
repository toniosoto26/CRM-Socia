package com.socia.DTO;

public class IndicatorDTO {

	private	DateDTO				date;
	private IndicatorDetailDTO 	indicatorAct;
	private IndicatorDetailDTO 	indicatorPro;
	
	public IndicatorDTO(DateDTO date, IndicatorDetailDTO indicatorAct,
			IndicatorDetailDTO indicatorPro) {
		super();
		this.date = date;
		this.indicatorAct = indicatorAct;
		this.indicatorPro = indicatorPro;
	}

	public DateDTO getDate() {
		return date;
	}
	public void setDate(DateDTO date) {
		this.date = date;
	}
	public IndicatorDetailDTO getIndicatorAct() {
		return indicatorAct;
	}
	public void setIndicatorAct(IndicatorDetailDTO indicatorAct) {
		this.indicatorAct = indicatorAct;
	}
	public IndicatorDetailDTO getIndicatorPro() {
		return indicatorPro;
	}
	public void setIndicatorPro(IndicatorDetailDTO indicatorPro) {
		this.indicatorPro = indicatorPro;
	}

	@Override
	public String toString() {
		return "IndicatorDTO [date=" + date + ", indicatorAct=" + indicatorAct
				+ ", indicatorPro=" + indicatorPro + "]";
	}
	
}
