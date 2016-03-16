<%@ page language="java" import="java.util.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<div class="app-bar green" data-role="appbar">	
		 <a href="index.jsp" style="width: 20%;margin-top: 0;padding-top: 0" class="app-bar-element branding"><img  src="images/pnru.png" /></a>
		<ul class="app-bar-menu  small-dropdown">
        <li><a href="index.jsp"><span class="mif-home"></span> หน้าหลัก</a></li>
        <li>
            <a href="" class="dropdown-toggle"><span class="mif-versions"></span> โครงการ</a>
            <ul class="d-menu " data-role="dropdown">
            	<li><a href="projecthd.jsp">ร่างรายละเอียด  โครงการ</a></li>
            	<li class="divider"></li>
                <li><a href="projectmaster.jsp">สร้าง ชื่อโครงการ</a></li>   
                <li class="divider"></li>
                <li><a href="subjobmaster.jsp">สร้าง  กิจกรรม</a></li>
                <li class="divider"></li>
                <li><a href="childsubjobmaster.jsp">สร้าง  หมวด</a></li>
                <li class="divider"></li>
                <li>
                <a href="" class="dropdown-toggle">สร้าง รายละเอียดค่าใช้จ่าย</a>
                    <ul class="d-menu" data-role="dropdown" >
                        <li><a href=""  class="dropdown-toggle">กลุ่มรายได้</a>
                        	<ul class="d-menu" data-role="dropdown">
                    			<li><a href="groupcostcode-receive.jsp">สร้างกลุ่มรายได้</a></li>
                    			<li class="divider"></li>
                        		<li><a href="costcodemaster.jsp">กำหนดเปอร์เซ็นรายรับ</a></li> 
                        	</ul>
                        </li>
                        <li class="divider"></li>
                        <li><a href="groupcostcode-requisition.jsp">สร้างกลุ่มรายจ่าย</a> 
                        </li> 
                    </ul>
                </li> 
                <li class="divider"></li>
                <li><a href="unitmaster.jsp">สร้าง  หน่วยนับ</a></li>
                <li class="divider"></li>
                <li><a href="create_central_budget.jsp">สร้าง งบกลาง</a></li>
            </ul>
        </li>
        <li>
			<a href="" class="dropdown-toggle"><span class="mif-menu"></span> บันทึกรายได้-รายจ่าย</a>
            <ul class="d-menu" data-role="dropdown">
                <li><a href="" class="dropdown-toggle">รายได้</a>
                    <ul class="d-menu" data-role="dropdown">
                        <li><a href="receive-1.jsp">บันทึกรายได้</a></li>
                        <li class="divider"></li>
                        <li><a href="select_receive-1.jsp">รายละเอียดรายได้</a></li> 
                    </ul>
                </li>
                <li class="divider"></li>
                <li><a href="" class="dropdown-toggle">รายจ่าย</a>
                    <ul class="d-menu" data-role="dropdown">  
                        <li><a href="" class="dropdown-toggle">ใบขออนุมัติซื้อ</a>
                        	<ul class="d-menu" data-role="dropdown">  
			                        <li><a href="createrecordApprove.action">สร้างรายการ</a></li>
			                        <li class="divider"></li>
			                        <li><a href="windowsPR.action">ดูประวัติ</a></li> 
			                        <li class="divider"></li>
			                        <li><a href="">จัดการ ผู้มีอำนาจการอนุมัติ</a></li> 
			                 </ul>
                        </li>
                        <li class="divider"></li>
                        <li><a href="" class="dropdown-toggle">ใบสั่งซื้อ</a>
                        	<ul class="d-menu" data-role="dropdown">  
			                        <li><a href="pocheckauthen.action">สร้างรายการ</a></li>
			                        <li class="divider"></li>
			                        <li><a href="">ดูประวัติ</a></li> 
			                        <li class="divider"></li>
			                        <li><a href="">จัดการ ผู้มีอำนาจการอนุมัติ</a></li> 
			                 </ul>
                        </li>
                        <li class="divider"></li>
                        <li><a href="" class="dropdown-toggle">เบิกงบประมาณ</a>
			                  <ul class="d-menu" data-role="dropdown">  
			                        <li><a href="requisition.jsp">เบิกงบประมาณ</a></li>
			                        <li class="divider"></li>
			                        <li><a href="select_requisition-1.jsp">รายละเอียดการเบิกงบประมาณ</a></li> 
			                        <li class="divider"></li>
			                        <li><a href="createRockingBudget.action">โยกงบประมาณ</a></li>
			                        <li class="divider"></li>
			                        <li><a href="rbgBegin.action">อนุมัติ การโยกงบประมาณ</a></li>
			                        <li class="divider"></li>
			                        <li><a href="createCentralBudget.action">งบกลาง</a></li>
			                        <li class="divider"></li>
			                        <li><a href="manage-approve-requisition.jsp">จัดการ ผู้มีอำนาจการอนุมัติ</a></li> 
			                 </ul>
			            </li>  
                    </ul>
                </li> 
            </ul>
        </li>  
        <li>
			<a href="" class="dropdown-toggle"><span class="mif-file-pdf"></span> รายงาน</a>
            <ul class="d-menu" data-role="dropdown">
                <li><a href="" class="dropdown-toggle">รายงานการรับ</a>
                    <ul class="d-menu" data-role="dropdown"> 
                        <li><a href="reportreceive.jsp">รายงาน ประจำวัน, เดือน, ไตรมาส, ปี</a></li> 
                    </ul>
                </li>
                <li class="divider"></li>
                <li><a href="" class="dropdown-toggle">รายงานการจ่าย</a>
                    <ul class="d-menu" data-role="dropdown"> 
                        <li><a href="reportreceive.jsp">รายงาน ประจำวัน, เดือน, ไตรมาส, ปี</a></li> 
                    </ul>
                </li>
                <li class="divider"></li>
                <li><a href="reportreceiveandrequisition.jsp">รายงานรับ/จ่าย</a>
                </li>
                <li class="divider"></li>
                <li><a href="analyze.pdf">วิเคราะห์งบ</a></li> 
            </ul>
        </li>
        <li>
        	<a href="" class="dropdown-toggle"><span class="mif-users"></span> ข้อมูลบุคลากร</a>
        	<ul class="d-menu" data-role="dropdown">
               
                <li><a href="personnel.jsp">จัดการข้อมูลบุคลากร</a>
                </li> 
                <li class="divider"></li>
                <li><a href="authen_page.jsp">กำหนดสิทธิ์การใช้งาน</a> 
                </li>
              	<li class="divider"></li>
                <li><a href="authen.jsp">จัดการสิทธิ์การใช้งาน</a> 
                </li>
                <li class="divider"></li>
                <li><a href="page.jsp">จัดการการเข้าใช้ของแต่ละหน้า</a> 
                </li>
                <li class="divider"></li>
                <li><a href="" class="dropdown-toggle">จัดการข้อมูลตำแหน่งงาน</a>
                    <ul class="d-menu" data-role="dropdown"> 
                        <li><a href="">จัดการข้อมูลตำแหน่งงาน</a></li>
                        <li class="divider"></li>
                        <li><a href="">จัดการการเข้าถึงของตำแหน่ง</a></li> 
                    </ul>
                </li>
                
            </ul>
        </li>
         <li><a href="profileMaster.action" ><span class="mif-user"></span> ข้อมูลส่วนตัว </a></li> 
         <li><a href="logout.action" ><span class="mif-exit"></span> ออกจากระบบ</a></li> 
    </ul>
     
    
</div>