package pcpnru.masterAction;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import pcpnru.masterData.RecordApproveDB;
import pcpnru.masterModel.RecordApproveModel;
import pcpnru.utilities.DateUtil;

public class RecordApproveAction extends ActionSupport {
	
	RecordApproveModel recordApproveModel; 
	 
	public RecordApproveModel getRecordApproveModel() {
		return recordApproveModel;
	} 

	public void setRecordApproveModel(RecordApproveModel recordApproveModel) {
		this.recordApproveModel = recordApproveModel;
	} 

	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest(); 
		
		RecordApproveDB ra = new RecordApproveDB();
		String docno = request.getParameter("docno");
		String year  = request.getParameter("year");
		String record_approve_hd 	= recordApproveModel.getRecord_approve_hd();
		String record_approve_t 	= recordApproveModel.getRecord_approve_t();
		String record_approve_date 	= recordApproveModel.getRecord_approve_date();
		String record_approve_title = recordApproveModel.getRecord_approve_title();
		String record_approve_rian 	= recordApproveModel.getRecord_approve_rian();
		String record_approve_des1 	= recordApproveModel.getRecord_approve_des1(); 
		String record_approve_des2 	= recordApproveModel.getRecord_approve_des2();
		String record_approve_cen 	= recordApproveModel.getRecord_approve_cen();
		String record_approve_dep 	= recordApproveModel.getRecord_approve_dep();
		
		String add = request.getParameter("add");
		String update = request.getParameter("update");
		String delete = request.getParameter("delete");
		String save = request.getParameter("save");
		String forwardText = "success";  
		
		DateUtil dateUtil = new DateUtil();
		
		record_approve_date = dateUtil.CnvToYYYYMMDDEngYear(record_approve_date, '-');
		  
		if(save != null){ 
			try {
				 
		 		ra.AddRecordApprovehd(docno, year, record_approve_hd, record_approve_t, record_approve_date, record_approve_title, record_approve_rian, record_approve_des1, record_approve_des2, record_approve_cen, record_approve_dep);
		 		recordApproveModel.reset_hd();
		 		recordApproveModel.reset_dt();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}  else if(delete != null){
			try {
		//		am.DeleteAuthenMaster(authen_type);
		//		authenMasterModel.reset();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} 
		
		return forwardText;
	}
}
