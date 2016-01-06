package pcpnru.projectModel;

public class CostCodeMasterForm {

	private String costCodeHD;
	private String costCode; 
	private String costName;
	
	private String add;
	private String update;
	private String delete;
	
	public CostCodeMasterForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CostCodeMasterForm(String costCode, String costName) {
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
	
	
}
