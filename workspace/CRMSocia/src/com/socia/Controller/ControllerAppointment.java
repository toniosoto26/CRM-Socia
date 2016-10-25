package com.socia.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.socia.DAO.AppointmentDAO;
import com.socia.DAO.ConsecutiveDAO;
import com.socia.DAO.ContactDAO;
import com.socia.DAO.TransactionDAO;
import com.socia.DTO.AppointmentDTO;
import com.socia.DTO.ClientDTO;
import com.socia.DTO.ContactDTO;
 
/**
 * Servlet implementation class ControllerAppointment
 */
@WebServlet("/ControllerAppointment")
public class ControllerAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		procesar(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		procesar(request,response);
	}

	public void  procesar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession	session	=	request.getSession();
		
		int		opc	=	Integer.parseInt(request.getParameter("opc"));
		String	url	=	"";
		TransactionDAO					transaction			= new TransactionDAO();
		boolean		stat	=	false;
		try{
			switch (opc){
				case 1:
					AppointmentDAO 			appoint	=	new	AppointmentDAO();
					List<AppointmentDTO>	arrBDM	=	appoint.getBdm();
					session.removeAttribute("arrDBM");
					session.setAttribute("arrBDM", arrBDM);
					url	=	"/views/appointments/responses/getComboBDM.jsp";
					break;
				case 2:
					int					clientId	=	Integer.parseInt(request.getParameter("contactId"));
					List<ContactDTO>	arrContact	=	new ContactDAO().getContactsByClient(clientId);
					session.removeAttribute("contactos");
					session.setAttribute("contactos", arrContact);
					url	=	"/views/appointments/responses/getContacts.jsp";
					break;
				case 3:
					int	rz			=	Integer.parseInt(request.getParameter("rz"));
					String	days	=	request.getParameter("days");
					String	hrs		=	request.getParameter("hrs");
					int		contId	=	Integer.parseInt(request.getParameter("contact"));
					int		phone	=	Integer.parseInt(request.getParameter("phoneI"));
					String	email	=	request.getParameter("emailI");
					String	bdmI	=	request.getParameter("bdmI");
					String	nameI	=	request.getParameter("nameI");
									
					AppointmentDTO	c	=	new AppointmentDTO();
					int		conse	=	new AppointmentDAO().getConse()+1 ;
					c.setCrmAppointmentId(conse);
					c.setDate(days+" "+hrs);
					c.setCrmClientId(rz);
					c.setCrmUserId(2);
					c.setCrmClientId(rz);
					c.setcrmBdmId(1);
					
					session.setAttribute("nombre", nameI);
					url	=	"/views/appointments/responses/confirm.jsp";

					ArrayList<StringBuilder>	arrQuerys	=	new	ArrayList<StringBuilder>();
				//	arrQuerys	=	new AppointmentDAO().insertAppointment(c, arrQuerys);
					/*try
					{
						transaction.openConnection();
						transaction.insertAll(arrQuerys);
						transaction.commit();
						stat=true;
					}catch(Exception exception){
						stat= false;
						transaction.rollback();
						exception.printStackTrace();
					}finally{
						transaction.closeConnection();
					}
					*/
					
					break;
					
					
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);	
	}
	
}
