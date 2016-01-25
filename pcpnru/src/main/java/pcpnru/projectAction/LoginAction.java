package pcpnru.projectAction;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectModel.EmployeeModel;

public class LoginAction extends ActionSupport{
	
	private EmployeeModel empmodel; 
	public EmployeeModel getEmpmodel() {
		return empmodel;
	}
	public void setEmpmodel(EmployeeModel empmodel) {
		this.empmodel = empmodel;
	}
	public String execute(){
		
		empmodel.setUsername(empmodel.getPassword());
		return SUCCESS;
	}
}
