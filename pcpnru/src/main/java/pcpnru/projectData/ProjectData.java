package pcpnru.projectData;

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
		
			conn = agent.getConnectMYSql();
			
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
	
}
