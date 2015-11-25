package kr.pe.tippingpoint.service;

import java.util.Map;

import kr.pe.tippingpoint.vo.TpProject;

public interface TpAdministratorService {
	
	public Map adminAllListTpProject(int pageNo);
	
	public TpProject adminFindTpProjectById(String tppId);
	
	public void adminProjectUp(TpProject adminProject);
	
	

	////////////////////////////첫번째 수정 //////////////////////////
	public Map adminCategoryProject(int pageNo, String check);
}
