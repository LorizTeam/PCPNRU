<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%@ page import="pcpnru.projectModel.*" %>
<%@ page import="pcpnru.projectData.*" %>
<%
	if(session.getAttribute("username") == null)response.sendRedirect("login.jsp");

%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>ร่างรายละเอียดโครงกา</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width; initial-scale=1.0">
		
		<link rel="shortcut icon" href="/favicon.ico">
		<link href="css/metro.css" rel="stylesheet">
        <link href="css/metro-icons.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
		<link href="css/docs.css" rel="stylesheet"> 
	 	<link href="css/select2.css" rel="stylesheet">
		
	 	<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/docs.js"></script>
        <script src="js/jquery.dataTables.min.js"></script>
  		<script src="js/select2.js"></script>
  		<script src="js/angular.min.js"></script>
	</head>

	<body>
		 <div><%@include file="topmenu.jsp" %></div>
		 <h3 class="align-center">ร่างรายละเอียดโครงการ</h3>
		 <div class="example" data-text="รายละเอียด">
		 <form action="projecthd.action" method="post">
         <div class="grid">
		  	<div class="row cells12">
		        <div class="cell colspan4"> 
		        	รหัส-ชื่อ โครงการ
			        <div class="input-control text full-size">
					    <select id="project_code" name="project_code" required>
					    	<option value="">-- โปรดเลือก --</option>
					    	<%
					    	ProjectMasterDB projM = new ProjectMasterDB();
					    	Iterator projectmasterIterate = projM.GetProjectMasterList("", "").iterator();
					    	while(projectmasterIterate.hasNext()){
					    		ProjectMasterForm projectmasterForm = (ProjectMasterForm) projectmasterIterate.next();
					    	%>
					    	<option value="<%=projectmasterForm.getProjectCode()%>"><%=projectmasterForm.getProjectCode()%> - <%=projectmasterForm.getProjectName()%></option>
					    	
					    	<%
					    	}
					    	%>
					    </select>
					</div>
				</div>
		        <div class="cell colspan3"> 
		        	เป้าหมาย
			        <div class="input-control text full-size">
			        
					    <s:textfield type="text" name="projectmodel.target" id="target" required=""/>
					</div>
				</div>
		        <div class="cell colspan2"> 
		        	ปี
			        <div class="input-control text full-size">
					    <s:textfield type="text" name="projectmodel.year" id="year" required=""/>
					</div>
				</div>
				
		    </div>
		    <div class="row cells12">
		    	<div class="cell colspan12 align-center"><br>
			        	<button class="button success" type="submit" name="submit">จัดทำงบประมาณ</button> 
			        	<button class="button primary" type="submit"  name="update">แก้ไขงบประมาณ</button>
			        	<button class="button danger" type="submit"  name="delete">ลบงบประมาณ</button>
				</div> 
		    </div>
		 </div>
		 </form>  
		</div>  
		 
        <div class="example" data-text="รายการ" ng-app="" ng-init="">
            <table id="table_project" class="dataTable striped border bordered" data-role="datatable" data-searching="true">
                <thead>
                <tr> 
                    <th>รหัส-โครงการ</th>
                    <th>ชื่อ-โครงการ</th>
                    <th>ประจำปี</th>
                    <th>เป้าหมาย-โครงการ</th>  
                    <th></th>  
                </tr>
                </thead> 
                  
                <tbody>
                <%
                ProjectData pjdata = new ProjectData();
                Iterator pjIterate = pjdata.GetProjectHDList().iterator();
                while(pjIterate.hasNext()){
                	ProjectModel pjmodel = (ProjectModel) pjIterate.next();
               	%>
               	<tr> 
                    <td class="tdproject_code" align="center"><%=pjmodel.getProject_code()%></td>
                    <td align="left"><%=pjmodel.getProject_name() %></td>
                    <td class="tdyear" align="center"><%=pjmodel.getYear() %></td>
                    <td class="tdtarget" align="right" width="16%">{{<%=pjmodel.getTarget() %> | currency:"฿"}}</td> 
                    <td class="align-center" ><a href="projectdt.jsp?projectcode=<%=pjmodel.getProject_code()%>&year=<%=pjmodel.getYear()%>"  class="toolbar-button"><span class="mif-pencil"></span></a></td>  
                </tr>               	
               	<%
                }
                %>
                
                </tbody>
            </table>
        </div> 
        
        <!-- End of example table -->  
        
        
   		<script>
	   		$(function(){
		       var selectproject_code =  $("#project_code").select2();
		        
		        var target = "";
		        var table = $('#table_project').dataTable();
		        $('#table_project tbody').on( 'click', 'tr', function () { 
	    	        if ( $(this).hasClass('selected') ) {
	    	            $(this).removeClass('selected');
	    	            $("#target").val("");
	    	            $("#year").val("");
	    	            selectproject_code.val("").trigger("change");
	    	        }else{
	    	            table.$('tr.selected').removeClass('selected');
	    	            $(this).addClass('selected');
	    	            var $index = $(this).index();
	    	            
	    	            $("#year").val($(".tdyear").eq($index).text());
	    	            
	    	            var target = $(".tdtarget").eq($index).text();
	    	            target = target.replace(/฿/g,"").replace(/,/g,"");
	    	            $("#target").val(target);
	    	            
	    	            selectproject_code.val($(".tdproject_code").eq($index).text()).trigger("change");
	    	        }
		    	});
	   		});
    	</script>
	</body>
</html>
