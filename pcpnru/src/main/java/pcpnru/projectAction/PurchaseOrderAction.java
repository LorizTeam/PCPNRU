package pcpnru.projectAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectModel.PurchaseOrderModel;

public class PurchaseOrderAction extends ActionSupport {
	
	PurchaseOrderModel pomodel;

	public PurchaseOrderModel getPomodel() {
		return pomodel;
	}

	public void setPomodel(PurchaseOrderModel pomodel) {
		this.pomodel = pomodel;
	}
	
	public String checkauthen(){
		HttpServletRequest request = ServletActionContext.getRequest(); 
		HttpSession session = request.getSession();
		pomodel = new PurchaseOrderModel();
		if(session.getAttribute("username") == null) return "nologin";
		pomodel.setProject_code(session.getAttribute("project_code").toString());
		return SUCCESS;
	}
	
	public String pullDetailPR(){
		
		return SUCCESS;
	}
	
	public String execute(){
		
		return SUCCESS;
	}
}
