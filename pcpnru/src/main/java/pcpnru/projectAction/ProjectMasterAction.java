package pcpnru.projectAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.*;
import pcpnru.projectModel.*;
 

public class ProjectMasterAction extends ActionSupport {
	
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		ProjectMasterForm projectMasterForm = new ProjectMasterForm();// TODO Auto-generated method stub
		ProjectMasterDB projectMasterDB = new ProjectMasterDB();
		String projectCode 	= request.getParameter("projectCode");
		String projectName 	= request.getParameter("projectName");
 
		String add 					= request.getParameter("add");
		String update 				= request.getParameter("update");
		String delete 				= request.getParameter("delete");
		String alertMassage			= "";
		 
		String forwardText = null;
	  
		if(add!=null){
			
		if(!projectCode.equals("")&&!projectName.equals("")){
		
			projectMasterDB.AddProjectMaster(projectCode, projectName);
		
		List projectMasterList = projectMasterDB.GetProjectMasterList("", "");
		request.setAttribute("projectMasterList", projectMasterList);
		
		forwardText = "success";
		}else{
			alertMassage = "กรุณา กรอก ข้อมูลให้ครบถ้วน";
			forwardText = "success";
		}
		}
		if(update!=null){
	   		String projectCodeHD 	= request.getParameter("projectCodeHD");
			if(!projectCode.equals("")&&!projectName.equals("")&&!projectCodeHD.equals("")){
		 
				projectMasterDB.UpdateProjectMaster(projectCode, projectName, projectCodeHD);
			
				List projectMasterList = projectMasterDB.GetProjectMasterList("", "");
				request.setAttribute("projectMasterList", projectMasterList);
			
			forwardText = "success";
		}else{
			alertMassage = "กรุณา กรอก ข้อมูลให้ครบถ้วน";
			forwardText = "success";
		}	
		}
		if(delete!=null){
			projectMasterDB.DeleteProjectMaster(projectCode);
			
			List projectMasterList = projectMasterDB.GetProjectMasterList("", "");
			request.setAttribute("projectMasterList", projectMasterList);
			
			forwardText = "success";
		}
	 
		return SUCCESS;
	}
}