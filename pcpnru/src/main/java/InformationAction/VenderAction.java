package InformationAction;

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
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		boolean chkAuthen = false;
		String page_code = "015";
		
		chkAuthen = new CheckAuthenPageDB().getCheckAuthen(username, page_code);
		
		if(chkAuthen==false){
			return "noauth";
		}
		String add = request.getParameter("add");
		String delete = request.getParameter("delete");
		VenderData vendt = new VenderData();
		String vender_id = "";
		List venderList = null;
		if(add != null){
			vender_id = vendt.GetHighest_VenderID();
			vender_id = vendt.PlusOneID_FormatID(vender_id);
			vendt.Add_Vender(vender_id,vendermodel.getVender_name(),username);
			
			venderList = vendt.Get_venderList("");
			
		}else if(delete != null){
			vender_id = vendermodel.getVender_id();
			vendt.Delete_vender(vender_id);
			
			venderList = vendt.Get_venderList("");
		}
		
		request.setAttribute("venderList", venderList);
		
		
		return SUCCESS;
	}
	
}
