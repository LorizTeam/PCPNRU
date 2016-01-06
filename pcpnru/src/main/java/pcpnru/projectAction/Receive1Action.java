package pcpnru.projectAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.ProjectMasterDB;
import pcpnru.projectData.Receive1DB;
import pcpnru.utilities.DateUtil;


public class Receive1Action extends ActionSupport {
	
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
	
		String ok 				= request.getParameter("ok");
		String alertMassage			= "";
		 
		String forwardText = null;
	  
		if(ok!=null){ 
			
			DateUtil dateUtil = new DateUtil(); 
			String docDate	= dateUtil.CnvToDDMMYYYYThaiYear(dateUtil.CnvToYYYYMMDD(dateUtil.curDate(), '-')); //01/11/2557
			String day 		= docDate.substring(0,2); // 01
			String month 	= docDate.substring(3,5); // 12
			String year 	= docDate.substring(6); // 2559
			
			String projectCode 	= request.getParameter("projectCode");
			String dateTime 	= request.getParameter("dateTime");
			String costCode 	= request.getParameter("costCode");
			String amountFrom 	= request.getParameter("amountFrom");
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
			
			ProjectMasterDB projectMasterDB = new ProjectMasterDB();
			List projectMasterList = projectMasterDB.GetProjectMasterList("", "");
			request.setAttribute("projectMasterList", projectMasterList);
			
			forwardText = "success";
		}else{ 
			forwardText = "error";
		}
		return forwardText;
	}
}