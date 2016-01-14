package pcpnru.projectModel;

public class ProjectModel {

	//HD
	private String project_code,target,year,datetime_response;
	private String project_name;
	
	
	public ProjectModel(String project_code,String project_name, String target
			, String year, String datetime_response){
		
		this.project_code = project_code;
		this.project_name = project_name;
		this.target = target;
		this.year = year;
		this.datetime_response = datetime_response;
		
	}
	public void reset(){
		
		this.project_code = "";
		this.target = "";
		this.year = "";
		this.datetime_response = "";
		
	}
	
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getProject_code() {
		return project_code;
	}

	public void setProject_code(String project_code) {
		this.project_code = project_code;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getDatetime_response() {
		return datetime_response;
	}

	public void setDatetime_response(String datetime_response) {
		this.datetime_response = datetime_response;
	}
	
	
}
