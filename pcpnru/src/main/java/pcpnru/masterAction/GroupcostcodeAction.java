package pcpnru.masterAction;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.masterData.GroupcostcodeMasterDB;
import pcpnru.masterModel.GroupCostCodeMasterModel;
import pcpnru.projectData.CostCodeMasterDB;
import pcpnru.projectModel.CostCodeMasterForm;

public class GroupcostcodeAction extends ActionSupport {
	
	GroupCostCodeMasterModel groupcostcodemastermodel;
	
	public GroupCostCodeMasterModel getGroupcostcodemastermodel() {
		return groupcostcodemastermodel;
	}

	public void setGroupcostcodemastermodel(GroupCostCodeMasterModel groupcostcodemastermodel) {
		this.groupcostcodemastermodel = groupcostcodemastermodel;
	}





	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		GroupcostcodeMasterDB groupcostcodemasterdb = new GroupcostcodeMasterDB();
		
		String groupcostCode = groupcostcodemastermodel.getCostCode()
		, groupcostName = groupcostcodemastermodel.getCostName()
		, groupcostCodeHD = groupcostcodemastermodel.getCostCodeHD()
		, standardprice = groupcostcodemastermodel.getStandardprice()
		, fundprice = groupcostcodemastermodel.getFundprice();
		
		String add = request.getParameter("add");
		String update = request.getParameter("update");
		String delete = request.getParameter("delete");
		
		if(add != null){
			try {
				groupcostcodemasterdb.AddCostCodeMaster(groupcostCode, groupcostName,standardprice,fundprice);
				groupcostcodemastermodel.reset();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(update != null){
			try {
				groupcostcodemasterdb.UpdateCostCodeMaster(groupcostCode, groupcostName, groupcostCodeHD, standardprice, fundprice);
				groupcostcodemastermodel.reset();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(delete != null){
			try {
				groupcostcodemasterdb.DeleteCostCodeMaster(groupcostCode);
				groupcostcodemastermodel.reset();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return SUCCESS;
	}
}
