package pcpnru.projectAction; 

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.ProjectDTReceiveDB;
import pcpnru.projectModel.ProjectModel;

public class ProjectDTReceiveAction extends ActionSupport{
	
	private ProjectModel projModel;
	 
	 
	public ProjectModel getProjModel() {
		return projModel;
	}


	public void setProjModel(ProjectModel projModel) {
		this.projModel = projModel;
	}


	public String execute() throws Exception{ 
		HttpServletRequest request = ServletActionContext.getRequest();
		ProjectDTReceiveDB projDtR = new ProjectDTReceiveDB();
		 
		String add	= (String) request.getParameter("add");
		String projectcode 	= (String) request.getParameter("projectcode");
		String costname		= (String) request.getParameter("costname");
		String budget		= (String) request.getParameter("budget");
	//	String projectcode 	= projModel.getProject_code();
	//	String costname		= projModel.getCostname();
	//	String budget		= projModel.getBudget();
		
		if(add!=null){ 
			projDtR.AddProjDTReceive(projectcode, costname, budget);
		}
		return SUCCESS;
	}
}
