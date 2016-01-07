package pcpnru.projectAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

 
import pcpnru.projectData.Receive2DB;
import pcpnru.projectModel.ReceiveForm;


public class Receive2Action extends ActionSupport {
	
	private ReceiveForm receivef;
 
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
	
		// HD
		String docNo		= request.getParameter("docNo");
		String projectCode 	= request.getParameter("projectCode");
		String dateTime 	= request.getParameter("dateTime");
		String costCode 	= request.getParameter("costCode");
		String amountFrom 	= request.getParameter("amountFrom");
		String local 		= request.getParameter("local");
		// DT 
		String itemNo 	= request.getParameter("itemNo").trim();
		String description 	= request.getParameter("description");
		String qty 			= request.getParameter("qty");
		String amount 		= request.getParameter("amount");
		String amountTotal 	= request.getParameter("amountTotal");
		
		if(qty!=null) qty = qty.replace(",", "");
		if(amount!=null) amount = amount.replace(",", "");
		if(amountTotal!=null) amountTotal = amountTotal.replace(",", "");
		
		String add 					= request.getParameter("add");
		String update 				= request.getParameter("update");
		String delete 				= request.getParameter("delete");
		 
		String forwardText = null;
	  
		if(add!=null){
			Receive2DB receive2DB = new Receive2DB();
			receive2DB.AddReceiveDT(docNo, description, qty, amount, amountTotal);
			String amtt	= receive2DB.getSumAmount(docNo);
			// HD
			request.setAttribute("docNo", docNo);
			request.setAttribute("projectCode", projectCode);
			request.setAttribute("dateTime", dateTime);
			request.setAttribute("costCode", costCode);
			request.setAttribute("amountFrom", amountFrom);
			request.setAttribute("local", local); 
			request.setAttribute("amtt", amtt); 
			 
		//	String test = receivef.getAmtt();
		//	System.out.print(test);
			forwardText = "success";
		}
		if(update!=null){
			Receive2DB receive2DB = new Receive2DB();
			 
			receive2DB.UpdateReceive(docNo, itemNo, description, qty, amount, amountTotal);
			String amtt	= receive2DB.getSumAmount(docNo);
			// HD
			request.setAttribute("docNo", docNo);
			request.setAttribute("projectCode", projectCode);
			request.setAttribute("dateTime", dateTime);
			request.setAttribute("costCode", costCode);
			request.setAttribute("amountFrom", amountFrom);
			request.setAttribute("local", local);
			request.setAttribute("amtt", amtt); 
			
			forwardText = "success";
		}
		if(delete!=null){
			Receive2DB receive2DB = new Receive2DB(); 
			
			receive2DB.DeleteReceiveDT(docNo, itemNo);
			String amtt	= receive2DB.getSumAmount(docNo);
			// HD
			request.setAttribute("docNo", docNo);
			request.setAttribute("projectCode", projectCode);
			request.setAttribute("dateTime", dateTime);
			request.setAttribute("costCode", costCode);
			request.setAttribute("amountFrom", amountFrom);
			request.setAttribute("local", local);
			request.setAttribute("amtt", amtt);
			
			forwardText = "success";
		}
		Receive2DB receive2DB = new Receive2DB();
		List ReceiveList = receive2DB.GetReceiveList(docNo);
		request.setAttribute("ReceiveList", ReceiveList);
		 
		return forwardText;
	}

	public ReceiveForm getReceivef() {
		return receivef;
	}

	public void setReceivef(ReceiveForm receivef) {
		this.receivef = receivef;
	}

	 
}