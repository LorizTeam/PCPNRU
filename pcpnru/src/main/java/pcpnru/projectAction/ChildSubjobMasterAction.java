package pcpnru.projectAction;

import javax.servlet.http.HttpServletRequest; 

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.*;
import pcpnru.projectModel.*;
 
public class ChildSubjobMasterAction extends ActionSupport {
	
	private ChildSubjobMasterForm childSubjobMaster;
	
	public ChildSubjobMasterForm getChildSubjobMaster() {
		return childSubjobMaster;
	}
	public void setChildSubjobMaster(ChildSubjobMasterForm childSubjobMaster) {
		this.childSubjobMaster = childSubjobMaster;
	}

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest(); 
		
		ChildSubjobMasterDB childSubjobMasterDB = new ChildSubjobMasterDB();
		
		String subjobcode		= request.getParameter("subjobcode");
		String childsubjobcode 	= childSubjobMaster.getChildsubjobcode();
		String childsubjobname 	= childSubjobMaster.getChildsubjobname();
 
		String[] sj = subjobcode.split(" - ");
		subjobcode = sj[0].trim();
		
		String add 					= request.getParameter("add");
		String update 				= request.getParameter("update");
		String delete 				= request.getParameter("delete");
		String alertMassage			= "";
	  
		if(add!=null){
			if(!subjobcode.equals("")&&!childsubjobcode.equals("")&&!childsubjobname.equals("")){ 
				childSubjobMasterDB.AddChildSubjobMaster(subjobcode, childsubjobcode, childsubjobname);
				childSubjobMaster.reset();
			}else{
				alertMassage = "กรุณา กรอก ข้อมูลให้ครบถ้วน";
			}
		}
		if(update!=null){
	   		String childsubjobcodehd 	= childSubjobMaster.getChildsubjobcodehd();
			if(!subjobcode.equals("")&&!childsubjobcode.equals("")&&!childsubjobname.equals("")&&!childsubjobcodehd.equals("")){
				childSubjobMasterDB.UpdateChildSubjobMaster(subjobcode, childsubjobcode, childsubjobname, childsubjobcodehd);
				childSubjobMaster.reset();
			}else{
				alertMassage = "กรุณา กรอก ข้อมูลให้ครบถ้วน";
			}	
		}
		if(delete!=null){
			if(!subjobcode.equals("")&&!childsubjobcode.equals("")){
				childSubjobMasterDB.DeleteChildSubjobMaster(subjobcode, childsubjobcode);
				childSubjobMaster.reset(); 
			}else{
				alertMassage = "กรุณา กรอก ข้อมูลให้ครบถ้วน"; 
			}
		}
	 
		return SUCCESS;
	}
}