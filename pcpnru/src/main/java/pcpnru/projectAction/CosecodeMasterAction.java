package pcpnru.projectAction;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.CostCodeMasterDB;
import pcpnru.projectModel.CostCodeMasterForm;

public class CosecodeMasterAction extends ActionSupport {
	
	CostCodeMasterForm costcodemasterform;
	
	public CostCodeMasterForm getCostcodemasterform() {
		return costcodemasterform;
	}

	public void setCostcodemasterform(CostCodeMasterForm costcodemasterform) {
		this.costcodemasterform = costcodemasterform;
	}
	
	

	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		CostCodeMasterDB costcodemasterdb = new CostCodeMasterDB();
		String costCode = costcodemasterform.getCostCode();
		String costName = costcodemasterform.getCostName();
		String costCodeHD = costcodemasterform.getCostCodeHD();
		
		
		String add = request.getParameter("add");
		String update = request.getParameter("update");
		String delete = request.getParameter("delete");
		
		if(add != null){
			try {
				costcodemasterdb.AddCostCodeMaster(costCode, costName);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(update != null){
			try {
				costcodemasterdb.UpdateCostCodeMaster(costCode, costName, costCodeHD);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(delete != null){
			try {
				costcodemasterdb.DeleteCostCodeMaster(costCode);;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return SUCCESS;
	}
}
