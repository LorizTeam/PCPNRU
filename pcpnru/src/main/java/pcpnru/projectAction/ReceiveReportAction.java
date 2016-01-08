package pcpnru.projectAction;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.Receive1DB;
import pcpnru.projectData.Receive2DB;
import pcpnru.projectData.ThaiBaht;
import pcpnru.projectModel.ReceiveForm;


public class ReceiveReportAction extends ActionSupport {
	
	private ReceiveForm receive;
	
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		
		String docNoHD		= request.getParameter("docNoHD");
	 
		String alertMassage			= "";
		 
		String forwardText = null;
 
		if(docNoHD!=null){
			//String amtt		= receive.getAmtt();
			String amtt		= request.getParameter("amtt"); 
			
			ThaiBaht thaiBaht = new ThaiBaht();
			String valueTHB = thaiBaht.getText(amtt);
			 
			request.setAttribute("valueTHB", valueTHB);
			request.setAttribute("docNoHD", docNoHD);
			forwardText = "print";
		}else{ 
			forwardText = "success";
		}
		return forwardText;
	}

	public ReceiveForm getReceive() {
		return receive;
	}

	public void setReceive(ReceiveForm receive) {
		this.receive = receive;
	}
}