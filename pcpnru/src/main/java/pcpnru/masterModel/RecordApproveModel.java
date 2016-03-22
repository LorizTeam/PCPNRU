package pcpnru.masterModel;

import java.io.File;

public class RecordApproveModel {

	private String record_approve_hd;
	private String record_approve_t;
	private String record_approve_date;
	private String record_approve_title;
	private String record_approve_rian;
	private String record_approve_des1; 
	private String record_approve_des2;
	private String record_approve_des3;
	private String record_approve_cen; 
	private String record_approve_dep,record_approve_month; 
	private String fromwindow,createwindow,alertmsg;

	//Vendor --------------------------------------------------------
	private File toBeUploaded;
	private String vendor_name,vendor_id,toBeUploadedFileName,toBeUploadedContentType,img_path;
	private double total_amount;
	
	//Vender --------------------------------------------------------
	
	private String docno,docnohidden;
	private String year;
	private String itemno;
	private String description;
	private String qty; 
	private String unit,create_by; 
	
	public RecordApproveModel() { 
	} 
	
	public RecordApproveModel(String forwhat, String s1, String s2, String s3, String s4,
			String s5, String s6) {
		if(forwhat.equals("prhd")){
			this.docno = s1;
			this.record_approve_title = s2;
			this.record_approve_cen =s3;
			this.create_by = s4;
			this.year = s5;
			this.record_approve_date = s6;
		}
	}
	
	public RecordApproveModel(String record_approve_hd, String record_approve_t, String record_approve_date,
			String record_approve_title, String record_approve_rian, String record_approve_des1,
			String record_approve_des2, String record_approve_cen, String record_approve_dep) {
		super();
		this.record_approve_hd = record_approve_hd;
		this.record_approve_t = record_approve_t;
		this.record_approve_date = record_approve_date;
		this.record_approve_title = record_approve_title;
		this.record_approve_rian = record_approve_rian;
		this.record_approve_des1 = record_approve_des1;
		this.record_approve_des2 = record_approve_des2;
		this.record_approve_cen = record_approve_cen;
		this.record_approve_dep = record_approve_dep;
	}

	public RecordApproveModel(String docno, String year, String itemno, String description, String qty, String unit) {
		super();
		this.docno = docno;
		this.year = year;
		this.itemno = itemno;
		this.description = description;
		this.qty = qty;
		this.unit = unit;
	}
	
	public RecordApproveModel(String img_path, String docno, String year) {
		this.img_path = img_path;
		this.docno = docno;
		this.year = year;
	}

	//Reset --------------------------------------------------------
	public void reset_hd(){
		this.record_approve_hd 		= "";
		this.record_approve_t 		= ""; 
		this.record_approve_date 	= "";
		this.record_approve_title 	= "";
		this.record_approve_rian 	= ""; 
		this.record_approve_des1 	= "";
		this.record_approve_des2 	= "";
		this.record_approve_cen 	= ""; 
		this.record_approve_dep 	= ""; 
	}
	public void reset_dt(){
		this.docno 			= ""; 
		this.year 			= "";  
		this.description 	= ""; 
		this.qty 			= ""; 
		this.unit 			= ""; 
	}
	
	public void reset_ListItem(){  
		this.description 	= ""; 
		this.qty 			= ""; 
		this.unit 			= ""; 
	}
	public void reset_alert(){  
		this.alertmsg 	= ""; 
	}
	//Reset --------------------------------------------------------
	
	
	public String getVendor_id() {
		return vendor_id;
	}

	public File getToBeUploaded() {
		return toBeUploaded;
	}

	public void setToBeUploaded(File toBeUploaded) {
		this.toBeUploaded = toBeUploaded;
	}

	public String getToBeUploadedFileName() {
		return toBeUploadedFileName;
	}

	public void setToBeUploadedFileName(String toBeUploadedFileName) {
		this.toBeUploadedFileName = toBeUploadedFileName;
	}

	public String getToBeUploadedContentType() {
		return toBeUploadedContentType;
	}

	public void setToBeUploadedContentType(String toBeUploadedContentType) {
		this.toBeUploadedContentType = toBeUploadedContentType;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public void setVendor_id(String vendor_id) {
		this.vendor_id = vendor_id;
	}

	
	public String getAlertmsg() {
		return alertmsg;
	}

	public void setAlertmsg(String alertmsg) {
		this.alertmsg = alertmsg;
	}
	
	public String getVendor_name() {
		return vendor_name;
	}

	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}

	public double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}

	public String getCreatewindow() {
		return createwindow;
	}

	public void setCreatewindow(String createwindow) {
		this.createwindow = createwindow;
	}
	public String getFromwindow() {
		return fromwindow;
	}

	public void setFromwindow(String fromwindow) {
		this.fromwindow = fromwindow;
	}
	public String getDocnohidden() {
		return docnohidden;
	}

	public void setDocnohidden(String docnohidden) {
		this.docnohidden = docnohidden;
	}
	public String getRecord_approve_month() {
		return record_approve_month;
	}

	public void setRecord_approve_month(String record_approve_month) {
		this.record_approve_month = record_approve_month;
	}
	public String getCreate_by() {
		return create_by;
	}

	public void setCreate_by(String create_by) {
		this.create_by = create_by;
	}
	public String getRecord_approve_des3() {
		return record_approve_des3;
	}

	public void setRecord_approve_des3(String record_approve_des3) {
		this.record_approve_des3 = record_approve_des3;
	}
	public String getRecord_approve_hd() {
		return record_approve_hd;
	}

	public void setRecord_approve_hd(String record_approve_hd) {
		this.record_approve_hd = record_approve_hd;
	}

	public String getRecord_approve_t() {
		return record_approve_t;
	}

	public void setRecord_approve_t(String record_approve_t) {
		this.record_approve_t = record_approve_t;
	}

	public String getRecord_approve_date() {
		return record_approve_date;
	}

	public void setRecord_approve_date(String record_approve_date) {
		this.record_approve_date = record_approve_date;
	}

	public String getRecord_approve_title() {
		return record_approve_title;
	}

	public void setRecord_approve_title(String record_approve_title) {
		this.record_approve_title = record_approve_title;
	}

	public String getRecord_approve_rian() {
		return record_approve_rian;
	}

	public void setRecord_approve_rian(String record_approve_rian) {
		this.record_approve_rian = record_approve_rian;
	}

	public String getRecord_approve_des1() {
		return record_approve_des1;
	}

	public void setRecord_approve_des1(String record_approve_des1) {
		this.record_approve_des1 = record_approve_des1;
	}

	public String getRecord_approve_des2() {
		return record_approve_des2;
	}

	public void setRecord_approve_des2(String record_approve_des2) {
		this.record_approve_des2 = record_approve_des2;
	}

	public String getRecord_approve_cen() {
		return record_approve_cen;
	}

	public void setRecord_approve_cen(String record_approve_cen) {
		this.record_approve_cen = record_approve_cen;
	}

	public String getRecord_approve_dep() {
		return record_approve_dep;
	}

	public void setRecord_approve_dep(String record_approve_dep) {
		this.record_approve_dep = record_approve_dep;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getDocno() {
		return docno;
	}

	public void setDocno(String docno) {
		this.docno = docno;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getItemno() {
		return itemno;
	}

	public void setItemno(String itemno) {
		this.itemno = itemno;
	}

	 
}
