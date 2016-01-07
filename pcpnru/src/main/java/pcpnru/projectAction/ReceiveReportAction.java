package pcpnru.projectAction;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.Receive1DB;
import pcpnru.projectData.Receive2DB;
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
			amtt = amtt.replace(",", "");
			amtt = Integer.toString(Integer.parseInt(amtt));
			String text = "", valueText = ""; 
			
			for(int i=0,j=1; i<amtt.length(); i++,j++){ 
				
				String vAmt = amtt.substring(i, j);
				
				switch (Integer.parseInt(vAmt)) {
				case 0: text = "ศูนย์"; break;
				case 1: text = "หนึ่ง"; break;
				case 2: text = "สอง"; break;
				case 3: text = "สาม"; break;
				case 4: text = "สี่"; break;
				case 5: text = "ห้า"; break;
				case 6: text = "หก"; break;
				case 7: text = "เจ็ด"; break;
				case 8: text = "แปด"; break;
				case 9: text = "เก้า"; break;
				}
				valueText = valueText+text;
			}
			
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