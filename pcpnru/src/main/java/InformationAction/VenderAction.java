package InformationAction;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import InformationData.VenderData;
import InformationModel.VenderModel;
import pcpnru.utilities.CheckAuthenPageDB;

public class VenderAction extends ActionSupport {
	VenderModel vendermodel;

	public VenderModel getVendermodel() {
		return vendermodel;
	}

	public void setVendermodel(VenderModel vendermodel) {
		this.vendermodel = vendermodel;
	}
	
	public String create() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest(); 
		String page_code = "020";
		if(checkauth(request, page_code).equals("noauth")) 
			return "noauth";
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String add = request.getParameter("add");
		String delete = request.getParameter("delete");
		String update = request.getParameter("update");
		VenderData vendt = new VenderData();
		String vender_id = "";
		List venderList = null;
		if(add != null){
			vender_id = vendt.GetHighest_VenderID();
			vender_id = vendt.PlusOneID_FormatID(vender_id);
			vendt.Add_Vender(vender_id,vendermodel.getVender_name(),username);
			vendermodel.clear_vender();

		}else if(delete != null){
			
			String[] delvender = request.getParameterValues("delvender");
			if(delvender != null){
				for(String venderid:delvender){
					vendt.Delete_vender(venderid);
				}
			}
			vendermodel.clear_vender();
			
		}else if(update != null){
			
			vendt.Update_Vender(vendermodel.getVender_id(), vendermodel.getVender_name(), username);
			vendermodel.clear_vender();
		}
		
		venderList = vendt.Get_venderList("");
		request.setAttribute("venderList", venderList);
		return SUCCESS;
	}
	
	public String entrancVender() throws IOException, Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String page_code = "020";
		if(checkauth(request, page_code).equals("noauth")) 
			return "noauth";
		
		VenderData vendt = new VenderData();
		List venderList = null;
		venderList = vendt.Get_venderList("");
		request.setAttribute("venderList", venderList);
		return SUCCESS;
	}
	
	public String windows_entrancvender() throws IOException, Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String page_code = "020";
		if(checkauth(request, page_code).equals("noauth")) 
			return "noauth";
		
		VenderData vendt = new VenderData();
		List venderList = null;
		venderList = vendt.Get_venderList("");
		request.setAttribute("venderList", venderList);
		vendermodel = new VenderModel();
		vendermodel.setFromwindow("true");
		return SUCCESS;
	}
	
	public String checkauth(HttpServletRequest request,String page_code) throws Exception{
		String forwardText = "";
		request = ServletActionContext.getRequest(); 
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		boolean chkAuthen = false;
		
		chkAuthen = new CheckAuthenPageDB().getCheckAuthen(username, page_code);
		
		if(chkAuthen==false){
			forwardText =  "noauth";
		}
		
		return forwardText;
	}
	
}
