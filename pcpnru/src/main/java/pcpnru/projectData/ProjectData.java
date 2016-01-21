package pcpnru.projectData;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import pcpnru.projectModel.ProjectMasterForm;
import pcpnru.projectModel.ProjectModel;
import pcpnru.utilities.DBConnect;
import pcpnru.utilities.DateUtil;

public class ProjectData {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetProjectHDList() 
	throws Exception { //30-05-2014
		List projectplanHDList = new ArrayList();
		String datetime_response = "",project_name,target="",year_projectplan="",project_code="";
		try {
		
			
			
			String sqlStmt = "SELECT "
					+ "a.project_code,"
					+ "b.project_name,"
					+ "a.target,"
					+ "a.`year`,"
					+ "DATE_FORMAT(a.datetime_response,'%d-%m-%Y %H:%i') as datetime_response "
					+ "FROM "
					+ "projectplan_header AS a "
					+ "INNER JOIN project_master AS b ON b.project_code = a.project_code where a.project_code <> '' "
					+ "order by a.datetime_response desc";
			
			conn = agent.getConnectMYSql();
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				project_code 	= rs.getString("project_code");
				project_name = rs.getString("project_name");
				target = rs.getString("target");
				year_projectplan = rs.getString("year");
				datetime_response		= rs.getString("datetime_response");
			//	dateTime = dateTime.replace(".0", "");
				
				String day 		= datetime_response.substring(0, 2);
				String month 	= datetime_response.substring(3, 5);
				String year 	= Integer.toString((Integer.parseInt(datetime_response.substring(6, 10))+543));
				
				String time 	= datetime_response.substring(11);
				datetime_response		= day+"-"+month+"-"+year+" "+time;
			//	amount 			= df2.format(Float.parseFloat(amount));
				
				projectplanHDList.add(new ProjectModel(project_code, project_name,target,year_projectplan, datetime_response));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return projectplanHDList;
	 }
	
	public void AddProjectHD(String project_code, String target , String year)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO projectplan_header(project_code, target,year, datetime_response) " +
		"VALUES ('"+project_code+"', '"+target+"','"+year+"', now())";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateProjectHD(String project_code, String target, String year)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE projectplan_header set project_code = '"+project_code+"', target = '"+target+"',"
				+ "year = '"+year+"' "+
				", datetime_response = now()" +
				"WHERE project_code = '"+project_code+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteProjectHD(String project_code,String year)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE From projectplan_header "+
		"WHERE project_code = '"+project_code+"' and year = '"+year+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public boolean getCheckProjectHD(String project_code) throws Exception {
	
	boolean chkProject = false;
	conn = agent.getConnectMYSql();
 	
 	String sqlStmt = "SELECT project_code " +
	"FROM projectplan_header WHERE project_code = '"+project_code+"' ";
 	
 	pStmt = conn.createStatement();
	rs = pStmt.executeQuery(sqlStmt);	
	
	while (rs.next()) {
		chkProject = true;
	}
	
	rs.close();
	pStmt.close();
	
	return chkProject;
	}
	public double getTarget(String projectcode, String year) throws Exception {
		
		String targetTXT = "";
		double target = 0;
		
		conn = agent.getConnectMYSql();
	 	
	 	String sqlStmt = "SELECT target " +
		"FROM projectplan_header WHERE project_code = '"+projectcode+"' and year = '"+year+"' ";
	 	
	 	pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlStmt);	
		
		while (rs.next()) {
			targetTXT = rs.getString("target");
			 if(targetTXT!=null) target = Double.parseDouble(rs.getString("target")); else target = 0; 
		}
		 
		rs.close();
		pStmt.close();
		
		return target;
		}
	public String selectProjectname(String project_code) throws Exception {
		
		String project_name = "";
		conn = agent.getConnectMYSql();
	 	
	 	String sqlStmt = "SELECT b.project_name " +
		"FROM projectplan_header a inner join project_master b on(b.project_code = a.project_code) WHERE a.project_code = '"+project_code+"' ";
	 	
	 	pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlStmt);	
		
		while (rs.next()) {
			project_name = rs.getString("project_name");
		}
		
		rs.close();
		pStmt.close();
		conn.close();
		return project_name;
		}
	
	public List GetProjectDTDetailList(String project_code,String year,String project_name,
			String subjob_code,String subjob_name,String childsubjobcode,
			String childsubjobname,String gcostcode,String gcostcode_name,
			String budget,String datetime_response , String orderby,String receive,
			String groupby){
		List ProjectDTList = new ArrayList();
		
		String sqlWhere = "";
		
		if(!project_code.equals(""))
			sqlWhere += "e.project_code = '"+project_code+"' and ";
		if(!year.equals(""))
			sqlWhere += "f.year = '"+year+"' and ";
		if(!project_name.equals(""))
			sqlWhere += "e.project_name = '"+project_name+"' and "; 
		if(!subjob_code.equals(""))
			sqlWhere += "a.subjob_code = '"+subjob_code+"' and ";
		if(!subjob_name.equals(""))
			sqlWhere += "b.subjob_name = '"+subjob_name+"' and ";
		if(!childsubjobcode.equals(""))
			sqlWhere += "a.childsubjobcode = '"+childsubjobcode+"' and ";
		if(!childsubjobname.equals(""))
			sqlWhere += "c.childsubjobname = '"+childsubjobname+"' and ";
		if(!gcostcode.equals(""))
			sqlWhere += "a.gcostcode = '"+gcostcode+"' and ";
		if(!gcostcode_name.equals(""))
			sqlWhere += "a.gcostcode_name = '"+gcostcode_name+"' and ";
		if(!budget.equals(""))
			sqlWhere += "a.budget = '"+budget+"' and ";
		if(!datetime_response.equals(""))
			sqlWhere += "a.datetime_response = '"+datetime_response+"' and ";
		if(!receive.equals("")){
			sqlWhere += "a.subjob_code = '0003' and ";
		}else{
			sqlWhere += "a.subjob_code not in ('0003') and ";
		}
		
			
		
		String sqlQuery ="SELECT "
				+ "e.project_name, "
				+ "e.project_code, "
				+ "a.subjob_code, "
				+ "b.subjob_name, "
				+ "a.childsubjobcode, "
				+ "c.childsubjobname, "
				+ "a.gcostcode, "
				+ "a.gcostcode_name, "
				+ "a.budget, "
				+ "a.datetime_response "
				+ "FROM "
				+ "projectplan_detail AS a "
				+ "INNER JOIN subjob_master AS b ON b.subjob_code = a.subjob_code "
				+ "INNER JOIN childsubjob_master AS c ON a.childsubjobcode = c.childsubjobcode AND b.subjob_code = c.subjob_code "
				+ "INNER JOIN groupcostcode_master AS d ON d.gcostcode = a.gcostcode "
				+ "INNER JOIN project_master as e ON e.project_code = a.project_code " 
				+ "INNER JOIN projectplan_header AS f ON f.project_code = a.project_code and f.year = a.year "
				+ "where "
				+ sqlWhere +"a.project_code <> '' ";
		
		
		if(!groupby.equals(""))
			sqlQuery += "group by "+groupby;
		//ORDER BY a.project_code,a.subjob_code,a.childsubjobcode,a.gcostcode
		//sqlQuery += " ORDER BY a.project_code,a.subjob_code,a.childsubjobcode,a.gcostcode";
		if(!orderby.equals(""))
			sqlQuery += " order by datetime_response "+orderby;
				
		try {
			
			conn = agent.getConnectMYSql();
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlQuery);
			while(rs.next()){
				project_code = rs.getString("project_code");
				project_name = rs.getString("project_name");
				subjob_code = rs.getString("subjob_code");
				subjob_name = rs.getString("subjob_name");
				childsubjobcode = rs.getString("childsubjobcode");
				childsubjobname = rs.getString("childsubjobname");
				gcostcode = rs.getString("gcostcode");
				gcostcode_name = rs.getString("gcostcode_name");
				budget = rs.getString("budget");
				datetime_response = rs.getString("datetime_response");
				ProjectDTList.add(new ProjectModel(project_code,project_name,subjob_code,subjob_name,childsubjobcode,childsubjobname,
						gcostcode,gcostcode_name,budget,datetime_response));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
		return ProjectDTList;
	}
	
	
}
