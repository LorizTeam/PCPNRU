package pcpnru.masterModel;

public class GroupCostCodeMasterModel {

	private String costCodeHD;
	private String costCode; 
	private String costName;
	private String dateTime;
	private String standardprice,fundprice;
	
	
	

	private String add;
	private String update;
	private String delete;
	
	public GroupCostCodeMasterModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GroupCostCodeMasterModel(String costCode, String costName,String standardprice,String fundprice, String dateTime) {
		super();
		this.costCode = costCode;
		this.costName = costName;
		this.standardprice = standardprice;
		this.fundprice = fundprice;
		this.dateTime = dateTime;
	}
	public GroupCostCodeMasterModel(String costCode, String costName) {
		super();
		this.costCode = costCode;
		this.costName = costName;
	}

	public String getCostCodeHD() {
		return costCodeHD;
	}

	public void setCostCodeHD(String costCodeHD) {
		this.costCodeHD = costCodeHD;
	}

	public String getCostCode() {
		return costCode;
	}

	public void setCostCode(String costCode) {
		this.costCode = costCode;
	}

	public String getCostName() {
		return costName;
	}

	public void setCostName(String costName) {
		this.costName = costName;
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
	public void reset(){
		this.costCodeHD = "";
		this.costCode = ""; 
		this.costName = "";
		this.standardprice = "";
		this.fundprice = "";
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getStandardprice() {
		return standardprice;
	}

	public void setStandardprice(String standardprice) {
		this.standardprice = standardprice;
	}

	public String getFundprice() {
		return fundprice;
	}

	public void setFundprice(String fundprice) {
		this.fundprice = fundprice;
	}
}
