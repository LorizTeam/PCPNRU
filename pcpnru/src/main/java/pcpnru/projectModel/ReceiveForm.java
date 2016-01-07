package pcpnru.projectModel;

public class ReceiveForm{
	
	private String amountfrom;
	

	private String docNo;
	private String itemNo; 
	private String description;
	private String qty;
	private String amount; 
	private String amountTotal;
	
	private String amtt;
	
	private String add;
	private String update;
	private String delete;
	
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
}
