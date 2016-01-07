<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<link href="css/metro-schemes.css" rel="stylesheet"> 
	 
		<script src="js/jquery-2.1.3.min.js"></script>
	    <script src="js/metro.js"></script> 
 		<script src="js/jquery.dataTables.min.js"></script>  
		
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
        function sumAmount(){
        	var qty = document.getElementById("qty").value;
        	var amount = document.getElementById("amount").value; 
        	
        	var amountTotal = qty*amount;
        	document.getElementById("amountTotal").value = amountTotal;
        }
        function changeCoin(){
        	var amtt = document.getElementById("amtt").value;
        	var receiveAmt = document.getElementById("receiveAmt").value; 
        	
        	var amtt = amtt.replace(",", ""); 
        	var receiveAmt = receiveAmt.replace(",", "");
        	
        	var changeCoin = receiveAmt-amtt;
        	document.getElementById("change").value = changeCoin;
        	if(receiveAmt==0){
        		document.getElementById("change").value = '';
        	}
        }
        function printreceive() { 
        	
        	var chk1 = document.getElementById("receiveAmt").value; 
        	if(chk1!=''){
        	
        	var para = document.getElementById("docNoHD").value; 
        	
    		var load = window.open('/pcpnru/receiveReport.action?'+ 
    				
    				'&docNoHD='+para
    				,'scrollbars=yes,menubar=no,height=600,width=800,resizable=yes,toolbar=no,location=no,status=no');
        	}
        }
    </script>
  
  <body>
  
  	<% 		
  			String docNo		= (String) request.getAttribute("docNo");
  			String projectCode 	= (String) request.getAttribute("projectCode");
  			String dateTime 	= (String) request.getAttribute("dateTime");
  			String costCode 	= (String) request.getAttribute("costCode");
  			String amountFrom 	= (String) request.getAttribute("amountFrom");
  			String local 		= (String) request.getAttribute("local"); 
  			
  			List ReceiveList1 = null;
  			if (request.getAttribute("ReceiveList") == null) {
  				Receive2DB rcM = new Receive2DB();
  				ReceiveList1 = rcM.GetReceiveList(docNo);
  			}else{
  				ReceiveList1 = (List) request.getAttribute("ReceiveList");
  			}
  	%>
  
    <div><%@include file="topmenu.jsp" %></div>
	<br> 
	<div class="example" data-text="รายการรับ">
	<div class="grid">
	<form action="receive2.action" method="post" data-role="validator" data-show-required-state="false" data-hint-mode="line" data-hint-background="bg-red" data-hint-color="fg-white" data-hide-error="5000">
		  	<div class="row cells10"> 
		    	<div class="cell colspan3" > 
		       		  โครงการ<div class="input-control full-size success"> 
		       		 	<input type="text" name="projectCode" value="<%=projectCode%>" readonly="readonly">
					 </div> 
		    	</div>   
		    	<div class="cell colspan3">
		    		 ค่าใช้จ่าย<div class="input-control full-size success"> 
		    		 	<input type="text" name="costCode" value="<%=costCode%>" readonly="readonly">  
					</div> 
		    	</div>  
		    	<div class="cell colspan2">  
		        	 วันที่การรับ<div class="input-control full-size success"> 
                        <input type="text" name="dateTime" value="<%=dateTime%>" readonly="readonly"> 
                    </div> 
				</div> 
		    	<div class="cell colspan2">  
		        	เลขที่เอกสาร<div class="input-control full-size success"> 
                        <input type="text" name="docNo" value="<%=docNo%>" readonly="readonly"> 
                    </div>
				</div> 
			</div>  
		  	<div class="row cells10">  
		    	<div class="cell colspan3">
		    		ได้รับเงินจาก<div class="input-control full-size success"> 
					    <input type="text" name="amountFrom" value="<%=amountFrom%>" readonly="readonly">
					</div>
		    	</div> 
		    	<div class="cell colspan3">
		    		สถานที่<div class="input-control full-size success"> 
					    <input type="text" name="local" value="<%=local%>" readonly="readonly">
					</div>
		    	</div> 
		    </div>  
		  	<div class="row cells10"> 
		    	<div class="cell colspan10">
		    		รายละเอียด<div class="input-control full-size success"> 
					    <input type="text" id="description" name="description"> 
					</div>
		    	</div>
		    </div>  
		  	<div class="row cells12">  
		    	<div class="cell colspan3">
		    		จำนวน<div class="input-control full-size success">
		    			<input type="hidden" id="itemNo" name="itemNo"> 
					    <input type="text" id="qty" name="qty" onkeyup="sumAmount();" data-validate-func="required" data-validate-hint="This field can not be empty">
						<span class="input-state-error mif-warning"></span>
                       <span class="input-state-success mif-checkmark"></span>
					</div>
		    	</div> 
		    	<div class="cell colspan3">
		    		ราคาต่อหน่วย<div class="input-control full-size success"> 
					    <input type="text" id="amount" name="amount" onkeyup="sumAmount();">
					</div>
		    	</div> 
		    	<div class="cell colspan3">
		    		ราคารวม<div class="input-control full-size success"> 
					    <input type="text" id="amountTotal" name="amountTotal">
					</div>
		    	</div> 
		    	<div class="cell colspan3" align="center"><br>
					  <button class="button success" type="submit" name="add">เพิ่ม</button> 
					  <button class="button primary" type="submit" name="update">แก้ไข</button> 
					  <button class="button danger" type="submit" name="delete">ลบ</button>
				</div>
		    </div>    
		    </form> 
		</div> <!-- End of example --> 
	</div>
	
	<div class="example" data-text="รายการ">
            <table id="table_receive" class="dataTable striped border bordered" data-role="datatable" data-searching="true">
                <thead>
                <tr>  
                	<th>เลขที่</th>
                    <th>รายละเอียด</th>
                    <th>จำนวน</th>
                    <th>ราคา</th>
                    <th>ราคารวม</th>
                </tr>
                </thead> 
                  
                <tbody>
                <%	if (ReceiveList1 != null) {
						List ReceiveList = ReceiveList1;
						int x = 0;
						for (Iterator iter = ReceiveList.iterator(); iter.hasNext();) {
						x++; 
						ReceiveForm revL = (ReceiveForm) iter.next();
				%>
                <tr>  
                    <td class="tditemno" align="center"><%=revL.getItemNo()%> </td>
                    <td class="tddescription" align="center"><%=revL.getDescription()%></td>
                    <td class="tdqty" align="center"><%=revL.getQty()%></td>  
                    <td class="tdamount" align="center"><%=revL.getAmount()%></td>
                    <td class="tdamountTotal" align="center"><%=revL.getAmountTotal()%></td>
                </tr>  
                <% 	} %> 
	                
                <% }  else { %> 
                	<tr> 
                    <td colspan="5">ไม่พบข้อมูล</td> 
                	</tr> 
                <%	} %>	 
                </tbody>
            </table>
        </div> <!-- End of example table --> 
        
    <div class="example" data-text="รายการเงินรวม">
	<div class="grid">
	<form action="receiveReport.action" method="post" data-role="validator" data-show-required-state="false" data-hint-mode="line" data-hint-background="bg-red" data-hint-color="fg-white" data-hide-error="5000">
		    <div class="row cells12"> 
		     	<div class="cell colspan3">
		    		จำนวนเงินรวม<div class="input-control full-size success">  
					    <input type="text" id="amtt" name="amtt" data-validate-func="required" data-validate-hint="This field can not be empty">
						<span class="input-state-error mif-warning"></span>
                       <span class="input-state-success mif-checkmark"></span>
					</div>
		    	</div> 
		    	<div class="cell colspan3">
		    		จำนวนเงินที่ได้รับ<div class="input-control full-size success"> 
					    <input type="text" id="receiveAmt" name="receiveAmt" onkeyup="changeCoin();" data-validate-func="required" data-validate-hint="This field can not be empty">
						<span class="input-state-error mif-warning"></span>
                       <span class="input-state-success mif-checkmark"></span>
					</div>
		    	</div> 
		    	<div class="cell colspan3">
		    		จำนวนเงินทอน<div class="input-control full-size success"> 
					    <input type="text" id="change" name="change" >
					</div>
		    	</div>  <br>
		    	<div class="cell colspan3"> 
		    		  <input type="hidden" id="docNoHD" name="docNoHD" value="<%=docNo%>">
		    		  <a href="javascript:printreceive();" class="button warning full-size"><span class="mif-print mif-lg fg-black"></span></a>
					   
				</div>
		    </div>    
		    </form>
	 </div>
	</div> <!-- End of example -->
	
        
	<script type="text/javascript">
  	$(document).ready(function() {
    	var table = $('#table_receive').DataTable(); 
		$('#table_receive tbody').on( 'click', 'tr', function () { 
	        if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
	            $("#description").val("");
	            $("#qty").val("");
	            $("#amount").val("");
	            $("#amountTotal").val("");
	            $("#itemno").val("");
	        }
	        else {
	            table.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	            var $index = $(this).index();
	            $("#description").val($(".tddescription").eq($index).text());
	            $("#qty").val($(".tdqty").eq($index).text());
	            $("#amount").val($(".tdamount").eq($index).text());
	            $("#amountTotal").val($(".tdamountTotal").eq($index).text());
	            $("#itemNo").val($(".tditemno").eq($index).text());
	        }
	    });
	} );
  </script>
  
  </body>
</html>
