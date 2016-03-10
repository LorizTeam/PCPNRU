package pcpnru.projectAction;

import javax.servlet.http.HttpServletRequest; 

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.*;
import pcpnru.projectModel.*;
import pcpnru.utilities.DateUtil;
 

public class UnitMasterAction extends ActionSupport {
	
	private UnitMasterForm unitMaster;
	 
	public UnitMasterForm getUnitMaster() {
		return unitMaster;
	}  

	public void setUnitMaster(UnitMasterForm unitMaster) {
		this.unitMaster = unitMaster;
	}  

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest(); 
		
		UnitMasterDB unitMasterDB = new UnitMasterDB();
		
		String unit 	= unitMaster.getUnit(); 
 
		String add 					= request.getParameter("add");
		String update 				= request.getParameter("update");
		String delete 				= request.getParameter("delete"); 
		
		if(add!=null){
			if(!unit.equals("")){  
				boolean checkhave = unitMasterDB.checkunit(unit);
				if(checkhave==true) unitMasterDB.AddUnitMaster(unit);
				unitMaster.reset();
			} 
		}
		if(update!=null){
			String unitHD 	= unitMaster.getUnitHD();
			if(!unit.equals("")&&!unitHD.equals("")){
				unitMasterDB.UpdateUnitMaster(unit, unitHD);
				unitMaster.reset();
			} 	
		}
		if(delete!=null){
			if(!unit.equals("")){
				unitMasterDB.DeleteSubjobMaster(unit);;
				unitMaster.reset(); 
			} 
		}
	 
		return SUCCESS;
	}
}