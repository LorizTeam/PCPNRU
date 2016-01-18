package pcpnru.projectAction;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.Receive1DB;
import pcpnru.projectModel.ReceiveForm;


public class SelectReceive2Action extends ActionSupport {
	
	private ReceiveForm receiveform;

	public ReceiveForm getReceiveform() {
		return receiveform;
	}

	public void setReceiveform(ReceiveForm receiveform) {
		this.receiveform = receiveform;
	}

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String docno 	= request.getParameter("docno");
		String alertMassage			= "";
		 
		String forwardText = null;
	  
		if(docno!=null){ 
			String project 	= request.getParameter("project");
			String cost 	= request.getParameter("cost");
			String dateTime 	= request.getParameter("datetime");
			//String amountfrom 	= request.getParameter("amountfrom"); 
			//String local 		= request.getParameter("local");
			String amountfrom	= receiveform.getAmountfrom();
			String local		= receiveform.getLocal();
			
			Receive1DB receive1DB = new Receive1DB();
			 
			request.setAttribute("docno", docno);
			request.setAttribute("projectcode", project);
			request.setAttribute("datetime", dateTime);
			request.setAttribute("costcode", cost);
		//	request.setAttribute("amountfrom", amountfrom);
		//	request.setAttribute("local", local);
			 
			receiveform.setAmountfrom(amountfrom);
			receiveform.setLocal(local);
		//	receiveform.setAmtt("0");
			
			forwardText = "success";
		}else{ 
			forwardText = "error";
		}
		return forwardText;
	}
}