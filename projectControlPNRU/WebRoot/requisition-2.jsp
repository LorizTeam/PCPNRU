<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>หน้าเบิกสินค้า</title>
    
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
    <div><%@include file="topmenu.jsp" %></div>
	<br>
	
	<div class="example" data-text="รายละเอียด">
		<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan1 "> 
		       		<h4 class="align-right">โครงการ&nbsp;</h4>
		    	</div>
		    	<div class="cell colspan4" > 
		       		 <h4><small class="input-control full-size"> 
			       		 <select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
						 </select>
					</small></h4>
		    	</div>
		    	<div class="cell colspan1"> 
		    		<h4 class="align-right">เดือน&nbsp;</h4>  
		    	</div>
		    	<div class="cell colspan2">
		    		<h4><small class="input-control full-size"> 
				    	<select onchange=""> 
					        <option>01 - มกราคม</option>
					        <option>02 - กุมภาพันธ์</option>
					        <option>03 - มีนาคม</option>
					        <option>04 - เมษายน</option>
					        <option>05 - พฤษภาคม</option>
					        <option>06 - มิถุนายน</option>
					        <option>07 - กรกฎาคม</option> 
					        <option>08 - สิงหาคม</option>
					        <option>09 - กันยายน</option>
					        <option>10 - ตุลาคม</option>
					        <option>11 - พฤศจิกายน</option>
					        <option>12 - ธันวาคม</option>
					    </select>
					</small></h4>
		    	</div>
		    	<div class="cell colspan1"> 
		    		<h4 class="align-right">ปี&nbsp;</h4>  
		    	</div>
		    	<div class="cell colspan1">

		    		<h4><small class="input-control full-size"> 
					    <select onchange=""> 
					        <option>2555</option>
					        <option>2556</option>
					        <option>2557</option>
					        <option>2558</option>
					        <option>2559</option>
					        <option>2560</option>
					        <option>2561</option>
					        <option>2562</option>
					        <option>2563</option>
					        <option>2564</option>
					        <option>2565</option>
					        </select> 
					</small></h4>
		    	</div>
		    </div>
		</div>
		
		<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan1"> 
		       		<h4 align="right">กิจกรรม&nbsp;</h4> 	  
		    	</div> 
		    	<div class="cell colspan4">
		    		<h4><small class="input-control full-size"><select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					   </select>
					</small></h4>
		    	</div> 
		        <div class="cell colspan1"> 
		       		<h4 align="right">กิจกรรมย่อย&nbsp;</h4> 	  
		    	</div> 
		    	<div class="cell colspan4">
		    		<h4><small class="input-control full-size">
			    		<select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
						</select>
					</small></h4>
		    	</div>
		    </div>
		</div>
		
		<div class="flex-grid">
		  	<div class="row flex-just-center">
		        <div class="cell colspan1"> 
		       		<h4 align="right">ค่าใช้จ่าย&nbsp;</h4> 	  
		    	</div> 
		    	<div class="cell colspan4">
		    		<h4><small class="input-control full-size">
		    			<select onchange="">
					    	<option>-- โปรดเลือก --</option>
					        <option>521800001 - อาคารเรือนไทย</option>
					        <option>521800002 - แหล่งเรียนรู้และวิจัย กาซะลองสปา</option>
					        <option>521800003 - ถ่ายภาพพิมพ์บัตรและสื่อสารดิจตอล</option>
					        <option>521800004 - โรงแรม</option>
					        <option>521800005 - ศูนย์บริการ</option>
					        <option>521800006 - สปา & ฟิตเนส</option>
					        <option>521800007 - ศูนย์อาหารและร้านค้า</option> 
					   </select>
					</small></h4>
		    	</div>  
		    	<div class="cell colspan1"> 
		       		<h4 align="right">จำนวน&nbsp;</h4> 	  
		    	</div> 
		    	<div class="cell colspan1">
		    		<h4><small class="input-control full-size">
					    <input type="text" id="subjobcode" name="subjobCode"> 
					</small></h4>
		    	</div> 
		    	<div class="cell colspan2"> 
		      		<h4 align="right">ราคาต่อหน่วย&nbsp;</h4> 	  
		    	</div> 
		    	<div class="cell colspan1">
		    		<h4><small class="input-control full-size">
					    <input type="text" id="subjobcode" name="subjobCode"> 
					</small></h4>
		    	</div> 
		    </div>
		</div> 
		
		<div class="flex-grid">
		  	<div class="row flex-just-center">
		    	<div class="cell colspan3" align="center">
					  <button class="button success" type="submit" name="add">เพิ่ม</button> 
					  <button class="button success" type="submit" name="update">แก้ไข</button> 
					  <button class="button success" type="submit" name="delete">ลบ</button>
				</div> 
		    </div>
		</div> 
	
	</div> <!-- End of example --> 
	
	<div class="example" data-text="รายการ">
            <table id="table_project" class="dataTable striped border bordered" data-role="datatable" data-searching="true">
                <thead>
                <tr>  
                	<th>เลขที่</th>
                    <th>ชื่อโครงการ</th>
                    <th>ชื่อกิจกรรม</th> 
                    <th>ชื่อกิจกรรมย่อย</th>
                    <th>รายละเอียด</th>
                    <th>จำนวน</th>
                    <th>ราคา</th>
                    <th>ราคารวม</th>
                </tr>
                </thead> 
                  
                <tbody>
                <tr>  
                    <td>1</td>
                    <td>กาซะลอสปา</td>
                    <td>บุคลากร</td>
                    <td>เงินเดือน</td>
                    <td>1 คน x 13,200 บาท x 12</td>
                    <td>3</td>
                    <td>15,000 บาท</td>  
                    <td>45,000 บาท</td> 
                </tr>	 
                </tbody>
            </table>
        </div> <!-- End of example table --> 
  </body>
</html>
