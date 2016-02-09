package pcpnru.projectData;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pcpnru.projectModel.EmployeeModel;
import pcpnru.utilities.DBConnect;
import pcpnru.utilities.DateUtil;

public class Login_ChangePasswordData {
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	
	public List CheckLogin(EmployeeModel empmodel) throws IOException, Exception{
		
		String sqlQuery = "select * from employee where username != '' ";
		if(!empmodel.getUsername().equals("")) sqlQuery+= "and username = '"+empmodel.getUsername()+"' ";
		if(!empmodel.getPassword().equals("")) sqlQuery+= "and password = '"+empmodel.getPassword()+"' ";
		
		conn = agent.getConnectMYSql();
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlQuery);
		
		List userprofile = new ArrayList();
		while(rs.next()){
			userprofile.add(rs.getString("project_code"));
			userprofile.add(rs.getString("username"));
			userprofile.add(rs.getString("authen_type"));
		}
		
		if(rs != null) rs.close();
		if(pStmt != null) pStmt.close();
		if(conn != null) conn.close();
		
		return userprofile;
	}
}
