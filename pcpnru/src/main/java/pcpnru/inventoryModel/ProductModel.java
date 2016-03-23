package pcpnru.inventoryModel;

public class ProductModel extends Create_UpdateModel {
	
	private String	product_code,product_name,status_id
					,progroup_id,protype_id,unit_id
					,brand_id;

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getStatus_id() {
		return status_id;
	}

	public void setStatus_id(String status_id) {
		this.status_id = status_id;
	}

	public String getProgroup_id() {
		return progroup_id;
	}

	public void setProgroup_id(String progroup_id) {
		this.progroup_id = progroup_id;
	}

	public String getProtype_id() {
		return protype_id;
	}

	public void setProtype_id(String protype_id) {
		this.protype_id = protype_id;
	}

	public String getUnit_id() {
		return unit_id;
	}

	public void setUnit_id(String unit_id) {
		this.unit_id = unit_id;
	}

	public String getBrand_id() {
		return brand_id;
	}

	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}
	
}
