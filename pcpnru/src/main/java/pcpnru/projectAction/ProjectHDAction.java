package pcpnru.projectAction;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.ProjectData;
import pcpnru.projectModel.ProjectModel;

public class ProjectHDAction extends ActionSupport{
	
	private ProjectModel projectmodel;
	


	public ProjectModel getProjectmodel() {
		return projectmodel;
	}



	public void setProjectmodel(ProjectModel projectmodel) {
		this.projectmodel = projectmodel;
	}



	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		ProjectData pjData = new ProjectData();
		
		String project_target = request.getParameter("target");
		String project_year = request.getParameter("year");
		String project_code = request.getParameter("project_code");
		
		if(request.getParameter("submit") != null){
			
			try {
				pjData.AddProjectHD(project_code, project_target, project_year);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(request.getParameter("update") != null){
			try {
				pjData.UpdateProjectHD(project_code, project_target, project_year);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				pjData.DeleteProjectHD(project_code,project_year);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return SUCCESS;
	}
}
