<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="pcpnru.projectData.*" %>
<%@ page import="pcpnru.projectModel.*" %>
<%@ page import="pcpnru.utilities.*" %>
<%
	ChildSubjobMasterDB childsubjM = new ChildSubjobMasterDB();
	List childSubjobMasterList = childsubjM.GetChildSubjobMasterList("","","");
	
	SubjobMasterDB subjM = new SubjobMasterDB();
	List subjobDropDown = subjM.SubjobDropDown("","");
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
		 <form action="childSubjobMaster.action" method="post">
		 <div class="example" data-text="รายละเอียด">
         <div class="grid">
		  	<div class="row cells12">
		  		<div class="cell colspan2"> 
		        	รหัส-ชื่อ กิจกรรม
			        <div class="input-control text full-size">
					    <select id="subjobcode" name="subjobcode" data-validate-func="required" data-validate-hint="กรุณาเลือกโครงการที่รับ">
						   <option value="">โปรดเลือก</option>
						   <% 
			        		if (subjobDropDown != null) {
				        		for (Iterator iterSj = subjobDropDown.iterator(); iterSj.hasNext();) {
				        			SubjobMasterForm sjInfo = (SubjobMasterForm) iterSj.next();
		      				%>  
			      			<option value="<%=sjInfo.getSubjobCode()%> - <%=sjInfo.getSubjobName()%>" >
			       			 	<%=sjInfo.getSubjobCode()%> - <%=sjInfo.getSubjobName()%>
			       			</option>
							<%		} 
			        			}
							%>
					   </select>
					</div>
					<s:hidden id="subjobcodehd" name="childSubjobMaster.subjobcodehd" />
				</div>
		  		<div class="cell  colspan2"> 
		        	รหัสกิจกรรมย่อย
			        <div class="input-control text full-size"> 
					    <s:textfield id="childsubjobcode" name="childSubjobMaster.childsubjobcode" required="" />
					    <s:hidden id="childsubjobcodehd" name="childSubjobMaster.childsubjobcodehd" />
					</div> 
				</div>
		        <div class="cell  colspan3"> 
		        	ชื่อกิจกรรมย่อย
			        <div class="input-control text full-size"> 
			       	 	<s:textfield id="childsubjobname" name="childSubjobMaster.childsubjobname" required="" /> 
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
            <table id="table_childsubjob" class="dataTable striped border bordered" data-role="datatable" data-searching="true">
                <thead>
                <tr> 
                	<th>เลขที่</th>
                    <th>รหัส-ชื่อ กิจกรรม</th>
                    <th>รหัส-กิจกรรมย่อย</th> 
                    <th>ชื่อ-กิจกรรมย่อย</th>
                    <th>วันที่-กิจกรรมย่อย</th> 
                </tr>
                </thead> 
                  
                <tbody>
                <%	if (childSubjobMasterList != null) {
						int x = 0;
						for (Iterator iter = childSubjobMasterList.iterator(); iter.hasNext();) {
						x++; 
						ChildSubjobMasterForm cSubjMaster = (ChildSubjobMasterForm) iter.next();
				%>
                <tr> 
                    <td align="center"><%=x%></td>
                    <td class="tdsubjobcode" align="center"><%=cSubjMaster.getSubjobcode()%> - <%=cSubjMaster.getSubjobname()%></td>
                    <td class="tdchildsubjobcode" align="center"><%=cSubjMaster.getChildsubjobcode()%></td>  
                    <td class="tdchildsubjobname" align="center"><%=cSubjMaster.getChildsubjobname()%></td> 
                    <td align="center"><%=cSubjMaster.getDateTime()%></td>
                </tr>	  
                <% 	} %>
                
                <%} else { %> 
                	<tr> 
                    <td colspan="4">ไม่พบข้อมูล</td> 
                	</tr> 
                <%	} %>
                </tbody>
            </table>
        </div> <!-- End of example table -->  
        </form>
     
   		<script>
        $(document).ready(function() {
    	var table = $('#table_childsubjob').DataTable(); 
		$('#table_childsubjob tbody').on( 'click', 'tr', function () { 
	        if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
	            $("#subjobcode").val("");
	            $("#subjobcodehd").val("");
	            $("#childsubjobcode").val("");
	            $("#childsubjobcodehd").val("");
	            $("#childsubjobname").val("");
	        }
	        else {
	            table.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	            var $index = $(this).index();
	            $("#subjobcode").val($(".tdsubjobcode").eq($index).text());
	            $("#subjobcodehd").val($(".tdsubjobcode").eq($index).text());
	            $("#childsubjobcode").val($(".tdchildsubjobcode").eq($index).text());
	            $("#childsubjobcodehd").val($(".tdchildsubjobcode").eq($index).text());
	            $("#childsubjobname").val($(".tdchildsubjobname").eq($index).text());
	        }
	    });
	} );
    	</script>
	</body>
</html>
