package pcpnru.projectModel;

public class CentralBudgetForm{

	private String year;
	private String amt; 
	
	private String docno;
	private String project_code;
	private String gcsotcode; 
	private String frombalance;
	private String rocking_budget; 
	private String balance; 
	private String remark;
	
	public CentralBudgetForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CentralBudgetForm(String year,String amt) {
		super();
		this.year = year; 
		this.amt = amt;
	} 
	
	public void reset() {
		this.year = "";
		this.amt = "";
		 
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getAmt() {
		return amt;
	}

	public void setAmt(String amt) {
		this.amt = amt;
	}

	public String getDocno() {
		return docno;
	}

	public void setDocno(String docno) {
		this.docno = docno;
	}

	public String getProject_code() {
		return project_code;
	}

	public void setProject_code(String project_code) {
		this.project_code = project_code;
	}

	public String getGcsotcode() {
		return gcsotcode;
	}

	public void setGcsotcode(String gcsotcode) {
		this.gcsotcode = gcsotcode;
	}

	public String getFrombalance() {
		return frombalance;
	}

	public void setFrombalance(String frombalance) {
		this.frombalance = frombalance;
	}

	public String getRocking_budget() {
		return rocking_budget;
	}

	public void setRocking_budget(String rocking_budget) {
		this.rocking_budget = rocking_budget;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	 
}
