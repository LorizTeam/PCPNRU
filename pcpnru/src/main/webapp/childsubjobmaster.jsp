<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="pcpnru.projectData.*" %>
<%@ page import="pcpnru.projectModel.*" %>
<%@ page import="pcpnru.utilities.*" %>
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
		<title>สร้าง กิจกรรมย่อย</title>
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
		 <%@include file="topmenu.jsp" %>
		 <h3 class="align-center">สร้างชื่อกิจกรรมย่อย</h3>
		 <html:form action="/subjobMaster" method="post">
		 <div class="example" data-text="รายละเอียด">
         <div class="grid">
		  	<div class="row cells12">
		  		<div class="cell colspan2"> 
		        	รหัส-ชื่อ กิจกรรม
			        <div class="input-control text full-size">
					    <select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>0001 - งบบุคลากร</option>
					        <option>0001 - งบดำเนินการ</option>
					        <option>0001 - หมวดรายจ่ายอื่น ๆ</option>
					    </select>
					</div>
				</div>
		  		<div class="cell  colspan2"> 
		        	รหัสกิจกรรมย่อย
			        <div class="input-control text full-size">
					    <input type="text" id="subjobcode" name="subjobCode">
					</div>
					<input type="hidden" id="subjobcodehd" name="subjobCodeHD">
				</div>
		        <div class="cell  colspan3"> 
		        	ชื่อกิจกรรมย่อย
			        <div class="input-control text full-size"> 
					    <input type="text" id="subjobname" name="subjobName">
					</div>
				</div> 
				<div class="cell colspan5"><br>
					<button class="button success" type="submit" name="add">สร้างชื่อกิจกรรมย่อย</button> 
				  	<button class="button primary" type="submit" name="update">แก้ไขชื่อกิจกรรมย่อย</button> 
				  	<button class="button danger" type="submit" name="delete">ลบชื่อกิจกรรม</button>
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
