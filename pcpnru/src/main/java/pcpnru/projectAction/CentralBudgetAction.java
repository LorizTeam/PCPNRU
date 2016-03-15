package pcpnru.projectAction;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.masterData.RecordApproveDB;
import pcpnru.masterModel.RecordApproveModel;
import pcpnru.projectData.CentralBudgetDB;
import pcpnru.projectData.RequisitionDB;
import pcpnru.projectData.RockingBudgetDB;
import pcpnru.projectData.extendsprojectmaster;
import pcpnru.projectModel.CentralBudgetForm;
import pcpnru.projectModel.RequisitionModel;
import pcpnru.projectModel.RockingBudgetForm;
import pcpnru.utilities.CheckAuthenPageDB;
import pcpnru.utilities.DateUtil;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class CentralBudgetAction extends ActionSupport{
	 
	CentralBudgetForm centralBudgetForm;
	
	public CentralBudgetForm getCentralBudgetForm() {
		return centralBudgetForm;
	}

	public void setCentralBudgetForm(CentralBudgetForm centralBudgetForm) {
		this.centralBudgetForm = centralBudgetForm;
	}
 
	
public String create() throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest(); 
		HttpSession session = request.getSession();
		 
		String username = "", project_code = "", forwardText = "";
		
		if(session.getAttribute("username") == null){ 
			forwardText = "login";
		}else{
			username = session.getAttribute("username").toString();
			boolean chkAuthen = false;
			String page_code = "014";
			
			CheckAuthenPageDB capDB = new CheckAuthenPageDB();
			
			chkAuthen = capDB.getCheckAuthen(username, page_code);
			
			if(chkAuthen==false){ 
				forwardText = "authen";
			}else{
				project_code = capDB.getProjectCode(username);
				
				CentralBudgetDB cbg = new CentralBudgetDB();
				 
				DateUtil dateUtil = new DateUtil();
				String docno = cbg.SelectUpdateDocNo(project_code, dateUtil.curTHYear()); 
			 
				List RockingBudgetList = cbg.GetRockingBudgetList(docno,project_code,dateUtil.curTHYear());
				request.setAttribute("RockingBudgetList", RockingBudgetList);
				
				extendsprojectmaster ext = new extendsprojectmaster();
				List projectMasterList = ext.getListProject_Join_Projecthead(project_code, "","","");
				request.setAttribute("projectMasterList", projectMasterList);
				
				List projectCentralList = cbg.getListProject(project_code, "","","");
				request.setAttribute("projectCentralList", projectCentralList); 
				
				String amt = cbg.AmountBudget(dateUtil.curTHYear());
				
				centralBudgetForm = new CentralBudgetForm(); 
				centralBudgetForm.setYear(dateUtil.curTHYear()); 
				centralBudgetForm.setDocno(docno);
				centralBudgetForm.setAmt(amt);
				
				forwardText = "success";
			}
		} 
		  
		return forwardText;
	}
	
}
