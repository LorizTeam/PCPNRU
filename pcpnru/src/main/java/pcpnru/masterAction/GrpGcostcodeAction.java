package pcpnru.masterAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.masterData.GrpGcostcodeMasterDB;
import pcpnru.masterModel.GrpGCostCodeMasterModel;

public class GrpGcostcodeAction extends ActionSupport {
	
	GrpGCostCodeMasterModel grpgcostcodemastermodel;
	
	 
	public GrpGCostCodeMasterModel getGrpgcostcodemastermodel() {
		return grpgcostcodemastermodel;
	} 

	public void setGrpgcostcodemastermodel(GrpGCostCodeMasterModel grpgcostcodemastermodel) {
		this.grpgcostcodemastermodel = grpgcostcodemastermodel;
	}


	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		GrpGcostcodeMasterDB grpgcostcodemasterdb = new GrpGcostcodeMasterDB(); 
		 
		String forwardText = "";
		
		String project_code 	= request.getParameter("projectCode"); 
		String grp_costyear	 	= grpgcostcodemastermodel.getGrp_costyear();
		String grp_gcostname = grpgcostcodemastermodel.getGrp_gcostname();
		/*		   groupcostName = grpgcostcodemastermodel.getGcostcode_name(),
			   grp_costyear	 = grpgcostcodemastermodel.getGrp_costyear(),
			   amount_c = grpgcostcodemastermodel.getAmount_c(),
			   qty = grpgcostcodemastermodel.getQty();   */
		 
		String add = request.getParameter("add");
		String update = request.getParameter("update");
		String delete = request.getParameter("delete");
		forwardText = "success";
		 
	if(add != null){ 
		String grp_gcostcode = grpgcostcodemasterdb.SelectGrpDocNo(project_code, grp_costyear);
		//String groupcostCode_r = grpgcostcodemasterdb.SelectUpdateDocNo(project_code, "1");
		 
		if(request.getParameterValues("archk") != null){
			String[] archk 			= request.getParameterValues("archk");
			String[] argcostcode 	= request.getParameterValues("argcostcode");
			String[] qrqty 			= request.getParameterValues("qrqty");
			String[] aramount_c 	= request.getParameterValues("aramount_c");
			
			for(int i=0; i<archk.length; i++){
				grpgcostcodemasterdb.AddGrpGCostCodeMaster(project_code, argcostcode[i], grp_gcostcode, grp_gcostname, grp_costyear, qrqty[i], aramount_c[i]);
			}
		}	
		List CostCodeList_C = grpgcostcodemasterdb.GetCostCodeList_C(project_code, grp_costyear);
	   	request.setAttribute("CostCodeList_C", CostCodeList_C);
		
	}else{
		request.setAttribute("projectcode", project_code); 
		
		List CostCodeList_C = grpgcostcodemasterdb.GetCostCodeList_C(project_code, grp_costyear);
	   	request.setAttribute("CostCodeList_C", CostCodeList_C);
	}
		 
		return forwardText;
	}
}
