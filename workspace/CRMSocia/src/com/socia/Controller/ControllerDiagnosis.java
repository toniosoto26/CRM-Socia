package com.socia.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
 

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import lib.Cadena;

import com.socia.DAO.BlDetailsDAO;
import com.socia.DAO.BrandDAO;
import com.socia.DAO.BusinessLineDAO;
import com.socia.DAO.ClientDAO;
import com.socia.DAO.ContactDAO;
import com.socia.DAO.DiagnosisDAO;
import com.socia.DAO.EquipmentTypeDAO;
import com.socia.DAO.OpportunitiesDAO;
import com.socia.DAO.RunRateDAO;
import com.socia.DAO.RunRateTypeDAO;
import com.socia.DTO.BlDetailsDTO;
import com.socia.DTO.BrandDTO;
import com.socia.DTO.BusinessLineDTO;
import com.socia.DTO.CallDTO;
import com.socia.DTO.ClientDTO;
import com.socia.DTO.ContactDTO;
import com.socia.DTO.DiagnosisDTO;
import com.socia.DTO.EquipmentTypeDTO;
import com.socia.DTO.LoginDTO;
import com.socia.DTO.OpportunitiesDTO;
import com.socia.DTO.RunRateDTO;
import com.socia.DTO.RunRateTypeDTO;
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
				
				
				ArrayList<ClientDTO> arrClientP = new ArrayList<ClientDTO>(); 
				arrClientP=objClient.getClientsDiag(typeD);
				
				session.removeAttribute("arrClientA");
				session.setAttribute("arrClientA", arrClientP);
				
				session.removeAttribute("clientTypeA");
				session.setAttribute("clientTypeA", typeD);
				url		=	"/views/diagnosis/responses/getClientS.jsp";
				break;
			case 2:
				typeD		=	request.getParameter("type").trim();
				objClient	=	new ClientDAO();
				
				
				ArrayList<ClientDTO> arrClient = new ArrayList<ClientDTO>(); 
				arrClient=objClient.getClientsDiag(typeD);
				
				session.removeAttribute("arrClientP");
				session.setAttribute("arrClientP", arrClient);
				
				session.removeAttribute("clientTypeP");
				session.setAttribute("clientTypeP", typeD);
				
				url		=	"/views/diagnosis/responses/getClientePros.jsp";
				break;
			case 3:
				List<DiagnosisDTO>		lst				= 	null;
				List<ClientDTO>			lstC			=	null;
				List<ContactDTO>		lstCo			=	null;
				OpportunitiesDTO	 	opportunities	= null;
				ArrayList<RunRateTypeDTO> arrRunRateType= new ArrayList<RunRateTypeDTO>();
				ArrayList<RunRateDTO>	 arrRunRate		= new ArrayList<RunRateDTO>();
				
				try{
					con				=	conexion.getConnection1();
					clientId		=	Integer.valueOf(request.getParameter("clientId"));
					lst				=	new	DiagnosisDAO().getLastUpdate(clientId, con);
					lstC			=	new	ClientDAO().getClientDetails(clientId, con);
					lstCo			=	new	ContactDAO().getDetailsPosition(clientId, con);
					opportunities	=  	new OpportunitiesDAO().getOpportunities(clientId);
					arrRunRateType	=	new RunRateTypeDAO().getRunRateTypes();
					arrRunRate		=	new RunRateDAO().getRunRates(arrRunRateType, clientId);
					
				}catch(Exception e){
					e.printStackTrace();
				}
				
				session.removeAttribute("lstLastUpdate");
				session.setAttribute("lstLastUpdate", lst);
				
				session.removeAttribute("lstDetailsClient");
				session.setAttribute("lstDetailsClient", lstC);
				
				session.removeAttribute("lstDetailsContact");
				session.setAttribute("lstDetailsContact", lstCo);
				
				session.removeAttribute("opportunities");
				session.setAttribute("opportunities", opportunities);
				
				session.removeAttribute("arrRunRate");
				session.setAttribute("arrRunRate", arrRunRate);
				
				url		=	"/views/diagnosis/responses/getDetailsDiagnosis.jsp";
				break;	
			case 4:
				BusinessLineDTO				businessLine	= null;
				BusinessLineDAO				objBusinessLine	= new BusinessLineDAO();
				BrandDAO					objBrand		= new BrandDAO();
				EquipmentTypeDAO			objEquipmentType= new EquipmentTypeDAO();
				BlDetailsDAO				objBlDetails	= new BlDetailsDAO();
				BlDetailsDTO				blDetails 		= null;
				ArrayList<BusinessLineDTO>	arrBusinessLine	= new ArrayList<BusinessLineDTO>();
				ArrayList<BrandDTO>			arrBrands		= new ArrayList<BrandDTO>();
				ArrayList<BlDetailsDTO>		arrBLDetails	= new ArrayList<BlDetailsDTO>();
				ArrayList<EquipmentTypeDTO>	arrEquipmentType= 	new ArrayList<EquipmentTypeDTO>();

				clientId	=	Integer.valueOf(request.getParameter("clientId"));
				arrBusinessLine = objBusinessLine.getBusinessLines();
				
				session.removeAttribute("arrBusinessLine");
				if(arrBusinessLine.size() > 0)
					session.setAttribute("arrBusinessLine", arrBusinessLine);
				else
					session.setAttribute("arrBusinessLine", null);
				
				for(int i=0;i<arrBusinessLine.size();i++){
					businessLine = arrBusinessLine.get(i);
					
					blDetails = objBlDetails.getBusinessLineDetails(clientId, businessLine.getBusinessLineId());
					blDetails.setBusinessLineId(businessLine.getBusinessLineId());
					
					arrBrands = objBrand.getBrandsByBL(businessLine.getBusinessLineId());
					blDetails.setBrandArray(arrBrands);
					
					arrEquipmentType = objEquipmentType.getEquipmentTypeByBL(businessLine.getBusinessLineId());
					blDetails.setEquipmentTypeArray(arrEquipmentType);
					
					arrBLDetails.add(blDetails);
				}
				
				session.removeAttribute("arrBLDetails");
				if(arrBLDetails.size() > 0)
					session.setAttribute("arrBLDetails", arrBLDetails);
				else
					session.setAttribute("arrBLDetails", null);
				
				url = "views/diagnosis/responses/businessLineDetails.jsp";
				break;
				
			case 5:
				diagDao	= new DiagnosisDAO();
				//String path = "//C://Users//Vidal//Desktop//Docs//prueba1.pdf";
				
				String lstrVendor="1234";
				String pathRoot = "C://Users//Vidal//Desktop//Docs";
				String path = pathRoot+"/"+lstrVendor.trim(); //+ "Pdf/";
				String mstrRuta="";

				
				try{ //inicia try1
										
					 File lobjDir = new File(path);
					 if(!lobjDir.exists()){
			            lobjDir.mkdir();
					 }
					 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
					 if (!isMultipart)
					 {
					 	System.out.println("ERROR");
						 
					 }
					 else
					 {
						 
						 DiskFileUpload fu = new DiskFileUpload();
						 // maximo numero de bytes
						 fu.setSizeMax(3900*3000); // 300 K
						 // tamaño por encima del cual los ficheros son escritos directamente en disco
						 fu.setSizeThreshold(4096);
						 // directorio en el que se escribirán los ficheros con tamaño superior al soportado en memoria
						 fu.setRepositoryPath("C:/");
						 List items = null;
						 try
						 {//inicia try2
							 System.out.println("Entre a la opcion 5 "+path);
							 System.out.println("REQUES "+request);
							 items = fu.parseRequest(request);
							 Iterator itr = items.iterator();
												 
							 while (itr.hasNext())
							 {	//inicia While	  
								
								 FileItem item = (FileItem) itr.next();
								 if (item.isFormField())
								 {		  
									 if(item.getFieldName().equals("campo1"))
									 {
										 //System.out.println("Comentario:"+item.getString().trim());
										 //item.getString().trim(); //texto
									 }
									
								 } //termina if (item.isFormField())
								 else{
									 System.out.println("Entre al while "+item.getFieldName());
									 String fileName="";  
									 String fileName1="";  
									 File path1;
									 File uploadedFile;
									 String itemName="";
									 if(item.getFieldName().equals("acta")){
										 try										
										 {	//inicia try3
											 itemName = item.getName();
											 itemName = Cadena.filtroCadena(itemName);
											 if(itemName != null)
												 if(!itemName.equals("")){
													 fileName = item.getName();
											   		 path1 = new File(pathRoot+"/"+lstrVendor.trim());
											   		 if (!path1.exists()) {
											   			 boolean status = path1.mkdirs();
											   		 }
											   		 mstrRuta=path1 + "/" + fileName;
											   		 uploadedFile = new File(path1 + "/"+ fileName);
											   		 item.write(uploadedFile);
											   		 

											   		 
												 }
										 }	//termina try3 
										 catch (Exception e)
										 {	//inicia catch3
											 e.printStackTrace();
										 }	//termina catch3
									 }
									 
								   }//else 

							 }//while 
							 //lobMod.envioInformacion(lstrFolio, lstrVendor, mstrRuta, mstrComentario);
							 //response.sendRedirect("/dcmInt/finanzas/EnvioEdoCuentaProveedores/EnviaEdoCuenta.jsp?alert=1");
							 System.out.println("Cargados correctamente");
						 }//try 2 
						 catch(Exception a ){
							 a.printStackTrace();
						 }
					 }//else
				}//TRY 1 
				catch(Exception c ){
					 c.printStackTrace();
				}

				url="/views/diagnosis/responses/loadMessage.jsp";
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
