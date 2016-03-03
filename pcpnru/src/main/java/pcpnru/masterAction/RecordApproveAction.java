package pcpnru.masterAction;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
		
		
		  
		if(save != null){ 
			try {
				
				
				String record_approve_date = recordApproveModel.getRecord_approve_date();
				record_approve_date = dateUtil.CnvToYYYYMMDDEngYear(record_approve_date, '-');
		 		ra.AddRecordApprovehd(docno, year,recordApproveModel.getRecord_approve_hd(),recordApproveModel.getRecord_approve_t()
		 				,record_approve_date, recordApproveModel.getRecord_approve_title()
		 				,recordApproveModel.getRecord_approve_rian(), recordApproveModel.getRecord_approve_des1()
		 				,recordApproveModel.getRecord_approve_des2()
		 				,recordApproveModel.getRecord_approve_des2(), recordApproveModel.getRecord_approve_cen()
		 				,recordApproveModel.getRecord_approve_dep());
		 		
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
			
			List ListRecordApproveDT =  ra.ListRecordApproveDT(docno, year);
			request.setAttribute("ListRecordApproveDT", ListRecordApproveDT);
			
			recordApproveModel.reset_ListItem();
			
		}else if (add != null){
			
			String description = recordApproveModel.getDescription().trim();
			String qty = recordApproveModel.getQty();
			String unit = recordApproveModel.getUnit();
			
			ra.AddRecordApprovedt(docno, year, description, qty, unit);
			
			List ListRecordApproveDT =  ra.ListRecordApproveDT(docno, year);
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
		String docno = ra.SelectUpdateDocNo();
		
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
		String docno = ra.SelectUpdateDocNo();
		
		recordApproveModel.setDocno(docno);
		recordApproveModel.setYear(dateUtil.curYear());
		recordApproveModel.setFromwindow(fromwindow);
		
		return SUCCESS;
	}
	
	public String entrancSearch() throws IOException, Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest(); 
		request.setAttribute("ListResultPRSearch", new RecordApproveDB().GetListPR_Header("", "", "", "", ""));
		
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
			String year = "";
			if(!year.equals("")){
				year = String.valueOf(Integer.parseInt(recordApproveModel.getYear())-543);
			}
			
			if(passvalidate){
				request.setAttribute("ListResultPRSearch", new RecordApproveDB().GetListPR_Header(recordApproveModel.getDocno(), recordApproveModel.getRecord_approve_title()
						, new DateUtil().CnvToYYYYMMDDEngYear(recordApproveModel.getRecord_approve_date(),'-'), recordApproveModel.getRecord_approve_month()
						, year));
			}
			
		}else if(viewdetail != null){
			RecordApproveDB ra = new RecordApproveDB();
			Map MapResultValue = ra.GetAllValueHeader_byDocno(recordApproveModel.getDocno(),recordApproveModel.getYear());
			
			String fromwindow = recordApproveModel.getFromwindow();
			
			recordApproveModel = new RecordApproveModel();
			recordApproveModel.setDocno(MapResultValue.get("docno").toString());
			recordApproveModel.setYear(MapResultValue.get("year").toString());
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
			List ListRecordApproveDT =  ra.ListRecordApproveDT(MapResultValue.get("docno").toString(), MapResultValue.get("year").toString());
			request.setAttribute("ListRecordApproveDT", ListRecordApproveDT);
			
			forwardText = "viewdetail";
		}
		return forwardText;
	}
}
