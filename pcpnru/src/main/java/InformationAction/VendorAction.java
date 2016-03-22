package InformationAction;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import InformationData.VendorData;
import InformationModel.VendorModel;
import pcpnru.utilities.CheckAuthenPageDB;

public class VendorAction extends ActionSupport {
	VendorModel vendormodel;

	public VendorModel getvendormodel() {
		return vendormodel;
	}

	public void setvendormodel(VendorModel vendormodel) {
		this.vendormodel = vendormodel;
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
		VendorData vendt = new VendorData();
		String vendor_id = "";
		List vendorList = null;
		if(add != null){
			vendor_id = vendt.GetHighest_VendorID();
			vendor_id = vendt.PlusOneID_FormatID(vendor_id);
			String vendor_name=vendormodel.getVendor_name();
			vendt.Add_Vendor(vendor_id,vendor_name,username);
			vendormodel.clear_vendor();

		}else if(delete != null){
			
			String[] delvendor = request.getParameterValues("delvendor");
			if(delvendor != null){
				for(String vendorid:delvendor){
					vendt.Delete_vendor(vendorid);
				}
			}
			vendormodel.clear_vendor();
			
		}else if(update != null){
			
			vendt.Update_Vendor(vendormodel.getVendor_id(), vendormodel.getVendor_name(), username);
			vendormodel.clear_vendor();
		}
		
		vendorList = vendt.Get_vendorList("");
		request.setAttribute("vendorList", vendorList);
		return SUCCESS;
	}
	
	public String entrancVendor() throws IOException, Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String page_code = "020";
		if(checkauth(request, page_code).equals("noauth")) 
			return "noauth";
		
		VendorData vendt = new VendorData();
		List vendorList = null;
		vendorList = vendt.Get_vendorList("");
		request.setAttribute("vendorList", vendorList);
		return SUCCESS;
	}
	
	public String windows_entrancvendor() throws IOException, Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String page_code = "020";
		if(checkauth(request, page_code).equals("noauth")) 
			return "noauth";
		
		VendorData vendt = new VendorData();
		List vendorList = null;
		vendorList = vendt.Get_vendorList("");
		request.setAttribute("vendorList", vendorList);
		vendormodel = new VendorModel();
		vendormodel.setFromwindow("true");
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
