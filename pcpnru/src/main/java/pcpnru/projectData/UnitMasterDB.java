package pcpnru.projectData;
 
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement; 
import java.util.ArrayList;
import java.util.List;

import pcpnru.projectModel.*;
import pcpnru.utilities.*;
 

public class UnitMasterDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetUnitMasterList(String unit) 
	throws Exception { //09-03-2016
		List unitMasterList = new ArrayList(); 
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT unit " +
			"FROM unit_master " +
			"WHERE "; 
			if(!unit.equals("")) sqlStmt = sqlStmt+ "unit like '"+unit+"%' AND "; 
			
			sqlStmt = sqlStmt + "unit <> '' order by unit";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				unit 	= rs.getString("unit"); 
				
				unitMasterList.add(new UnitMasterForm(unit));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return unitMasterList;
	 } 
	
	public void AddUnitMaster(String unit)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO unit_master(unit) " +
		"VALUES ('"+unit+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateUnitMaster(String unit, String unitHD)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE unit_master set unit = '"+unit+"' " +
				"WHERE unit = '"+unitHD+"'";
		//System.out.println(sqlStmt); 
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
		 
	}
	public void DeleteSubjobMaster(String unit)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE From unit_master "+
		"WHERE unit = '"+unit+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	} 
	public boolean checkunit(String unit) throws IOException, Exception{
		boolean checkhave = true;
		
		conn = agent.getConnectMYSql();
		
		String sqlQuery= "SELECT unit " +
				"FROM unit_master " 
				+ "where unit = '"+unit+"'"; 
		
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlQuery);
		if(rs.next()){
			checkhave = false;
		}  
		rs.close();
		pStmt.close();
		conn.close();
		return checkhave;
	}
}
