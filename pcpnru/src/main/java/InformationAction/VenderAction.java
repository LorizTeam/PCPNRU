package InformationAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import InformationModel.VenderModel;

public class VenderAction extends ActionSupport {
	VenderModel vendermodel;

	public VenderModel getVendermodel() {
		return vendermodel;
	}

	public void setVendermodel(VenderModel vendermodel) {
		this.vendermodel = vendermodel;
	}
	
	public String create(){
		HttpServletRequest request = ServletActionContext.getRequest(); 
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		
		
		return SUCCESS;
	}
	
}
