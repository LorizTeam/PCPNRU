package pcpnru.masterAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.masterData.RecordApproveDB;
import pcpnru.masterModel.RecordApproveModel;
import pcpnru.utilities.DateUtil;
import pcpnru.utilities.ThaiNumber;

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
}
