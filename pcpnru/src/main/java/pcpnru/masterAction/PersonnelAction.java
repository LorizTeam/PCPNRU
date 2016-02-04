package pcpnru.masterAction;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.masterData.PersonnelMasterDB;
import pcpnru.masterModel.PersonnelMasterModel;
import pcpnru.utilities.DateUtil;

public class PersonnelAction extends ActionSupport {
	
	PersonnelMasterModel personnelMasterModel;


	public PersonnelMasterModel getPersonnelMasterModel() {
		return personnelMasterModel;
	}

	public void setPersonnelMasterModel(PersonnelMasterModel personnelMasterModel) {
		this.personnelMasterModel = personnelMasterModel;
	}


	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest(); 
		
		 PersonnelMasterDB pn = new PersonnelMasterDB();
		
		String personnel_id = personnelMasterModel.getPersonnel_id()
		, personnel_name = personnelMasterModel.getPersonnel_name()
		, personnel_lastname = personnelMasterModel.getPersonnel_lastname()
		, dow = personnelMasterModel.getDow()
		, dob = personnelMasterModel.getDob()
		, telephone = personnelMasterModel.getTelephone()
		, address = personnelMasterModel.getAddress();  
		
		String add = request.getParameter("add");
		String update = request.getParameter("update");
		String delete = request.getParameter("delete");
		String forwardText = "success";
		
		String project_code = request.getParameter("project_code");
		String authen_type  = request.getParameter("authen_type");
		String position  = request.getParameter("position");
		
		DateUtil dateUtil = new DateUtil(); 
		dow	= dateUtil.CnvToYYYYMMDDEngYear(dow, '-');
		dob	= dateUtil.CnvToYYYYMMDDEngYear(dob, '-');
		
		if(add != null){
			
			try {
				pn.AddPersonnelMaster(project_code, personnel_id, personnel_name, personnel_lastname, authen_type, dow, dob, telephone, address, position); 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(update != null){
			try {
				pn.UpdatePersonnelMaster(project_code, personnel_id, personnel_name, personnel_lastname, authen_type, dow, dob, telephone, address, position); 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(delete != null){
			try {
				pn.DeletePersonnelMaster(personnel_id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} 
		
		return forwardText;
	}
}
