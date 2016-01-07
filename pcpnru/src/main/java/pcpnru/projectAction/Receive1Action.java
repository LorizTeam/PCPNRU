package pcpnru.projectAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.CostCodeMasterDB;
import pcpnru.projectData.ProjectMasterDB;
import pcpnru.projectData.Receive1DB;
import pcpnru.projectModel.ReceiveForm;
import pcpnru.utilities.DateUtil;


public class Receive1Action extends ActionSupport {
	
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
			
			DateUtil dateUtil = new DateUtil(); 
			String date	= dateUtil.CnvToDDMMYYYYThaiYear(dateUtil.CnvToYYYYMMDD(dateUtil.curDate(), '-')); //01/11/2557
			String docDate	= dateUtil.CnvToYYYYMMDD(dateUtil.curDate(), '-');
			String day 		= date.substring(0,2); // 01
			String month 	= date.substring(3,5); // 12
			String year 	= date.substring(6); // 2559
			
			String projectCode 	= request.getParameter("projectCode");
			String dateTime 	= request.getParameter("dateTime");
			String costCode 	= request.getParameter("costCode");
			String amountFrom 	= receiveform.getAmountfrom();
			
			System.out.println(amountFrom);
			String local 		= request.getParameter("local");
			
			Receive1DB receive1DB = new Receive1DB();
			String docNo = receive1DB.SelectUpdateDocNo(year);
			receive1DB.AddReceiveHD(docNo, projectCode, costCode, docDate, day, month, year, amountFrom, local); 
			
			request.setAttribute("docNo", docNo);
			request.setAttribute("projectCode", projectCode);
			request.setAttribute("dateTime", dateTime);
			request.setAttribute("costCode", costCode);
			request.setAttribute("amountFrom", amountFrom);
			request.setAttribute("local", local);
			 
			forwardText = "success";
		}else{ 
			ProjectMasterDB projectMasterDB = new ProjectMasterDB();
			List projectMasterList = projectMasterDB.GetProjectMasterList("", "");
			request.setAttribute("projectMasterList", projectMasterList);
			
			CostCodeMasterDB costCodeMasterDB = new CostCodeMasterDB();
			List costCodeMasterList = costCodeMasterDB.GetCostCodeMasterList("", "");
			request.setAttribute("costCodeMasterList", costCodeMasterList);
			
			forwardText = "error";
		}
		return forwardText;
	}
}