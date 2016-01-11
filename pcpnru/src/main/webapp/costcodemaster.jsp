<%@page import="com.mysql.jdbc.IterateBlock"%>
<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="pcpnru.projectModel.*" %>
<%@ page import="pcpnru.projectData.*" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>สร้าง รายการค่าใช้จ่าย</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width; initial-scale=1.0">
		
		<link rel="shortcut icon" href="/favicon.ico">
		<link href="css/metro.css" rel="stylesheet">
        <link href="css/metro-icons.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
		
	 	<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
        <script src="js/jquery.dataTables.min.js"></script>
  		
	</head>

	<body>
		 <div><%@include file="topmenu.jsp" %></div>
		 <h3 class="align-center">สร้าง รายการค่าใช้จ่าย</h3>
		 <div class="example" data-text="รายละเอียด">
		 <form action="costcodeMaster.action" method="post">
	         <div class="grid">
			  	<div class="row cells12">
			  		<div class="cell colspan2"> 
			        	รหัส รายการค่าใช้จ่าย
				        <div class="input-control text full-size">
						    <s:textfield name="costcodemasterform.costCode" id="costCode" required=""/>
						    <s:hidden name="costcodemasterform.costCodeHD" id="costCodeHD"/>
						</div>
					</div>
			        <div class="cell colspan4"> 
			        	 รายการค่าใช้จ่าย
				        <div class="input-control text full-size">
						    <s:textfield name="costcodemasterform.costName" id="costName" required=""/>
						</div>
					</div> 
					<div class="cell colspan6"><br>
						  <button class="button success" name="add">สร้างชื่อรายการค่าใช้จ่าย</button> 
						  <button class="button primary" name="update">แก้ไขชื่อรายการค่าใช้จ่าย</button> 
						  <button class="button danger" name="delete">ลบชื่อรายการค่าใช้จ่าย</button> 
					</div> 
			    </div>
			 </div>
		 </form>  
		</div>  
		 
        <div class="example" data-text="รายการ">
            <table id="table_project" class="dataTable striped border bordered" data-role="datatable" data-searching="true">
                <thead>
                <tr>  
                    <th>รหัส-รายการค่าใช้จ่าย</th>
                    <th>ชื่อ-รายการค่าใช้จ่าย</th> 
                    <th>วันเวลา-รายการค่าใช้จ่าย</th>
                </tr>
                </thead> 
                  
                <tbody>
                <%
                List costCodeMasterList = null;
                CostCodeMasterDB ccM = new CostCodeMasterDB();
        		costCodeMasterList = ccM.GetCostCodeMasterList("", "");
        		if(costCodeMasterList != null){
        			
        			Iterator costcodeIterate = costCodeMasterList.iterator();
        			while(costcodeIterate.hasNext()){
        				CostCodeMasterForm ccInfo = (CostCodeMasterForm) costcodeIterate.next();
        				
        				
        		%>
        			<tr>  
                    <td class="tdcostCode" align="center"><%=ccInfo.getCostCode()%></td>
                    <td class="tdcostName" align="center"><%=ccInfo.getCostName()%></td>   
                    <td align="center"><%=ccInfo.getDateTime()%></td>
                	</tr>
        		<%		
        			}
        			
        		}else{
        		%>
        			<tr>  
                    <td colspan="2" align="center">No data found</td>   
                	</tr>
        		<%
        		}
                %>
                </tbody>
            </table>
        </div> <!-- End of example table -->  
         
   		<script>
        $(function(){
        	var table = $('#table_project').dataTable();
            $('#table_project tbody').on( 'click', 'tr', function () { 
    	        if ( $(this).hasClass('selected') ) {
    	            $(this).removeClass('selected');
    	            $("#costCode").val("");
    	            $("#costCodeHD").val("");
    	            $("#costName").val("");
    	        }
    	        else {
    	            table.$('tr.selected').removeClass('selected');
    	            $(this).addClass('selected');
    	            var $index = $(this).index();
    	            $("#costCode").val($(".tdcostCode").eq($index).text());
    	            $("#costCodeHD").val($(".tdcostCode").eq($index).text());
    	            $("#costName").val($(".tdcostName").eq($index).text());
    	        }
    	    });
        });
    	</script>
	</body>
</html>
