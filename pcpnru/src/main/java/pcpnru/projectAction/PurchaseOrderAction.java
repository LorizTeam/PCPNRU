package pcpnru.projectAction;

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
		return SUCCESS;
	}
	
	public String pullDetailPR(){
		
		return SUCCESS;
	}
	
	public String execute(){
		
		return SUCCESS;
	}
}
