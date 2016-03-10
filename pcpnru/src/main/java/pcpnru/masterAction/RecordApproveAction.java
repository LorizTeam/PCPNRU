package pcpnru.masterAction;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.junit.Assert;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.masterData.RecordApproveDB;
import pcpnru.masterModel.RecordApproveModel;
import pcpnru.utilities.DateUtil;
import pcpnru.utilities.ThaiNumber;
import pcpnru.utilities.Validate;

public class RecordApproveAction extends ActionSupport {
	
	RecordApproveModel recordApproveModel; 
	 
	public RecordApproveModel getRecordApproveModel() {
		return recordApproveModel;
	} 

	public void setRecordApproveModel(RecordApproveModel recordApproveModel) {
		this.recordApproveModel = recordApproveModel;
	} 

	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest(); 
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		
		RecordApproveDB ra = new RecordApproveDB();
		String docno = recordApproveModel.getDocno();
		String year =recordApproveModel.getYear();
		
		String add = request.getParameter("add");
		String update = request.getParameter("update");
		String delete = request.getParameter("delete");
		String save = request.getParameter("save");
		String next = request.getParameter("next");
		String forwardText = "success";  
		
		DateUtil dateUtil = new DateUtil();
		String record_approve_date = recordApproveModel.getRecord_approve_date();
		record_approve_date = dateUtil.CnvToYYYYMMDDEngYear(record_approve_date, '-');
		
		  
		if(save != null){ 
			try {
				String shopvender_name = recordApproveModel.getVender_name();
				double total_amount = recordApproveModel.getTotal_amount();
				File adwa = recordApproveModel.getQuotation_img();
				String filename= "";
				String filePath = request.getSession().getServletContext().getRealPath("/");
				
	            System.out.println("Server path:" + filePath);
	            File fileToCreate = new File("C:\"",filename);
	 
	            FileUtils.copyFile(adwa, fileToCreate);
	            
				System.out.print("File name :"+adwa.getName());
				System.out.print("File name :"+filename);
		 		ra.AddRecordApprovehd(docno, year,recordApproveModel.getRecord_approve_hd(),recordApproveModel.getRecord_approve_t()
		 				,record_approve_date, recordApproveModel.getRecord_approve_title()
		 				,recordApproveModel.getRecord_approve_rian(), recordApproveModel.getRecord_approve_des1()
		 				,recordApproveModel.getRecord_approve_des2()
		 				,recordApproveModel.getRecord_approve_des2(), recordApproveModel.getRecord_approve_cen()
		 				,recordApproveModel.getRecord_approve_dep(),username);
				List ListRecordApproveDT =  ra.ListRecordApproveDT(docno,"", year);
				request.setAttribute("ListRecordApproveDT", ListRecordApproveDT);
				
		 		recordApproveModel.reset_ListItem();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}  else if(delete != null){
			
			String[] itemno = request.getParameterValues("itemno");
			
			for(String del_itemno:itemno){
				ra.DeleteRecordApprovedt(docno, year, del_itemno);
			}
			
			List ListRecordApproveDT =  ra.ListRecordApproveDT(docno,"", year);
			request.setAttribute("ListRecordApproveDT", ListRecordApproveDT);
			System.out.println("from windows:"+recordApproveModel.getFromwindow());
			recordApproveModel.setFromwindow(recordApproveModel.getFromwindow());
			recordApproveModel.reset_ListItem();
			
		}else if (add != null){
			
			String description = recordApproveModel.getDescription().trim();
			String qty = recordApproveModel.getQty();
			String unit = recordApproveModel.getUnit();
			
			if(ra.CheckHaveAddHD(docno)){
				ra.AddRecordApprovedt(docno, year, description, qty, unit,username);
			}else{
		 		ra.AddRecordApprovehd(docno, year,recordApproveModel.getRecord_approve_hd(),recordApproveModel.getRecord_approve_t()
		 				,record_approve_date, recordApproveModel.getRecord_approve_title()
		 				,recordApproveModel.getRecord_approve_rian(), recordApproveModel.getRecord_approve_des1()
		 				,recordApproveModel.getRecord_approve_des2()
		 				,recordApproveModel.getRecord_approve_des2(), recordApproveModel.getRecord_approve_cen()
		 				,recordApproveModel.getRecord_approve_dep(),username);
				ra.AddRecordApprovedt(docno, year, description, qty, unit,username);
			}
			
			
			List ListRecordApproveDT =  ra.ListRecordApproveDT(docno,"", year);
			request.setAttribute("ListRecordApproveDT", ListRecordApproveDT);			
			
			recordApproveModel.reset_ListItem();
		}else if (next != null){
			
			recordApproveModel.reset_ListItem();
		 
			create(); 
		}

		
		return forwardText;
	}
	
	public String create() throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest(); 
		
		RecordApproveDB ra = new RecordApproveDB();
		recordApproveModel = new RecordApproveModel();
		
		DateUtil dateUtil = new DateUtil();
		String docno = ra.SelectUpdateDocNo("pr");
		
		recordApproveModel.setDocno(docno);
		recordApproveModel.setYear(dateUtil.curYear());
		
		return SUCCESS;
	}
	
	public String windowcreate() throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest(); 
		
		RecordApproveDB ra = new RecordApproveDB();
		String fromwindow = recordApproveModel.getFromwindow();
		recordApproveModel = new RecordApproveModel();
		
		DateUtil dateUtil = new DateUtil();
		String docno = ra.SelectUpdateDocNo("pr");
		
		recordApproveModel.setDocno(docno);
		recordApproveModel.setYear(dateUtil.curYear());
		recordApproveModel.setFromwindow(fromwindow);
		recordApproveModel.setCreatewindow("true");
		
		return SUCCESS;
	}
	
	public String entrancSearch() throws IOException, Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest(); 
		
		DateUtil dateutil = new DateUtil();
		
		request.setAttribute("ListResultPRSearch", new RecordApproveDB().GetListPR_Header("", "", "",dateutil.curMonth(), dateutil.curYear()));
		
		return SUCCESS;
	}
	
	public String HistoryPR() throws IOException, Exception{
		HttpServletRequest request = ServletActionContext.getRequest(); 
		String search = request.getParameter("search");
		String viewdetail = request.getParameter("viewdetail");
		String create = request.getParameter("create");
		
		String forwardText = "search";
		if(create != null){
			
			windowcreate();
			forwardText = "create";
		}else if(search != null){//Check Submit By button
			
			boolean passvalidate = true;
			Validate validate = new Validate();
			
			if(!validate.CheckRegexNumberOnly(recordApproveModel.getDocno())){
				passvalidate = false;
			}
			String year = recordApproveModel.getYear();
			if(!year.equals("")){
				year = String.valueOf(Integer.parseInt(year)-543);
			}
			
			if(passvalidate){
				request.setAttribute("ListResultPRSearch", new RecordApproveDB().GetListPR_Header(recordApproveModel.getDocno(), recordApproveModel.getRecord_approve_title()
						, new DateUtil().CnvToYYYYMMDDEngYear(recordApproveModel.getRecord_approve_date(),'-'), recordApproveModel.getRecord_approve_month()
						, year));
			}
			
		}else if(viewdetail != null){
			RecordApproveDB ra = new RecordApproveDB();
			String year = recordApproveModel.getYear();
			if(!year.equals("")){
				year = String.valueOf(Integer.parseInt(year)-543);
			}
			Map MapResultValue = ra.GetAllValueHeader_byDocno(recordApproveModel.getDocno(),year);
			
			String fromwindow = recordApproveModel.getFromwindow();
			
			recordApproveModel = new RecordApproveModel();
			recordApproveModel.setDocno(MapResultValue.get("docno").toString());
			recordApproveModel.setYear(year);
			recordApproveModel.setRecord_approve_hd(MapResultValue.get("record_approve_hd").toString());
			recordApproveModel.setRecord_approve_t(MapResultValue.get("record_approve_t").toString());
			recordApproveModel.setRecord_approve_date(MapResultValue.get("record_approve_date").toString());
			recordApproveModel.setRecord_approve_title(MapResultValue.get("record_approve_title").toString());
			recordApproveModel.setRecord_approve_rian(MapResultValue.get("record_approve_rian").toString());
			recordApproveModel.setRecord_approve_des1(MapResultValue.get("record_approve_des1").toString());
			recordApproveModel.setRecord_approve_des2(MapResultValue.get("record_approve_des2").toString());
			recordApproveModel.setRecord_approve_des3(MapResultValue.get("record_approve_des3").toString());
			recordApproveModel.setRecord_approve_cen(MapResultValue.get("record_approve_cen").toString());
			recordApproveModel.setRecord_approve_dep(MapResultValue.get("record_approve_dep").toString());
			recordApproveModel.setCreate_by(MapResultValue.get("create_by").toString());
			recordApproveModel.setFromwindow(fromwindow);
			List ListRecordApproveDT =  ra.ListRecordApproveDT(recordApproveModel.getDocno(),"", year);
			request.setAttribute("ListRecordApproveDT", ListRecordApproveDT);
			
			forwardText = "viewdetail";
		}
		return forwardText;
	}
}
