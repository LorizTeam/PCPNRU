package pcpnru.projectModel;

public class CentralBudgetForm{

	private String year;
	private String amt; 
	
	private String docno;
	
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
	 
}
