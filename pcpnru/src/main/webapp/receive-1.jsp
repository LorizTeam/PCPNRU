<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>หน้ารับสินค้า</title>
    
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
        <link href="css/metro-responsive.css" rel="stylesheet">
		<link href="css/metro-schemes.css" rel="stylesheet">
		<link href="css/docs.css" rel="stylesheet"> 
	 
		<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script>
	    <script src="js/docs.js"></script>
	    <script src="js/prettify/run_prettify.js"></script>
	    <script src="js/ga.js"></script> 
 		<script src="js/jquery.dataTables.min.js"></script> 
        <script src="includehtml.js"></script>    
		<script src="js/select2.min.js"></script>
  </head>
  
  <script>
        function no_submit(){
            return false;
        }

        function notifyOnErrorInput(input){
            var message = input.data('validateHint');
            $.Notify({
                caption: 'Error',
                content: message,
                type: 'alert'
            });
        }
    </script>
  
  <body>
    <div><%@include file="topmenu.jsp" %></div>
	<br>
	<form action="receive1.action" method="post" data-role="validator" data-show-required-state="false" data-hint-mode="line" data-hint-background="bg-red" data-hint-color="fg-white" data-hide-error="5000">
	<div class="example" data-text="รายการรับ">
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan2 "> 
		       	<h2 class="align-right">โครงการ&nbsp;</h2>
		    	</div>
		    	<div class="cell colspan5" > 
		       		 <h3><small class="input-control full-size"> 
		       		 <select id="project_code" name="projectCode" data-validate-func="required" data-validate-hint="This field can not be empty">
					    	<option value="">-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					   </select>
					   <span class="input-state-error mif-warning"></span>
                       <span class="input-state-success mif-checkmark"></span>
					   </small></h3>
		    	</div>
		    	<div class="cell colspan2 align-right"><h2>วันที่การรับ&nbsp;</h2></div>
		    	<div class="cell colspan2">  
		        		<h3><small>
					    <div class="input-control text full-size " data-role="datepicker" data-format="dd-mm-yyyy" data-scheme="green">
                            <input type="text" name="dateTime" data-validate-func="date" data-validate-hint="Value must be valid date string">
                            <span class="input-state-error mif-warning"></span>
                            <span class="input-state-success mif-checkmark"></span>
                            <button class="button"><span class="mif-calendar"></span></button>
                        </div>
                        </small></h3>
				</div>
	</div> 
	<hr/>
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan2"> 
		       		<h2 class="align-right">ค่าใช้จ่าย&nbsp;</h2> 	  
		    	</div> 
		    	<div class="cell colspan9">
		    		<h3><small class="input-control full-size"> 
					    <select id="cost_code" name="costCode" data-validate-func="required" data-validate-hint="This field can not be empty">
					    	<option value="">-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					   </select> 
					   <span class="input-state-error mif-warning"></span>
                     	<span class="input-state-success mif-checkmark"></span> 
					</small></h3>
		    	</div>   
		    </div>
		</div>
	<hr/>
	<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan2"> 
		       		<h2 class="align-right">ได้รับเงินจาก&nbsp;</h2> 	  
		    	</div> 
		    	<div class="cell colspan5">
		    		<h3><small class="input-control full-size"> 
					    <input type="text" id="amountFrom" name="amountFrom" data-validate-func="required" data-validate-hint="This field can not be empty"> 
					    <span class="input-state-error mif-warning"></span>
                     	<span class="input-state-success mif-checkmark"></span> 
					</small></h3>
		    	</div>  
		    	<div class="cell colspan2"> 
		       		<h2 class="align-right">สถานที่&nbsp;</h2> 	  
		    	</div> 
		    	<div class="cell colspan2">
		    		<h3><small class="input-control full-size"> 
					    <input type="text" id="local" name="local" data-validate-func="required" data-validate-hint="This field can not be empty"> 
					    <span class="input-state-error mif-warning"></span>
                     	<span class="input-state-success mif-checkmark"></span> 
					</small></h3>
		    	</div>  
		    </div>
		</div>
	<hr/>  
	<div class="flex-grid">
		  	<div class="row flex-just-center"> 
		    	<div class="cell colspan2" align="center"><br> 
					  <button class="button success full-size" type="submit" name="ok">ตกลง</button>
				</div> 
		    </div>
	</div>
	<br/>  
	<hr/>
	</div> <!-- End of example --> 
	</div>
	</form> 
	  
  </body>
  <script>
    $(function(){
        $("#project_code").select2();
        $("#cost_code").select2();
    });
</script>
  
</html>
