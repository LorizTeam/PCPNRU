<%@page import="com.mysql.jdbc.IterateBlock"%>
<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="pcpnru.masterModel.*" %>
<%@ page import="pcpnru.masterData.*" %>
<%@ page import="pcpnru.projectData.*" %>
<%@ page import="pcpnru.projectModel.*" %>
<%@ page import="pcpnru.utilities.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	if(session.getAttribute("username") == null)response.sendRedirect("login.jsp");

	String docno = "";

	RecordApproveDB ra = new RecordApproveDB();
	if(request.getAttribute("docno") == null){
		docno = ra.SelectUpdateDocNo("pr");
	}else{
		docno = (String) request.getAttribute("docno");
	}
	DateUtil dateUtil = new DateUtil();
	String month = dateUtil.curMonth();
    String year = dateUtil.curYear(); 

%>
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
		<link href="css/bootstrap-datepicker3.css" rel="stylesheet"> 
		<link href="css/jquery.dataTables.min.css" rel="stylesheet">
		
	 	<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
        <script src="js/jquery.dataTables.min.js"></script> 
  		<script src="js/bootstrap-datepicker-th.js"></script>
	</head>

	<body>
		 <div><%@include file="topmenu.jsp" %></div>
		 <h3 class="align-center">บันทึกข้อความ</h3>
		 <form action="recordApprove.action" method="post"> 
		 <div class="example" data-text="ส่วนแรก">
		 
	         <div class="grid">
	         	<div class="row cells12">
	         		<div class="cell colspan1"> </div> 
					<div class="cell colspan6"> 
			        	ส่วนราชการ
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_hd" id="record_approve_hd" required=""/> 
						</div>
					</div> 
					<div class="cell align-right colspan4"> 
			        	<p class="sub-header fg-black">เลขที่เอกสาร
			        	<%=docno%></p>
				        <input type="hidden" name="docno" id="docno" value="<%=docno%>" />
				        <input type="hidden" name="year" id="year" value="<%=year%>" />
					</div>   
	         	</div>
	         	<div class="row cells12">
	         		<div class="cell colspan1"> </div>
	         		<div class="cell colspan4"> 
			        	ที่
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_t" id="record_approve_t" required=""/> 
						</div>
					</div> 
	         		<div class="cell colspan2"> 
			        	วันที่
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_date" id="record_approve_date" required=""/>
						</div>
					</div>  
	         	</div>
	         	<div class="row cells12">
	         		<div class="cell colspan1"> </div>
	         		<div class="cell colspan10"> 
			        	เรื่อง
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_title" id="record_approve_title" required=""/> 
						</div>
					</div>  
	         	</div>
	         	<div class="row cells12">
	         		<div class="cell colspan1"> </div>
	         		<div class="cell colspan4"> 
			        	เรียน
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_rian" id="record_approve_rian" required=""/> 
						</div>
					</div>  
	         	</div>
			  	<div class="row cells12">
			  		<div class="cell colspan1"> </div>
			  		<div class="cell colspan10"> 
			  			<div class="input-control textarea full-size"
						    data-role="input" data-text-auto-resize="true">
						    <textarea name="record_approve_des1"></textarea>
						</div>
			  		</div>  
			    </div> 
			 </div> 
		 
		</div>  
		
		<div class="example" data-text="รายการ"> 
	         <div class="grid">
	         	<div class="row cells12">
	         		<div class="cell colspan1"> </div> 
					<div class="cell colspan5"> 
			        	รายการ
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.description" id="description"  /> 
						</div>
					</div>      
	         		<div class="cell colspan1"> 
			        	จำนวน
				        <div class="input-control text full-size" dir="rtl">
						    <s:textfield type="number" name="recordApproveModel.qty" id="qty" /> 
						</div>
					</div> 
	         		<div class="cell colspan1"> 
			        	หน่วย
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.unit" id="unit"  />
						</div>
					</div>  
	         	 	<div class="cell align-left colspan3"><br>
						  <button type="button" class="button success" id="add">เพิ่ม</button> 
						  <button class="button primary" name="update">แก้ไข</button> 
						  <button class="button danger" name="delete">ลบ</button> 
					</div>
			 	</div>  
			</div>
		</div> 
		
        <div class="example selectRA" data-text="รายการ">
            <table id="table_ra" class="cell-border hover display compact nowrap" cellspacing="0" width="100%">
                <thead>
                <tr>  
                	<th>ลำดับ</th>
                	<th>รายละเอียด</th>
                    <th>จำนวน</th>
                    <th>หน่วย</th> 
                </tr>
                </thead> 
                  
                <tbody>
                <%
                List ListRecordApproveDT = null; 
                
                ListRecordApproveDT = ra.ListRecordApproveDT(docno,month, year);
        		int x = 1;
        		if(ListRecordApproveDT != null){
        			
        			Iterator Iterate = ListRecordApproveDT.iterator();
        			while(Iterate.hasNext()){
        				RecordApproveModel raInfo = (RecordApproveModel) Iterate.next();  
        		%>
        			<tr> 
	        			<td align="left"><%=x%></td>
	        			<td class="tddescription" align="left"><%=raInfo.getDescription()%></td>  
	                    <td class="tdqty" align="right"><%=raInfo.getQty()%></td>
	                    <td class="tdunit" align="left"><%=raInfo.getUnit()%></td>
                	</tr>
        		<%		
        		x++;
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
		
		<div class="example" data-text="ส่วนที่สอง"> 
	         <div class="grid">
	         	<div class="row cells12">
	         		<div class="cell colspan1"> </div>  
			  		<div class="cell colspan10"> 
			  			<div class="input-control textarea full-size"
						    data-role="input" data-text-auto-resize="true">
						    <textarea name="record_approve_des2"></textarea>
						</div>
			  		</div>   
			 	</div>  
			 	<div class="row cells12">
	         		<div class="cell colspan1"> </div>  
			  		<div class="cell colspan5"> 
			        	ชื่อ ผู้ออกใบบันทึกข้อความ
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_cen" id="record_approve_cen" required=""/>
						</div>
					</div>  
					<div class="cell colspan5 sub-alt-header fg-crimson" ><br>
						ตัวอย่าง เช่น (นาย,นาง,นางสาว,ศาสตราจารย์,รองศาสตราจารย์,ดร.ชื่อ นามสกุล)
					</div>
			 	</div>
			 	<div class="row cells12">
	         		<div class="cell colspan1"> </div>  
			  		<div class="cell colspan5"> 
			        	ตำแหน่ง ผู้ออกใบบันทึกข้อความ
				        <div class="input-control text full-size">
						    <s:textfield name="recordApproveModel.record_approve_dep" id="record_approve_dep" required=""/>
						</div>
					</div>  
					<div class="cell colspan5 sub-alt-header fg-crimson" ><br>
						ตัวอย่าง เช่น อธิการบดี,รองอธิการบดี,ผู้อำนวยการ,รองผู้อำนวยการ
					</div>
			 	</div>
			 	<div class="row cells12"> 
	         	 	<div class="cell align-center colspan12"><br>
						  <button class="button success" name="save">บันทึก</button>   
						  <a id="print" class="button warning size"><span class="mif-print mif-lg fg-white"></span></a>
					</div>  
			 	</div>
			</div>
		</div> 
        </form> 
        
   		<script>
        $(function(){
        	 
        	$("#record_approve_date").datepicker({
            	format: "dd-mm-yyyy",autoclose:true,todayBtn: "linked",todayHighlight: true
            	
            });  
        	
        	var table = $('#table_ra').DataTable( { 
              	scrollY: '35.5vh', 
              	scrollX: true,
              //	scrollCollapse: true, 
                ordering: false,
                "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]] 
            } );
        	
            $('#table_ra tbody').on( 'click', 'tr', function () { 
    	        if ( $(this).hasClass('selected') ) {
    	            $(this).removeClass('selected');
    	            select2projectcode.val("").trigger("change");
    	            $("#personnelid").val("");
    	            $("#personnelname").val("");
    	            $("#personnellastname").val("");
    	            $("#authen_type").val("");
    	            $("#project_code").val("");
    	            $("#dow").val("");
    	            $("#dob").val("");
    	            $("#telephone").val("");
    	            $("#address").val(""); 
    	            $("#position").val(""); 
    	        }
    	        else {
    	            table.$('tr.selected').removeClass('selected');
    	            $(this).addClass('selected');
    	            var $index = $(this).index();
    	            
    	           	var forsplit = $(".tdprojectCode").eq($index).text().split(" - ");
    	           	select2projectcode.val(forsplit[0]).trigger("change");
    	           	 
    	           	var personnelSplit = $(".tdpersonnel").eq($index).text().split(" ");
    	          // 	alert(personnelSplit[2]);
    	           	$("#personnelid").val(personnelSplit[0]);
    	           	$("#personnelname").val(personnelSplit[2]+" "+personnelSplit[3]);
    	           	$("#personnellastname").val(personnelSplit[4]);  
    	           	
    	            $("#authen_type").val($(".tdhidden > #atn").eq($index).val());
    	            $("#dow").val($(".tddow").eq($index).text());
    	            $("#dob").val($(".tdhidden > #dobhd").eq($index).val());
    	            $("#telephone").val($(".tdtelephone").eq($index).text()); 
    	            $("#position").val($(".tdposition").eq($index).text());
    	            $("#address").val($(".tdhidden > #addresshd").eq($index).val());
    	        }
    	    }); // close table
            
$('#add').click(function () {
            	
            	var docnodt = $("#docno").val(); 
            	var yeardt = $("#year").val(); 
            	var description = $("#description").val(); 
            	var qty = $("#qty").val(); 
            	var unit = $("#unit").val(); 
            	var obj='', out='', b=1;
            $.ajax({   
       	  	 
                type: "post",
                url: "ajax_record_approve_add.jsp", //this is my servlet 
                data: {docnodt:docnodt,yeardt:yeardt,description:description,qty:qty,unit:unit}, //this is my paramiter
                async:true, 
                success: function(result){
                
                obj = JSON.parse(result);
               // alert(obj);
                var header = "<table id=\"table_ra\" class=\"cell-border hover display compact nowrap\" cellspacing=\"0\" width=\"100%\"> "+
                "<thead> "+
    			"<tr> "+
    			"	<th> "+
    			"		ลำดับที่ "+
    			"	</th> "+
    			"	<th> "+
    			"		รายละเอียด "+
    			"	</th> "+
    			"	<th> "+
    			"		จำนวน "+
    			"	</th> "+
    			"	<th> "+
    			"		หน่วย "+ 
    			"	</th> "+ 
    			"</tr>"+
    			"</thead> "+
    			"<tbody>";
                	out = header; 
                	for(var i = 0 ; i < obj.length; i++,b++){
    					out +=  
    					'<tr>'+
    						'<td align="center">'+b+'</td>'+
    						'<td class="tddescription" align="left">'+obj[i].des+'</td>'+
    						'<td class="tdqty" align="right">'+obj[i].qty+'</td>'+
    						'<td class="tdunit" align="left">'+obj[i].unit+'</td>'+ 
    					'<tr>';  
    				}  
    				out += 	'<tbody> </table>';	 
    				
    				$(".selectRA").html(out);
    				$("#description").val(""); 
    				$("#qty").val(""); 
    				$("#unit").val(""); 
                }
                
             }); // close ajax
             
            });  // close button add
            
            
        }); // close function
       
        
        
    	</script>
	</body>
</html>
