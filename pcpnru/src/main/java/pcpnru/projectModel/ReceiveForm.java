package pcpnru.projectModel;

import pcpnru.masterModel.GroupCostCodeMasterModel;

public class ReceiveForm {
	
	private String amountfrom;
	private String local; 

	private String docNo;
	private String itemNo; 
	private String description;
	private String qty;
	private String amount; 
	private String amountTotal;
	private String project_year;
	private String amtt;
	
	private String add;
	private String update;
	private String delete;
	
	private String project;
	private String cost;
	private String docdate; 
	
	private String costcode,costname,percentprice,datetime,gcostcode,standardprice;
	
	
	
	public ReceiveForm() { 
	} 
	public ReceiveForm(String docNo, String itemNo, String description, String qty, String amount, String amountTotal) {
		super();
		this.docNo = docNo;
		this.itemNo = itemNo;
		this.description = description;
		this.qty = qty;
		this.amount = amount;
		this.amountTotal = amountTotal;
	}
	public ReceiveForm(String docNo, String projectcode, String project, String cost, String docdate, String amountfrom, String local) {
		this.docNo = docNo;
		this.project = project;
		this.cost = cost;
		this.docdate = docdate;
		this.amountfrom = amountfrom;
		this.local = local;
	}
	public ReceiveForm(String check, String amountfrom, String local) { 
		
		if(check.equals("1")) this.amountfrom = amountfrom;
		else if (check.equals("2")) this.local	= local;
		
	}
	public ReceiveForm(String costcode, String costname, String percentprice, String datetime, String gcostcode) {
		this.costcode = costcode;
		this.costname = costname;
		this.percentprice = percentprice;
		this.datetime = datetime;
		this.gcostcode = gcostcode;
	}
	public String getStandardprice() {
		return standardprice;
	}
	public void setStandardprice(String standardprice) {
		this.standardprice = standardprice;
	}
	public String getCostcode() {
		return costcode;
	}
	public void setCostcode(String costcode) {
		this.costcode = costcode;
	}
	public String getCostname() {
		return costname;
	}
	public void setCostname(String costname) {
		this.costname = costname;
	}
	public String getPercentprice() {
		return percentprice;
	}
	public void setPercentprice(String percentprice) {
		this.percentprice = percentprice;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public String getGcostcode() {
		return gcostcode;
	}
	public void setGcostcode(String gcostcode) {
		this.gcostcode = gcostcode;
	}
	public String getProject_year() {
		return project_year;
	}
	public void setProject_year(String project_year) {
		this.project_year = project_year;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getItemNo() {
		return itemNo;
	}

	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
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

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getAmountTotal() {
		return amountTotal;
	}

	public void setAmountTotal(String amountTotal) {
		this.amountTotal = amountTotal;
	}

	public String getAdd() {
		return add;
	}

	public void setAdd(String add) {
		this.add = add;
	}

	public String getUpdate() {
		return update;
	}

	public void setUpdate(String update) {
		this.update = update;
	}

	public String getDelete() {
		return delete;
	}

	public void setDelete(String delete) {
		this.delete = delete;
	}

	public String getAmtt() {
		return amtt;
	}

	public void setAmtt(String amtt) {
		this.amtt = amtt;
	} 
	
	public String getAmountfrom() {
		return amountfrom;
	}

	public void setAmountfrom(String amountfrom) {
		this.amountfrom = amountfrom;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}
	 
	public String getDocdate() {
		return docdate;
	}
	public void setDocdate(String docdate) {
		this.docdate = docdate;
	}
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
}
