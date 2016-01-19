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
	 
		String add			= (String) request.getParameter("add");
		String projectcode 	= (String) request.getParameter("projectcode");
		String gcostname	= (String) request.getParameter("gcostname");
		String budget		= (String) request.getParameter("budget");
		String csubjob		= (String) request.getParameter("csubjob");
		String subjob		= "0003";
		String gcostcode		= (String) request.getParameter("gcostcode");
	//	String projectcode 	= projModel.getProject_code();
	//	String costname		= projModel.getCostname();
	//	String budget		= projModel.getBudget();
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
		 
		 
			projDtR.AddProjDTReceive(projectcode, subjob, csubjob, gcostcode, gcostname, budget);
		}else{
			projDtR.DeleteProjDTReceive(projectcode, gcostcode);
		}
		return SUCCESS;
	}
}
