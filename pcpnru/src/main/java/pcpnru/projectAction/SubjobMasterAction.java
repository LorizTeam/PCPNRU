package pcpnru.projectAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.*;
import pcpnru.projectModel.*;
 

public class SubjobMasterAction extends ActionSupport {
	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SubjobMasterForm subjobMasterForm = new SubjobMasterForm();// TODO Auto-generated method stub
		SubjobMasterDB subjobMasterDB = new SubjobMasterDB();
		
		String subjobCode 	= subjobMasterForm.getSubjobCode();
		String subjobName 	= new String(subjobMasterForm.getSubjobName().getBytes("ISO8859_1"), "utf-8");
 
		String add 					= subjobMasterForm.getAdd();
		String update 				= subjobMasterForm.getUpdate();
		String delete 				= subjobMasterForm.getDelete();
		String alertMassage			= "";
		 
		String forwardText = null;
	  
		if(add!=null){
			
		if(!subjobCode.equals("")&&!subjobName.equals("")){
		
			subjobMasterDB.AddSubjobMaster(subjobCode, subjobName);
		
		List subjobMasterList = subjobMasterDB.GetSubjobMasterList("", "");
		request.setAttribute("subjobMasterList", subjobMasterList);
		
		forwardText = "success";
		}else{
			alertMassage = "กรุณา กรอก ข้อมูลให้ครบถ้วน";
			forwardText = "success";
		}
		}
		if(update!=null){
	   		String subjobCodeHD 	= subjobMasterForm.getSubjobCodeHD();
			if(!subjobCode.equals("")&&!subjobName.equals("")&&!subjobCodeHD.equals("")){
		 
				subjobMasterDB.UpdateSubjobMaster(subjobCode, subjobName, subjobCodeHD);
			
				List subjobMasterList = subjobMasterDB.GetSubjobMasterList("", "");
				request.setAttribute("subjobMasterList", subjobMasterList);
			
			forwardText = "success";
		}else{
			alertMassage = "กรุณา กรอก ข้อมูลให้ครบถ้วน";
			forwardText = "success";
		}	
		}
		if(delete!=null){
			
			if(!subjobCode.equals("")){
			subjobMasterDB.DeleteSubjobMaster(subjobCode);
			
			List subjobMasterList = subjobMasterDB.GetSubjobMasterList("", "");
			request.setAttribute("subjobMasterList", subjobMasterList);
			
			forwardText = "success";
			}else{
				alertMassage = "กรุณา กรอก ข้อมูลให้ครบถ้วน";
				forwardText = "success";
			}
		}
	 
		return SUCCESS;
	}
}