package com.socia.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.socia.DAO.BlDetailsDAO;
import com.socia.DAO.BrandDAO;
import com.socia.DAO.BusinessLineDAO;
import com.socia.DAO.ClientDAO;
import com.socia.DAO.ContactDAO;
import com.socia.DAO.DiagnosisDAO;
import com.socia.DTO.BlDetailsDTO;
import com.socia.DTO.BrandDTO;
import com.socia.DTO.BusinessLineDTO;
import com.socia.DTO.ClientDTO;
import com.socia.DTO.ContactDTO;
import com.socia.DTO.DiagnosisDTO;
import com.socia.DTO.LoginDTO;
import com.socia.conexion.Conexion;

/**
 * Servlet implementation class ControllerDiagnosis
 */
@WebServlet("/ControllerDiagnosis")
public class ControllerDiagnosis extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerDiagnosis() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession	session	=	request.getSession();
		int			opc		=	Integer.valueOf(request.getParameter("option"));
		
		DiagnosisDAO	diagDao		=	null;
		ClientDAO 		objClient 	= 	null;
		ClientDTO		client		=	null;
	
		
		String		url			=	"";
		String		typeD		=	"";
		int			clientId	=	0;	
		
		Connection	con			=	null;
		Conexion	conexion	=	new	Conexion();	
		switch(opc){
			case 1:
				typeD		=	request.getParameter("type").trim();
				objClient	=	new ClientDAO();
				
				url		=	"/views/diagnosis/responses/getClientS.jsp";
				ArrayList<ClientDTO> arrClient = new ArrayList<ClientDTO>(); 
				arrClient=objClient.getClientsDiag(typeD);
				
				session.removeAttribute("arrClient");
				session.setAttribute("arrClient", arrClient);
				
				session.removeAttribute("clientType");
				session.setAttribute("clientType", typeD);
				break;
			case 2:
				List<DiagnosisDTO>	lst		= 	null;
				List<ClientDTO>		lstC	=	null;
				List<ContactDTO>	lstCo	=	null;
				try{
					con			=	conexion.getConnection1();
					clientId	=	Integer.valueOf(request.getParameter("clientId"));
					lst			=	new	DiagnosisDAO().getLastUpdate(clientId, con);
					lstC		=	new	ClientDAO().getClientDetails(clientId, con);
					lstCo		=	new	ContactDAO().getDetailsPosition(clientId, con);
					
					
				}catch(Exception e){
					e.printStackTrace();
				}
				
				session.removeAttribute("lstLastUpdate");
				session.setAttribute("lstLastUpdate", lst);
				
				session.removeAttribute("lstDetailsClient");
				session.setAttribute("lstDetailsClient", lstC);
				
				session.removeAttribute("lstDetailsContact");
				session.setAttribute("lstDetailsContact", lstCo);
				url		=	"/views/diagnosis/responses/getDetailsDiagnosis.jsp";
				break;	
			case 3:
				BusinessLineDTO				businessLine	= null;
				BusinessLineDAO				objBusinessLine	= new BusinessLineDAO();
				BrandDAO					objBrand		= new BrandDAO();
				ArrayList<BusinessLineDTO>	arrBusinessLine	= new ArrayList<BusinessLineDTO>();
				BlDetailsDTO				blDetails 		= null;
				ArrayList<BrandDTO>			arrBrands		= new ArrayList<BrandDTO>();
				ArrayList<BlDetailsDTO>		arrBLDetails	= new ArrayList<BlDetailsDTO>();
				
				arrBusinessLine = objBusinessLine.getBusinessLines();
				
				session.removeAttribute("arrBusinessLine");
				if(arrBusinessLine.size() > 0)
					session.setAttribute("arrBusinessLine", arrBusinessLine);
				else
					session.setAttribute("arrBusinessLine", null);
				
				for(int i=0;i<arrBusinessLine.size();i++){
					businessLine = arrBusinessLine.get(i);
					
					blDetails = new BlDetailsDTO();
					blDetails.setBusinessLineId(businessLine.getBusinessLineId());
					
					arrBrands = objBrand.getBrandsByBL(businessLine.getBusinessLineId());
					blDetails.setBrandArray(arrBrands);
					
					arrBLDetails.add(blDetails);
				}
				
				session.removeAttribute("arrBLDetails");
				if(arrBLDetails.size() > 0)
					session.setAttribute("arrBLDetails", arrBLDetails);
				else
					session.setAttribute("arrBLDetails", null);
				
				url = "views/diagnosis/responses/businessLineDetails.jsp";
				break;
		}
		try{
			if(con != null)
				con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	
		
	}
	 

}
