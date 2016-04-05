package pcpnru.projectAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.junit.runner.Request;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.PurchaseOrderDB;
import pcpnru.projectModel.PurchaseOrderModel;
import pcpnru.utilities.DateUtil;

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
	
	public String pullDetailPR() throws Exception{
		
		
		
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		 
		HttpServletRequest request = ServletActionContext.getRequest(); 
		PurchaseOrderDB purchaseOrderDB = new PurchaseOrderDB();
		String po_docno = "";
		String year		= "";
		DateUtil dateUtil = new DateUtil();
		
		if(!pomodel.getPo_docno().equals("")){
			po_docno 	= pomodel.getPo_docno();
		}else{
			
			year		= dateUtil.curYear();
			po_docno 	= purchaseOrderDB.SelectUpdateDocNo(year);
		}
		
		String po_docdate 	= pomodel.getPo_docdate();
		if(!po_docdate.equals("")) po_docdate = dateUtil.CnvToYYYYMMDDEngYear(po_docdate, '-');
		String type			= pomodel.getType();
		String vender		= pomodel.getVender();
		int credit_day		= pomodel.getCredit_day();
		double mulct_day	= pomodel.getMulct_day();
		String quotation_number = pomodel.getQuotation_number();
		String quotation_date = pomodel.getQuotation_date();
		if(!quotation_date.equals("")) quotation_date = dateUtil.CnvToYYYYMMDDEngYear(quotation_date, '-');
		
		purchaseOrderDB.AddPOHD(po_docno, year, po_docdate, type, vender, credit_day, mulct_day, quotation_number, quotation_date);
		
		pomodel.setPo_docno(po_docno); 
		
		request.setAttribute("type", type);
		
		return SUCCESS;
	}
}
