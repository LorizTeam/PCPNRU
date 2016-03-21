<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="InformationModel.*" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>บันทึกข้อความขออนุมัติดำเนินการ</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width; initial-scale=1.0">
		
		<link rel="shortcut icon" href="/favicon.ico">
		<link href="css/metro.css" rel="stylesheet">
        <link href="css/metro-icons.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
		<link href="css/jquery.dataTables.min.css" rel="stylesheet">
		
		<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/jquery.dataTables.min.js"></script>
	</head>
	<body>
		<s:set name="fromwindow" value="vendermodel.fromwindow"/>
		
		<s:if test="%{#fromwindow=='true'}">
			<div><%@include file="window-topmenu.jsp" %></div>
		</s:if>
		<s:else>
			<div><%@include file="topmenu.jsp" %></div>
		</s:else>
		
		<form action="vender.action" method="post">
			<div class="grid" >
				 <div class="row cells12 " >
		 			<div class="cell align-center colspan2">
	         	 	</div>
	         	 	<div class="cell align-center colspan3">
	         	 	</div>
		 			<div class="cell align-left colspan5"><h3>ข้อมูลผู้ขาย </h3></div>
		 			<div class="cell align-left colspan2">
					</div>
				</div>
			    <div class="example" data-text="Add">
			        <div class="row cells12 ">
				 		<div class="cell colspan1"> </div>
				 		<div class="cell colspan4">
				 			รหัสผู้ขาย
				 			<div class="input-control text"> 
				 				<s:textfield name="vendermodel.vender_id" id="vender_id" readonly="true"/>
				 			</div>
				 		</div>
				 		<div class="cell colspan4"> 
				 			ชื่อของผู้ขาย
				 			<div class="input-control text">
				 				<s:textfield name="vendermodel.vender_name" id="vender_name" required=""/>
				 			</div>
				 			
				 			<button type="submit" class="button success" name="add" id="add"><span class="mif-plus mif-lg fg-white"></span></button>
				 			<button type="submit" class="button primary" name="update" id="update"><span class="mif-checkmark mif-lg fg-white"></span></button>
				 		</div>
				 		
				 	</div>
			    </div>
			    <div class="example" data-text="Display">
			    	<table id="table_vender" class="cell-border hover display compact nowrap" cellspacing="0" width="100%">
		                <thead>
		                <tr>  
		                	<th>ลบข้อมูล <input type="checkbox" id="checkall"></th>
		                	<th>รหัสผู้ขาย</th>
		                	<th>ชื่อผู้ขาย</th>
		                    <th>วันที่เพิ่มข้อมูล</th>
		                    
		                </tr>
		                </thead> 
		                <tbody>
		                <%
			         		if(request.getAttribute("venderList") != null){
			         			List venderList = (List) request.getAttribute("venderList");
			         			for(Iterator venderIter = venderList.iterator();venderIter.hasNext();){
			         				VenderModel vendermodel = (VenderModel) venderIter.next();
			         	%>		
			         			
									<tr>
										<td> <input type="checkbox" name="delvender" id="delvender" value="<%=vendermodel.getVender_id() %>"> </td>
										<s:if test="%{#fromwindow=='true'}">
											<td class="vender_id"><a href="#"><%=vendermodel.getVender_id() %></a></td>
										</s:if>
										<s:else>
											<td class="vender_id"><%=vendermodel.getVender_id() %></td>
										</s:else>
					                	<td class="vender_name"><%=vendermodel.getVender_name() %></td>
					                    <td><%=vendermodel.getCreate_datetime() %></td>
					                    
					                </tr>
								
			         	<%
			         			}
			         		}
			         	%>
		                
		                </tbody>
		           	</table>
		           	<div class="row cells12 ">
				 		<div class="cell colspan4"> </div>
				 		<div class="cell colspan4"> 
				 			<button type="submit" class="button danger" name="delete" id="delete"><span class="mif-minus mif-lg fg-white"></span></button>
				 		</div>
				 		
				 	</div>
			    </div> 
		 	</div>
		 	<s:hidden name="vendermodel.alertmsg" id="alertmsg"/>
		 	<s:hidden name="vendermodel.fromwindow" id="alertmsg"/>
		</form>
		
		<script type="text/javascript">
		
		
		$(function(){
			if($("#alertmsg").val() != ""){
        		swal("Error",$("#alertmsg").val() , "error");
        	}
			var table = $('#table_vender').DataTable( { 
         		scrollY: '39vh',
         		scrollX: true, 
         		scrollCollapse: true,
                ordering: false,
                "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]] 
            } );
			$("a").click(function(){
				var index = $(this).index();
				
				window.opener.document.getElementById("vender_id").value= $("a").eq(index).text();
				window.opener.document.getElementById("vender_name").value= $(".vender_name").eq(index).text();
				window.close();
			});
			$("#checkall").click(function(){
				if($(this).prop("checked")){
					$('[name="delvender"]').prop("checked",true);
				}else{
					$('[name="delvender"]').prop("checked",false);
				}
			});
			
			$("#delete").click(function(){
				$("#vender_name").val("-");
			});
			$('#table_vender tbody').on( 'click', 'tr', function () {
		        if ( $(this).hasClass('selected') ) {
		            $(this).removeClass('selected');
		            $("#vender_id").val("");
		            $("#vender_name").val("");
		        }
		        else {
		            table.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected');
		            var $index = $(this).index();
		            $("#vender_id").val($(".vender_id").eq($index).text());
		            $("#vender_name").val($(".vender_name").eq($index).text());
		        }
		    });
			
		});
		</script>
	</body>
</html>