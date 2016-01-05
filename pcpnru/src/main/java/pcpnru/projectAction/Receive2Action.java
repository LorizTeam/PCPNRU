package pcpnru.projectAction;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;


public class Receive2Action extends ActionSupport {
	
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
	//	String projectCode 	= request.getParameter("projectCode");
	//	String projectName 	= request.getParameter("projectName");
 
	//	String add 					= request.getParameter("add");
	//	String update 				= request.getParameter("update");
	//	String delete 				= request.getParameter("delete");
		String print 				= request.getParameter("print");
		String alertMassage			= "";
		 
		String forwardText = null;
	  
		if(print!=null){
		
		forwardText = "print";
		}else{
			alertMassage = "กรุณา กรอก ข้อมูลให้ครบถ้วน";
			forwardText = "success";
		}
		return forwardText;
	}
}