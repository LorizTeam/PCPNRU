<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="pcpnru.projectModel.*" %>
<%@ page import="pcpnru.projectData.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>หน้ารายละเอียดการรับ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
  	<%	List SelectReceiveList1 = null;
		if (request.getAttribute("SelectReceiveList") == null) {
  		Receive1DB receL = new Receive1DB();
  			SelectReceiveList1 = receL.GetSelectReceiveList("", "", "", "", "", "");
		}else{
			SelectReceiveList1 = (List) request.getAttribute("SelectReceiveList");
		}
  	%>
  
    <div><%@include file="topmenu.jsp" %></div>
	<br>
	
	<form id="receive-2" action="selectReceive2.action" method="post">
		<input type="hidden" id="docno" name="docno">
		<input type="hidden" id="project" name="project">
		<input type="hidden" id="cost" name="cost">
		<input type="hidden" id="datetime" name="datetime">
		<input type="hidden" id="amountfrom" name="receiveform.amountfrom">
		<input type="hidden" id="local" name="receiveform.local">
	</form>
	
	<div class="example" data-text="รายการ">
            <table id="table_receives2" class="dataTable striped border bordered" data-role="datatable" data-searching="true">
                <thead>
                <tr>  
                	<th>เลขที่</th>
                	<th>เลขที่เอกสาร</th>
                	<th>โครงการ</th>
                    <th>ค่าใช้จ่าย</th>
                    <th>วันที่</th>
                    <th>ได้รับเงินจาก</th>
                    <th>สถานที่</th>
                </tr>
                </thead> 
                  
                 <tbody>
                 <%		List SelectReceiveList = SelectReceiveList1;
                 		if (SelectReceiveList != null) {
						int x = 0;
						for (Iterator iter = SelectReceiveList.iterator(); iter.hasNext();) {
						x++; 
						ReceiveForm receiveMaster = (ReceiveForm) iter.next();
				%>
                <tr>  
                    <td align="center"><%=x%></td> 
                    <td class="tddocno" align="left"><%=receiveMaster.getDocNo()%></td>
                    <td class="tdproject" align="left"><%=receiveMaster.getProject()%></td>  
                    <td class="tdcost" align="left"><%=receiveMaster.getCost()%></td> 
                    <td class="tddatetime" align="center"><%=receiveMaster.getDocdate()%></td> 
                    <td class="tdamountfrom" align="left"><%=receiveMaster.getAmountfrom()%></td> 
                    <td class="tdlocal" align="left"><%=receiveMaster.getLocal()%></td> 
                </tr>
                 <% 	} %>
                
                <%} else { %>
                <tr> 
                    <td colspan="6">ไม่พบข้อมูล</td> 
                </tr> 
                <%	} %> 
                </tbody>
            </table>
        </div> <!-- End of example table --> 
        
<script>
$(function(){
	$('#table_receives2 tbody').on( 'click', 'tr', function () {
		$(this).addClass('selected');
        var $index = $(this).index();
        
        var docno = $(".tddocno").eq($index).text();
        var projectname = $(".tdproject").eq($index).text();
	    var costname = $(".tdcost").eq($index).text();
	    var datetime = $(".tddatetime").eq($index).text();
	    var amountfrom = $(".tdamountfrom").eq($index).text();
	    var local = $(".tdlocal").eq($index).text();
        
	    $("#project").val(projectname);
	 	$("#docno").val(docno);
	 	$("#cost").val(costname);
	 	$("#datetime").val(datetime);
	 	$("#amountfrom").val(amountfrom);
	 	$("#local").val(local);
	 	
	 	$("#receive-2").submit();
	   	
		});
	});	
</script>
  </body>
</html>
