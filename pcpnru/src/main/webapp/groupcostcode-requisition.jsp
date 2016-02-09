<%@page import="com.mysql.jdbc.IterateBlock"%>
<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%@ page import="pcpnru.masterModel.*" %>
<%@ page import="pcpnru.masterData.*" %> 
<%@ page import="pcpnru.projectModel.*" %>
<%@ page import="pcpnru.projectData.*" %>
<%
	if(session.getAttribute("username") == null)response.sendRedirect("login.jsp");

%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>สร้าง กลุ่มรายการค่าใช้จ่าย รายจ่าย</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width; initial-scale=1.0">
		
		<link rel="shortcut icon" href="/favicon.ico">
		<link href="css/metro.css" rel="stylesheet">
        <link href="css/metro-icons.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
		<link href="css/select2.css" rel="stylesheet">
		
	 	<script src="js/jquery-2.1.3.min.js"></script>
	 	<script src="js/jquery.dataTables.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/select2.js"></script>
        
  		
	</head>

	<body>
		 <div><%@include file="topmenu.jsp" %></div>
		 <h3 class="align-center">สร้าง รายการค่าใช้จ่าย รายจ่าย</h3>
		 <div class="example" data-text="รายละเอียด">
		 <form id="reset" action="groupcostcodeMaster.action" method="post"> 
	         <div class="grid">
	         	<div class="row cells12">
	         		<div class="cell colspan6"> 
			        	 โครงการ
				        <div class="input-control text full-size"> 
						    <select id="project_code" name="projectCode" required="required" >
							   <option value="" >กรุณาเลือกโครงการ</option>
							   <%
							   	List projectMasterList1 = null;
							    String project_code = (String) request.getAttribute("project_code");
							    if (request.getAttribute("projectMasterList") == null) {
									ProjectMasterDB projM = new ProjectMasterDB();
									projectMasterList1 = projM.getListProject_Join_Projecthead("", "","","");
								}else{
									projectMasterList1 = (List) request.getAttribute("projectMasterList");
								}
							    
							    List projectMasterList = projectMasterList1;
				        		if (projectMasterList != null) {
					        		for (Iterator iterPj = projectMasterList.iterator(); iterPj.hasNext();) {
					        			ProjectModel pjModel = (ProjectModel) iterPj.next();
			      				%>  
				      			<option value="<%=pjModel.getProject_code()%>" ><%=pjModel.getProject_code()%> - <%=pjModel.getProject_name()%></option>
								<%		} 
									}
								%>
					   		</select> 
						</div>
					</div>
					<div class="cell colspan2"> 
			        	 ราคาต่อหน่วย
				        <div class="input-control text full-size">
						    <s:textfield name="groupcostcodemastermodel.amount" type="number" step="0.01" id="amount" required=""/>
						</div>
					</div>
	         	</div>
			  	<div class="row cells12">
			  		 
			        <div class="cell colspan6"> 
			        	 รายการค่าใช้จ่าย
				        <div class="input-control text full-size">
						    <s:textfield name="groupcostcodemastermodel.costName" id="costName" required=""/>
						    <s:hidden name="groupcostcodemastermodel.costCodeHD" id="costCodeHD"/>
						</div>
					</div>
					 
					 <div class="cell colspan6"><br>
						  <button class="button success" name="add">สร้างชื่อรายการค่าใช้จ่าย</button> 
						  <button class="button primary" name="update">แก้ไขชื่อรายการค่าใช้จ่าย</button> 
						  <button class="button danger" name="delete">ลบชื่อรายการค่าใช้จ่าย</button> 
					</div>
			    </div>
			
			    
			  
			 </div>
			 <s:hidden name="groupcostcodemastermodel.type_gcostcode" id="type_gcostcode" value="2"/>
		 </form>  
		</div>  
		 
        <div class="example" data-text="รายการ">
            <table id="table_project" class="dataTable striped border bordered" data-role="datatable" data-searching="true">
                <thead>
                <tr>  
                	<th>ลำดับ</th>
                	<th>ชื่อ-โครงการ</th>
                    <th>รหัส-รายการค่าใช้จ่าย</th>
                    <th>ชื่อ-รายการค่าใช้จ่าย</th>
                    <th>ราคาต่อหน่วย</th>
                    <th>วันเวลา-รายการค่าใช้จ่าย</th>
                </tr>
                </thead> 
                  
                <tbody>
                <%
                List groupcostCodeMasterList1 = null;
                if (request.getAttribute("groupcostCodeMasterList") == null) {
                	GroupcostcodeMasterDB ccM = new GroupcostcodeMasterDB();
            		groupcostCodeMasterList1 = ccM.GetGroupCostCodeMasterList("", "", "","2");
				}else{
					groupcostCodeMasterList1 = (List) request.getAttribute("groupcostCodeMasterList");
				}
                List groupcostCodeMasterList = groupcostCodeMasterList1;
                
        		int x = 1;
        		if(groupcostCodeMasterList != null){
        			
        			Iterator costcodeIterate = groupcostCodeMasterList.iterator();
        			while(costcodeIterate.hasNext()){
        				GroupCostCodeMasterModel gccInfo = (GroupCostCodeMasterModel) costcodeIterate.next(); 
        				
        		%>
        			<tr>
        			<td align="center" width="3%"><%=x%></td>  
        			<td class="tdprojectCode" align="left" width="32%"><%=gccInfo.getProject_code()%> - <%=gccInfo.getProject_name()%></td>
                    <td class="tdcostCode" align="center" width="6%"><%=gccInfo.getCostCode()%></td>
                    <td class="tdcostName" align="left" width="38%"><%=gccInfo.getCostName()%></td>
                    <td class="tdamount" align="right" width="7%"><%=gccInfo.getAmount()%></td>
                    <td align="center" width="8%"><%=gccInfo.getDateTime()%></td>
                	</tr>
        		<%		
        		x++;
        			}
        			
        		}else{
        		%>
        			<tr>  
                    <td align="center" colspan="5">ไม่พบข้อมูล</td>   
                	</tr>
        		<%
        		}
                %>
                </tbody>
            </table>
        </div> <!-- End of example table -->  
         
   		<script>
	   	  	 
   		$(document).ready(function() {
   			     
        	var select2projectcode = $("#project_code").select2();
        	 
        	var table = $('#table_project').dataTable();
            $('#table_project tbody').on( 'click', 'tr', function () {
    	        if ( $(this).hasClass('selected') ) {
    	            $(this).removeClass('selected');
    	            select2projectcode.val("").trigger("change");
    	         //   $("#costCode").val("");
    	            $("#costCodeHD").val("");
    	            $("#costName").val("");
    	            $("#amount").val("");
    	        }
    	        else {
    	            table.$('tr.selected').removeClass('selected');
    	            $(this).addClass('selected');
    	            var $index = $(this).index();
    	            var forsplit = $(".tdprojectCode").eq($index).text().split(" - ");
    	           	select2projectcode.val(forsplit[0]).trigger("change");
    	           	
    	        //    $("#costCode").val($(".tdcostCode").eq($index).text());
    	            $("#costCodeHD").val($(".tdcostCode").eq($index).text());
    	            $("#costName").val($(".tdcostName").eq($index).text()); 
    	            var amt = $(".tdamount").eq($index).text();
    	            amt = amt.replace(",", "");
    	            $("#amount").val(amt);
    	        }
    	    });   
            
        }); 
   		 
   		 
    	</script>
	</body>
</html>
