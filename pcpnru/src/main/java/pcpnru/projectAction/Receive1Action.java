package pcpnru.projectAction;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;


public class Receive1Action extends ActionSupport {
	
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
	
		String projectCode 	= request.getParameter("projectCode");
		String dateTime 	= request.getParameter("dateTime");
		String costCode 	= request.getParameter("costCode");
		String amountFrom 	= request.getParameter("amountFrom");
		String local 		= request.getParameter("local");
		
		String ok 				= request.getParameter("ok");
		String alertMassage			= "";
		 
		String forwardText = null;
	  
		if(ok!=null){ 
			
			request.setAttribute("projectCode", projectCode);
			request.setAttribute("dateTime", dateTime);
			request.setAttribute("costCode", costCode);
			request.setAttribute("amountFrom", amountFrom);
			request.setAttribute("local", local);
			
			forwardText = "success";
		}else{ 
			forwardText = "error";
		}
		return forwardText;
	}
}