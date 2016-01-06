package pcpnru.projectAction;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.Receive1DB;
import pcpnru.projectData.Receive2DB;


public class ReceiveReportAction extends ActionSupport {
	
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
	
		String docNoHD		= request.getParameter("docNoHD");
	
		String print 				= request.getParameter("print");
		String alertMassage			= "";
		 
		String forwardText = null;
 
		if(print!=null){
		request.setAttribute("docNoHD", docNoHD);
		forwardText = "print";
		}else{ 
			forwardText = "success";
		}
		return forwardText;
	}
}