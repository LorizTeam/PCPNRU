<%@page import="com.mysql.jdbc.IterateBlock"%>
<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="pcpnru.masterModel.*" %>
<%@ page import="pcpnru.masterData.*" %>
<%@ page import="pcpnru.projectData.*" %>
<%@ page import="pcpnru.projectModel.*" %>
<%
	if(session.getAttribute("username") == null)response.sendRedirect("login.jsp");

%>
<!DOCTYPE html>
<html lang="en" ng-app="rocking-budget">
	<head>
		<title>อนุมัติ การโยกงบประมาณ</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width; initial-scale=1.0">
		
		<link rel="shortcut icon" href="/favicon.ico">
		<link href="css/metro.css" rel="stylesheet">
        <link href="css/metro-icons.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet"> 
		<link href="css/select2.css" rel="stylesheet">
		<link href="css/jquery.dataTables.min.css" rel="stylesheet">
		
	 	<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/select2.js"></script>
        <script src="js/jquery.dataTables.min.js"></script> 
        <script src="js/angular.min.js"></script>
		<script src="js/rocking-budget.js"></script>
	</head>

	<body  ng-controller="myCtrl">
		 <div><%@include file="topmenu.jsp" %></div>
		 <h3 class="align-center">อนุมัติ การโยกงบประมาณ</h3>
		 <div class="example" data-text="รายละเอียด">
		 <form action="authenMaster.action" method="post">
	         <div class="grid">
	         	<div class="row cells12">  
					<div class="cell colspan6"> 
			        	โครงการ
				        <div class="input-control text full-size">
						    <select id="project_code" ng-load="projectchange()" ng-change="projectchange()" o ng-model="project" name="rockingBudgetForm.project_code" data-validate-func="required" data-validate-hint="กรุณาเลือกโครงการที่รับ">
							   <option value="">กรุณาเลือกโครงการ</option>
							   <%
							   
							   	List projectMasterList1 = null;
							   extendsprojectmaster ext = new extendsprojectmaster();
							   	projectMasterList1 = ext.getListProject_Join_Projecthead("PCC006", "","","");
							   	List projectMasterList = projectMasterList1;
				        		if (projectMasterList != null) {
					        		for (Iterator iterPj = projectMasterList.iterator(); iterPj.hasNext();) {
					        			ProjectModel pjModel = (ProjectModel) iterPj.next(); 
						        				
						        	%>
						        			<option value="<%=pjModel.getProject_code()%> - <%=pjModel.getYear()%>" >
							       			 	<%=pjModel.getProject_code()%> - <%=pjModel.getProject_name()%> - ปี <%=pjModel.getYear() %>
							       			</option>
						        	<%
						        			
			      						} 
									}
								%>
					   		</select> 
						</div>
					</div> 
			        <div class="cell colspan6"> 
			        	ค่าใช้จ่าย
				        <div class="input-control text full-size">
						    <select name="rockingBudgetForm.gcostcode" ng-model="gcostcode" id="gcostcode" ng-change="gcostcodechange()" required>
			    				<option value="">-- please Select --</option>
						    	<option ng-repeat="option in datas" value="{{option.gcostcode}}">{{option.gcostcode_name}}</option> 
						   	</select>
						</div>
					</div>    
			    </div>
			 </div> 
			 <div class="flex-grid">
			  	<div class="row flex-just-center" >
			    	<div class="cell colspan12" align="center">
						<button class="button success" type="submit" name="add" ng-click="rockbudgetform.$valid && addrequisition()" >อนุมัติการโยกงบประมาณ</button>
						 
					</div> 
			    </div>
			</div>
		 </form>  
		</div>  
		 
        <div class="example" data-text="รายการ">
            <table id="table_authen" class="cell-border hover display compact nowrap" cellspacing="0" width="100%">
                <thead>
                <tr>  
                	<th><label class="input-control small-check checkbox"> 
                		<input type="checkbox" id="checkAll" data-show="indeterminate" />
                		<span class="check"></span> 
                        </label> เลือกทั้งหมด</th>
                	<th>เลขที่เอกสาร</th>
                    <th>ค่าใช้จ่าย</th> 
                    <th>วันที่</th> 
                    <th> </th> 
                </tr>
                </thead> 
                  
                <tbody>
                <%
                List RockingBudgetDList = null;
                RockingBudgetApproveDB rbga = new RockingBudgetApproveDB();
                RockingBudgetDList = rbga.GetRockingBudgetDList("", "", "");
        		int x = 1, y = 0;
        		if(RockingBudgetDList != null){
        			
        			Iterator amIterate = RockingBudgetDList.iterator();
        			while(amIterate.hasNext()){
        				RockingBudgetForm anInfo = (RockingBudgetForm) amIterate.next();  
        		%>
        			<tr>
	        			<td class="tdhidden" align="center"><input type="checkbox" name="archk" value="<%=y%>" /> <%=x%></td>
	        			<td class="tdant" align="left"><%=anInfo.getDocno()%></td>  
	                    <td class="tdantn" align="left"><%=anInfo.getGcostcode()%></td>  
	                    <td class="tdantn" align="left"><%=anInfo.getDocdate()%></td>  
	                    <td align="center"><button class="button mini-button" type="button" onclick="javascript:getGcostcode('<%=anInfo.getDocno()%>','<%=anInfo.getProject_code()%>');"> <span class="mif-search"></span></button></td>
                	</tr>
        		<%		
        		x++;y++;
        			}
        			
        		}else{
        		%>
        			<tr>  
                    <td colspan="6" align="center">ไม่พบข้อมูล</td>   
                	</tr>
        		<%
        		}
                %>
                </tbody>
            </table>
        </div> <!-- End of example table -->  
         
   		<script>
   		function getGcostcode(projectcode, year) {
			var load = window.open('/pcpnru/window-groupcostcode-receive.jsp?projectcode='+projectcode+'&year='+year+' ','receive',
			             'scrollbars=yes,menubar=no,height=600,width=1280,resizable=yes,toolbar=no,location=yes,status=no');
		}
   		
        $(function(){
         	
        	
        	$("#project_code").select2();
			$("#gcostcode").select2();
        	
			$("#checkAll").change(function () {
       		    $("input:checkbox").prop('checked', $(this).prop("checked"));
       		});
			
        	var table = $('#table_authen').DataTable( { 
              	scrollY: '50vh', 
              	scrollX: true,
              	scrollCollapse: true, 
                ordering: false,
                "lengthMenu": [[14, 25, 50, 100, -1], [14, 25, 50, 100, "All"]] 
            } );
        	
            
        });
    	</script>
	</body>
</html>
