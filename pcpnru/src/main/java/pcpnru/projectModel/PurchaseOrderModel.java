package pcpnru.projectModel;

import pcpnru.masterModel.RecordApproveModel;

public class PurchaseOrderModel extends RecordApproveModel {
	
	private String po_docno;
	private String po_docdate;
	private String ref_pr,ref_prdate,ref_quotation,ref_quotationdate;
	private String type;
	private String po_offer,approve_by;
	private double penaltype_perday;
	private int credit_day;
	
	public String getPo_docno() {
		return po_docno;
	}
	public void setPo_docno(String po_docno) {
		this.po_docno = po_docno;
	}
	public String getPo_docdate() {
		return po_docdate;
	}
	public void setPo_docdate(String po_docdate) {
		this.po_docdate = po_docdate;
	}
	public String getRef_pr() {
		return ref_pr;
	}
	public void setRef_pr(String ref_pr) {
		this.ref_pr = ref_pr;
	}
	public String getRef_prdate() {
		return ref_prdate;
	}
	public void setRef_prdate(String ref_prdate) {
		this.ref_prdate = ref_prdate;
	}
	public String getRef_quotation() {
		return ref_quotation;
	}
	public void setRef_quotation(String ref_quotation) {
		this.ref_quotation = ref_quotation;
	}
	public String getRef_quotationdate() {
		return ref_quotationdate;
	}
	public void setRef_quotationdate(String ref_quotationdate) {
		this.ref_quotationdate = ref_quotationdate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPo_offer() {
		return po_offer;
	}
	public void setPo_offer(String po_offer) {
		this.po_offer = po_offer;
	}
	public String getApprove_by() {
		return approve_by;
	}
	public void setApprove_by(String approve_by) {
		this.approve_by = approve_by;
	}
	public double getPenaltype_perday() {
		return penaltype_perday;
	}
	public void setPenaltype_perday(double penaltype_perday) {
		this.penaltype_perday = penaltype_perday;
	}
	public int getCredit_day() {
		return credit_day;
	}
	public void setCredit_day(int credit_day) {
		this.credit_day = credit_day;
	}
}
