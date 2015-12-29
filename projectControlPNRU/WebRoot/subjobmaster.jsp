<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%> 
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import="pnru.data.SubjobMasterDB" %>
<%@ page import="pnru.form.SubjobMasterForm" %>
<%@ page import="pnru.util.DBConnect" %>
<%
	List subjobMasterList1 = null;
	if (request.getAttribute("SubjobMasterList") == null) {
	SubjobMasterDB subjM = new SubjobMasterDB();
	subjobMasterList1 = subjM.GetSubjobMasterList("","");
	}else{
	subjobMasterList1 = (List) request.getAttribute("subjobMasterList");
	}
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>สร้าง กิจกรรม</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width; initial-scale=1.0">
		
		<link rel="shortcut icon" href="/favicon.ico">
		<link href="css/metro.css" rel="stylesheet">
        <link href="css/metro-icons.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
		<link href="css/docs.css" rel="stylesheet"> 
	 
		<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/docs.js"></script>
	    <script src="js/prettify/run_prettify.js"></script>
	    <script src="js/ga.js"></script> 
 		<script src="js/jquery.dataTables.min.js"></script>
	</head>

	<body>
		 <div><%@include file="topmenu.jsp" %></div>
		 <br>
		 <html:form action="/subjobMaster" method="post">
		 <div class="example" data-text="รายละเอียด">
         <div class="grid">
		  	<div class="row cells4">
		  		<div class="cell"> 
		        	รหัส-ชื่อ กิจกรรม
			        <div class="input-control text full-size">
					    <input type="text" id="subjobcode" name="subjobCode">
					</div>
					<input type="hidden" id="subjobcodehd" name="subjobCodeHD">
				</div>
		        <div class="cell"> 
		        	ชื่อกิจกรรม
			        <div class="input-control text full-size"> 
					    <input type="text" id="subjobname" name="subjobName">
					</div>
				</div> 
				<div class="cell"><br>
					  <button class="button success" type="submit" name="add">เพิ่ม</button> 
					  <button class="button success" type="submit" name="update">แก้ไข</button> 
					  <button class="button success" type="submit" name="delete">ลบ</button>
				</div> 
		    </div>
		 </div>  
		</div>  
		 
        <div class="example" data-text="รายการ">
            <table id="table_subjob" class="dataTable striped border bordered" data-role="datatable" data-searching="true">
                <thead>
                <tr> 
                	<th>เลขที่</th>
                    <th>รหัส-กิจกรรม</th>
                    <th>ชื่อ-กิจกรรม</th> 
                </tr>
                </thead> 
                  
                <tbody>
                <%	if (subjobMasterList1 != null) {
						List subjobMasterList = subjobMasterList1;
						int x = 0;
						for (Iterator iter = subjobMasterList.iterator(); iter.hasNext();) {
						x++; 
						SubjobMasterForm subjMaster = (SubjobMasterForm) iter.next();
				%>
                <tr> 
                    <td align="center"><%=x%></td>
                    <td class="tdsubjobcode" align="center"><%=subjMaster.getSubjobCode()%></td>
                    <td class="tdsubjobname" align="center"><%=subjMaster.getSubjobName()%></td>  
                </tr>	  
                <% 	} %>
                
                <%} else { %> 
                	<tr> 
                    <td colspan="3">ไม่พบข้อมูล</td> 
                	</tr> 
                <%	} %>
                </tbody>
            </table>
        </div> <!-- End of example table -->  
        </html:form>
     
   		<script>
        $(document).ready(function() {
    	var table = $('#table_subjob').DataTable(); 
		$('#table_subjob tbody').on( 'click', 'tr', function () { 
	        if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
	            $("#subjobcode").val("");
	            $("#subjobcodehd").val("");
	            $("#subjobname").val("");
	        }
	        else {
	            table.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	            var $index = $(this).index();
	            $("#subjobcode").val($(".tdsubjobcode").eq($index).text());
	            $("#subjobcodehd").val($(".tdsubjobcode").eq($index).text());
	            $("#subjobname").val($(".tdsubjobname").eq($index).text());
	        }
	    });
	} );
    	</script>
	</body>
</html>
