package pcpnru.projectAction; 

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.projectData.ProjectDTChargesDB;
import pcpnru.projectData.ProjectDTReceiveDB;
import pcpnru.projectModel.ProjectModel;

public class ProjectDTChargesAction extends ActionSupport{
	
	private ProjectModel projModel;
	 
	 
	public ProjectModel getProjModel() {
		return projModel;
	}


	public void setProjModel(ProjectModel projModel) {
		this.projModel = projModel;
	}


	public String execute() throws Exception{ 
		HttpServletRequest request = ServletActionContext.getRequest();
		ProjectDTChargesDB projDtC = new ProjectDTChargesDB();
	 
		String add			= (String) request.getParameter("add");
		String projectcode 	= (String) request.getParameter("projectcode");
		String gcostname	= (String) request.getParameter("gcostname");
		String budget		= (String) request.getParameter("budget");
		String childsubjobcode	= (String) request.getParameter("childsubjobcode");
		String subjobcode	= (String) request.getParameter("subjobcode");
		String gcostcode		= (String) request.getParameter("gcostcode");
		String year			= (String) request.getParameter("year");
		 
		if(add!=null){ 
		
		String[] chk 	= request.getParameterValues("aroperation");
		if(!chk[0].equals("? string: ?")){
		
			String qty 	= (String) request.getParameter("qty");
			String unit	= (String) request.getParameter("unit");
			
			String[] aroperation 	= request.getParameterValues("aroperation");
			String[] arqty 			= request.getParameterValues("arqty");
			String[] arunit 		= request.getParameterValues("arunit");	
			
		// text costname
		String txtvalue = "";
		txtvalue = gcostname;
		txtvalue += " "+qty+" "+unit; 
		
		String value = "0"; 
		for(int i=0; i<aroperation.length; i++){
			txtvalue += " "+aroperation[i]+" "+arqty[i]+" "+arunit[i];
			
			if(!qty.equals("0")){ // textfield qty + array qty[0] 
				if(aroperation[i].equals("+")){ // operation = +
					value = Float.toString(Float.parseFloat(qty)+Float.parseFloat(arqty[i]));
				}else if(aroperation[i].equals("-")) { // operation = -
					value = Float.toString(Float.parseFloat(qty)-Float.parseFloat(arqty[i]));
				}else if(aroperation[i].equals("*")) { // operation = *
					value = Float.toString(Float.parseFloat(qty)*Float.parseFloat(arqty[i]));
				}else if(aroperation[i].equals("/")) { // operation = /
					value = Float.toString(Float.parseFloat(qty)/Float.parseFloat(arqty[i]));
				}
				qty = "0";
			}else{ // textfield array qty[0] + array qty[i] 
				if(aroperation[i].equals("+")){ // operation = +
					value = Float.toString(Float.parseFloat(value)+Float.parseFloat(arqty[i]));
				}else if(aroperation[i].equals("-")) { // operation = -
					value = Float.toString(Float.parseFloat(value)-Float.parseFloat(arqty[i]));
				}else if(aroperation[i].equals("*")) { // operation = *
					value = Float.toString(Float.parseFloat(value)*Float.parseFloat(arqty[i]));
				}else if(aroperation[i].equals("/")) { // operation = /
					value = Float.toString(Float.parseFloat(value)/Float.parseFloat(arqty[i]));
				}
			}
		} 
		gcostname = txtvalue; 	// text value
		budget = value;			// value
	} 
		 
		 
			projDtC.AddProjDTCharges(projectcode, year, subjobcode, childsubjobcode, gcostcode, gcostname, budget);
		}else{
			String arnumber		= (String) request.getParameter("arnumber");
			String[] subjobhd 	= request.getParameterValues("subjobhd");
			String[] csubjobhd 	= request.getParameterValues("csubjobhd");
		//	String[] hdgcostcode 	= request.getParameterValues("hdgcostcode");
			
			String subjob = subjobhd[Integer.parseInt(arnumber)];
			String csubjob = csubjobhd[Integer.parseInt(arnumber)];
		//	String costcodedelete = hdgcostcode[Integer.parseInt(arnumber)];
			
			projDtC.DeleteProjDTCharges(projectcode, subjob, csubjob, gcostcode);
		}
		return SUCCESS;
	}
}
