package pcpnru.projectModel;

public class UnitMasterForm{

	private String unitHD;
	private String unit;  
	 
	
	private String add;
	private String update;
	private String delete;
	
	public UnitMasterForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UnitMasterForm(String unit) {
		super();
		this.unit = unit; 
	} 
	
	public void reset() {
		this.unitHD = "";
		this.unit = "";
		 
	}

	public String getUnitHD() {
		return unitHD;
	}

	public void setUnitHD(String unitHD) {
		this.unitHD = unitHD;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
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
