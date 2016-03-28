<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="pcpnru.inventoryModel.*" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>หมวดสินค้า</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width; initial-scale=1.0">
		
		<link rel="shortcut icon" href="/favicon.ico">
		<link href="css/metro.css" rel="stylesheet">
        <link href="css/metro-icons.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
		<link href="css/jquery.dataTables.min.css" rel="stylesheet">
		<link href="css/sweetalert.css" rel="stylesheet" />
		
		
	</head>
<body>
	<div><%@include file="topmenu.jsp" %></div>
	<form action="product.action" method="post">
		<div class="grid" >
			<div class="row cells12 " >
	 			<div class="cell colspan4"> </div>
	 			<div class="cell align-right colspan1"><h3>สินค้า </h3></div>
	 			<div class="cell colspan3"></div>
	 			<div class="cell colspan4">
				</div>
			</div>
			<div class="example" data-text="Add">
		        <div class="row cells12 ">
			 		<div class="cell colspan1"> </div>
			 		<div class="cell colspan4">
			 			รหัสสินค้า
			 			<div class="input-control text full-size"> 
			 				<s:textfield name="product.product_id" id="product_id" readonly="true"/>
			 			</div>
			 		</div>
			 		<div class="cell colspan4"> 
			 			ชื่อสินค้า
			 			<div class="input-control text full-size">
			 				<s:textfield name="product.product_name" id="product_name" required=""/>
			 			</div>
			 		</div>
			 		
			 	</div>
			 	<div class="row cells12 ">
			 		<div class="cell colspan1"> </div>
			 		<div class="cell colspan4">
			 			หน่วยนับ
			 			<div class="input-control text full-size"> 
			 				<s:hidden name="product.unit_id" id="unit_id" readonly="true"/>
			 				<s:textfield name="product.unit_name" id="unit_name" readonly="true"/>
			 				<div class="button-group">
						 	<button class="button primary" type="button" onclick="getunit()"> <span class="mif-search"></span></button>
							<button class="button danger" type="button" id="delete"><span class="mif-bin"></span></button>
							</div>
			 			</div>
			 		</div>
			 		<div class="cell colspan4"> 
			 			หมวดสินค้า
			 			<div class="input-control text full-size">
			 				<s:hidden name="product.progroup_id" id="progroup_id" readonly="true"/>
			 				<s:textfield name="product.progroup_name" id="progroup_name" required=""/>
			 				<div class="button-group">
						 	<button class="button primary" type="button" onclick="getprogroup()"> <span class="mif-search"></span></button>
							<button class="button danger" type="button" id="delete"><span class="mif-bin"></span></button>
							</div>
			 			</div>
			 			
			 		</div>
			 	</div>
			 	<div class="row cells12 ">
			 		<div class="cell colspan1"> </div>
			 		<div class="cell colspan4">
			 			ประเภทสินค้า
			 			<div class="input-control text full-size"> 
			 				<s:hidden name="product.protype_id" id="protype_id" readonly="true"/>
			 				<s:textfield name="product.protype_name" id="protype_name" readonly="true"/>
			 				<div class="button-group">
						 	<button class="button primary" type="button" onclick="getprotype()"> <span class="mif-search"></span></button>
							<button class="button danger" type="button" id="delete"><span class="mif-bin"></span></button>
							</div>
			 			</div>
			 		</div>
			 		<div class="cell colspan4"> 
			 			แบรนด์สินค้า
			 			<div class="input-control text full-size">
			 				<s:hidden name="product.brand_id" id="brand_id" readonly="true"/>
			 				<s:textfield name="product.brand_name" id="brand_name" required=""/>
			 				<div class="button-group">
						 	<button class="button primary" type="button" onclick="getbrand()"> <span class="mif-search"></span></button>
							<button class="button danger" type="button" id="delete"><span class="mif-bin"></span></button>
							</div>
			 			</div>
			 		</div>
			 	</div>
			 	<div class="row cells12 ">
			 	<div class="cell colspan4"> </div>
			 	<div class="cell colspan4">
			 		<button type="submit" class="button success" name="add" id="add"><span class="mif-plus mif-lg fg-white"></span></button>
					<button type="submit" class="button primary" name="update" id="update"><span class="mif-checkmark mif-lg fg-white"></span></button>
			 	</div>
			 	<div class="cell colspan4"> </div>
			 	</div>
		    </div>
			
		</div>
		
	 	<s:hidden name="product.alertmsg" id="alertmsg"/>
	 	<s:hidden name="product.fromwindow" id="fromwindow"/>
	</form>
	<div class="example" data-text="Display">
			    	<table id="table_progroup" class="cell-border hover display compact nowrap" cellspacing="0" width="100%">
		                <thead>
		                <tr>  
		                	<th>ลบข้อมูล <input type="checkbox" id="checkall"></th>
		                	<th>รหัสหมวดสินค้า</th>
		                	<th>ชื่อหมวดสินค้า</th>
		                    <th>วันที่เพิ่มข้อมูล</th>
		                    
		                </tr>
		                </thead> 
		                <tbody>
		                <%
			         		if(request.getAttribute("progroupList") != null){
			         			List<ProductGroupModel> progroupList = (List) request.getAttribute("progroupList");
			         			for(ProductGroupModel product:progroupList){
			         				
			         	%>		
			         			
									<tr>
										<td><input type="checkbox" name="delprogroup" id="delprogroup" value="<%=product.getProgroup_id() %>"> </td>
										<s:if test="%{#fromwindow=='true'}">
											<td class="progroup_id"><a href="#" class="returnid"><%=product.getProgroup_id() %></a></td>
										</s:if>
										<s:else>
											<td class="progroup_id"><%=product.getProgroup_id() %></td>
										</s:else>
					                	<td class="progroup_name"><%=product.getProgroup_name() %></td>
					                    <td><%=product.getCreate_datetime() %></td>
					                    
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


		<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/jquery.dataTables.min.js"></script>
	    <script src="js/sweetalert.min.js"></script>
   		
	    <script type="text/javascript">
	    function getunit() {
   			var load = window.open('/pcpnru/windows_entranc_unitMaster.action','pr',
   			             'scrollbars=yes,menubar=no,height=700,width=1280,resizable=yes,toolbar=no,location=yes,status=no');
   		}
	    function getprogroup() {
   			var load = window.open('/pcpnru/windows_entranc_productgroupmaster.action','pr',
   			             'scrollbars=yes,menubar=no,height=700,width=1280,resizable=yes,toolbar=no,location=yes,status=no');
   		}
	    function getprotype() {
   			var load = window.open('/pcpnru/windows_entranc_protypemaster.action','pr',
   			             'scrollbars=yes,menubar=no,height=700,width=1280,resizable=yes,toolbar=no,location=yes,status=no');
   		}
	    function getbrand() {
   			var load = window.open('/pcpnru/windows_entranc_brandmaster.action','pr',
   			             'scrollbars=yes,menubar=no,height=700,width=1280,resizable=yes,toolbar=no,location=yes,status=no');
   		}
		$(function(){
			if($("#alertmsg").val() != ""){
        		swal("Error",$("#alertmsg").val() , "error");
        	}
			var table = $('#table_progroup').DataTable( { 
         		scrollY: '39vh',
         		scrollX: true, 
         		scrollCollapse: true,
                ordering: false,
                "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]] 
            } );
			$(".returnid").click(function(){
				
				var index = $(this).index(".returnid");

				window.opener.document.getElementById("progroup_id").value= $(this).text();
				window.opener.document.getElementById("progroup_name").value= $(".progroup_name").eq(index).text();
				
				window.close();
			});
			$("#checkall").click(function(){
				if($(this).prop("checked")){
					$('[name="delprogroup"]').prop("checked",true);
				}else{
					$('[name="delprogroup"]').prop("checked",false);
				}
			});
			
			$("#delete").click(function(){
				$("#progroup_name").val("-");
			});
			$('#table_progroup tbody').on( 'click', 'tr', function () {
		        if ( $(this).hasClass('selected') ) {
		            $(this).removeClass('selected');
		            $("#progroup_id").val("");
		            $("#progroup_name").val("");
		        }
		        else {
		            table.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected');
		            var $index = $(this).index();
		            $("#progroup_id").val($(".progroup_id").eq($index).text());
		            $("#progroup_name").val($(".progroup_name").eq($index).text());
		        }
		    });
			
		});
		</script>
</body>
</html>