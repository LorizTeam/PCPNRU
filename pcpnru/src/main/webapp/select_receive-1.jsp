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
    
    <title>รายละเอียดรายรับ</title>
    
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
		<link href="css/bootstrap-datepicker3.css" rel="stylesheet">
	 	<link href="css/select2.css" rel="stylesheet"> 
	 
		<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
 		<script src="js/jquery.dataTables.min.js"></script>
  		<script src="js/bootstrap-datepicker-th.js"></script>
		<script src="js/select2.js"></script>
		
  </head>
  
  <body>
  	<%
  		ProjectMasterDB projM = new ProjectMasterDB();
		List projectMasterList = projM.GetProjectMasterList("", "");
		
		CostCodeMasterDB ccM = new CostCodeMasterDB();
		List costCodeMasterList = ccM.GetCostCodeMasterList("", "","");
		
		Receive1DB receL = new Receive1DB();
		List amtFromList = receL.GetAmountFrom();
  		List localList	= receL.GetLocal();
  	%>
  
    <div><%@include file="topmenu.jsp" %></div>
	<h3 class="align-center">รายละเอียดรายได้</h3>
	<form action="selectReceive1.action" method="post" data-role="validator" data-show-required-state="false" data-hint-mode="line" data-hint-background="bg-red" data-hint-color="fg-white" data-hide-error="5000">
	<div class="example" data-text="รายละเอียดรายได้">
		<div class="grid">
		  	<div class="row cells12">
		    	<div class="cell colspan5 offset2" > 
		    		โครงการ
		       		 <div class="input-control full-size"> 
		       		 <select id="project_code" name="projectCode" data-validate-hint="ไม่ระบุ">
					    <option value="" >-- ไม่ระบุ --</option>
					    <% 
		        		if (projectMasterList != null) {
			        		for (Iterator iterPj = projectMasterList.iterator(); iterPj.hasNext();) {
			        			ProjectMasterForm pjInfo = (ProjectMasterForm) iterPj.next();
	      				%>  
			      			<option value="<%=pjInfo.getProjectCode()%> - <%=pjInfo.getProjectName()%>" >
			       			 	<%=pjInfo.getProjectCode()%> - <%=pjInfo.getProjectName()%>
			       			</option>
							<%		} 
								}
							%>
							<span class="input-state-success mif-checkmark"></span>
					   </select>
					   </div>
		    	</div>
		    	<div class="cell colspan2">  
		        		วันที่การรับ
					    <div class="input-control text full-size ">
                            <input type="text" name="dateTime" id="datepicker" >
                            	<span class="input-state-success mif-checkmark"></span>
                        </div>
                        
				</div>
			</div> 
		<div class="grid">
		  	<div class="row cells12">
		    	<div class="cell colspan7 offset2">
		    		ค่าใช้จ่าย
		    		<div class="input-control full-size"> 
					    <select id="cost_code" name="costCode" data-validate-hint="ไม่ระบุ">
					   		<option value="">-- ไม่ระบุ --</option>
					   </select>
					   		<span class="input-state-success mif-checkmark"></span> 
					</div>
		    	</div>   
		    </div>
		  	<div class="row cells12">
		    	<div class="cell colspan4 offset2">
		    		ชื่อลูกค้า
		    		<div class="input-control full-size"> 
					    <select id="amountfrom" name="receiveform.amountfrom" data-validate-hint="ไม่ระบุ">
					    	<option value="">-- ไม่ระบุ --</option>
					    	<% 
			        		if (amtFromList != null) {
				        		for (Iterator iterAmtFrom = amtFromList.iterator(); iterAmtFrom.hasNext();) {
				        			ReceiveForm amtFromInfo = (ReceiveForm) iterAmtFrom.next();
		      				%>  
				      			<option value="<%=amtFromInfo.getAmountfrom()%>" >
				       			 	<%=amtFromInfo.getAmountfrom()%>
				       			</option>
								<%		} 
									}
							%>
					   </select> 
					</div>
		    	</div>
		    	<div class="cell colspan3">
		    		สถานที่
		    		<div class="input-control full-size"> 
					    <select id="local" name="receiveform.local" data-validate-hint="ไม่ระบุ">
					    	<option value="">-- ไม่ระบุ --</option>
					    	<% 
			        		if (localList != null) {
				        		for (Iterator iterlocal = localList.iterator(); iterlocal.hasNext();) {
				        			ReceiveForm amtFromInfo = (ReceiveForm) iterlocal.next();
		      				%>  
				      			<option value="<%=amtFromInfo.getLocal()%>" >
				       			 	<%=amtFromInfo.getLocal()%>
				       			</option>
								<%		} 
									}
							%>
					   </select>
					</div>
		    	</div>  
		    </div>
		</div>
	  	<div class="row cells12"> 
	    	<div class="cell colspan2 offset2" align="center"><br> 
				 <button class="button success full-size" type="submit" name="ok">ตกลง</button>
			</div> 
	    </div>
		
		<br/>  
		</div>
	</div> <!-- End of example --> 
	</form>
	
	<script>
		$(function(){
	        $("#project_code").select2();
	       // $("#cost_code").select2();
	        $("#cus_name").select2();
	        $("#location").select2();
	    });
	    $(function(){
	    	 $("#datepicker").datepicker({
	    		 clearBtn: true,autoclose:true,todayBtn: "linked",todayHighlight: true,format: "dd/mm/yyyy",setDate:"2016-11-12" 
	         });
	        
	    });
	    
	    $(function(){
	    $( "#project_code" ).change(function() {
	  		  
			var project_code = $("#project_code").val();
			var out = '';
			
			$.ajax({  // select history
			  	 
	          type: "post",
	          url: "ajax_receive-1.jsp", //this is my servlet 
	          data: {projectCode:project_code},
	          async:false, 
	          success: function(result){
	          
	          obj = JSON.parse(result);
	          	// alert(obj)
	          	
	          	var value = obj;
	          if( Object.keys(obj).length === 0){
	        	  $("#cost_code").html('<option value="">-- ไม่ระบุ --</option>');
	          }else{
		          for(var i = 0 ; i < obj.length; i++){
						out +=  
						'<option value="'+obj[i].costcode+' - '+obj[i].costname+'">'+
						   obj[i].costcode+' - '+obj[i].costname+
						'</option>'; 
					}  
					$("#cost_code").html(out);
		          }
	          }
	       });
	    });	
	});
	    
	</script>
  </body>
</html>
