package pcpnru.projectAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.Receive1DB;
import pcpnru.projectModel.ReceiveForm;
import pcpnru.utilities.DateUtil;

public class SelectReceive1Action extends ActionSupport {
	
	private ReceiveForm receiveform;
	
	public ReceiveForm getReceiveform() {
		return receiveform;
	}

	public void setReceiveform(ReceiveForm receiveform) {
		this.receiveform = receiveform;
	}
	
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String ok 				= request.getParameter("ok");
		String alertMassage			= "";
		 
		String forwardText = null;
	  
		if(ok!=null){ 
			
			String projectcode 	= request.getParameter("projectCode");
			String dateTime 	= request.getParameter("dateTime");
			DateUtil dateUtil = new DateUtil();
			if(dateTime!="") dateTime			= dateUtil.CnvToYYYYMMDDEngYear(dateTime, '-');
					
			String costcode 	= request.getParameter("costCode");
			String amountfrom 	= receiveform.getAmountfrom();
			 
			String local 		= receiveform.getLocal();
			
			Receive1DB receive1DB = new Receive1DB();
			List SelectReceiveList = receive1DB.GetSelectReceiveList("", projectcode, costcode, dateTime, amountfrom, local); 
			request.setAttribute("SelectReceiveList", SelectReceiveList);

			forwardText = "success";
		}else{ 
			forwardText = "error";
		}
		return forwardText;
	}
}