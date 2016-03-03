package test.pcpnru.masterAction;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.junit.*;
import org.junit.Assert;

import pcpnru.utilities.DateUtil;
import pcpnru.utilities.Validate;
import test.pcpnru.masterData.TestRecordApproveDB;
import test.pcpnru.masterModel.TestRecordApproveModel;;

public class TestViewDetailPR {
	String docno="00046",year="2016";
	
	@Test
	public void GetValueByDocno() throws IOException, Exception{
		Map MapResult = new TestRecordApproveDB().GetAllValueHeader_byDocno(this.docno,this.year);
		Assert.assertTrue(!MapResult.isEmpty());
	}
	
	@Test
	public void GetValueByEmptyDocno() throws IOException, Exception{
		Map MapResult = new TestRecordApproveDB().GetAllValueHeader_byDocno("",this.year);
		Assert.assertTrue(MapResult.isEmpty());
	}
	
	@Test
	public void GetValueByEmptySpaceDocno() throws IOException, Exception{
		Map MapResult = new TestRecordApproveDB().GetAllValueHeader_byDocno(" ",this.year);
		Assert.assertTrue(MapResult.isEmpty());
	}
	
	@Test
	public void CheckResultAfterGet() throws IOException, Exception{
		Map MapResult = new TestRecordApproveDB().GetAllValueHeader_byDocno(this.docno,this.year);
		Assert.assertEquals("00046", MapResult.get("docno"));
		Assert.assertEquals("2016", MapResult.get("year"));
		Assert.assertEquals("ศูนย์วัฒนธรรมพระนคร โทร. o๘ ๑ ๘๓o o๗o๘", MapResult.get("record_approve_hd"));
		Assert.assertEquals("ศวพ. o๓๓/๒๕๕๘", MapResult.get("record_approve_t"));
		Assert.assertEquals("2015-10-27", MapResult.get("record_approve_date"));
		Assert.assertEquals("ขออนุมัติเบิกจ่าย งานจ้างทำ ตู้เมนแบบเคลื่อนที่ ขนาด 100 A. 380V.", MapResult.get("record_approve_title"));
		Assert.assertEquals("อธิการบดี", MapResult.get("record_approve_rian"));
		Assert.assertEquals("ด้วยทางศูนย์วัฒนธรรมพระนครได้รับหนังสือแจ้งจาก บริษัท เวิร์ล พริ้นท์ แอน ดีไซน์ จำกัด ว่าได้เคยรับจ้างงานให้ดำเนินการทำตู้ไฟฟ้าเคลื่อนที่ และส่งมอบงานมาแล้ว แต่ยังไม่ได้รับการเบิกจ่าย จากทางศูนย์วัฒนธรรมพระนคร", MapResult.get("record_approve_des1"));
		Assert.assertEquals("จากการตรวจสอบเอกสารและผลการเนินการพบว่า มีการทำงานดังกล่าวจริงและทำให้ศูนย์มีตู้ไฟฟ้าเคลื่อนที่ไว้บริการแก่ลูกค้าที่มาเช่าพื้นที่ใช้งาน และได้เคยสอบถามกับเจ้าหน้าที่โสตทัศนศึกษา ว่าได้ดำเนินการจริง และยังไม่ได้ทำเรื่องเบิกจ่าย ค่าจ้างเหมาดำเนินการ", MapResult.get("record_approve_des2"));
		Assert.assertEquals("จากการตรวจสอบเอกสารและผลการเนินการพบว่า มีการทำงานดังกล่าวจริงและทำให้ศูนย์มีตู้ไฟฟ้าเคลื่อนที่ไว้บริการแก่ลูกค้าที่มาเช่าพื้นที่ใช้งาน และได้เคยสอบถามกับเจ้าหน้าที่โสตทัศนศึกษา ว่าได้ดำเนินการจริง และยังไม่ได้ทำเรื่องเบิกจ่าย ค่าจ้างเหมาดำเนินการ", MapResult.get("record_approve_des3"));
		Assert.assertEquals("รองศาสตราจารย์บุญเกียรติ ไทรชมภู่", MapResult.get("record_approve_cen"));
		Assert.assertEquals("รักษาการ ผู้อำนวยการศูนย์วัฒนธรรมพระนคร", MapResult.get("record_approve_dep"));
		Assert.assertEquals("๒๗-ตุลาคม-๒๕๕๘", MapResult.get("thaidate_report"));
		Assert.assertEquals("00001", MapResult.get("create_by").toString());
	}
	
	@Test
	public void CheckResultNullValueAfterGet_ByNulldocno() throws IOException, Exception{
		Map MapResult = new TestRecordApproveDB().GetAllValueHeader_byDocno(null,this.year);
		Assert.assertEquals(null, MapResult.get("docno"));
		Assert.assertEquals(null, MapResult.get("year"));
		Assert.assertEquals(null, MapResult.get("record_approve_hd"));
		Assert.assertEquals(null, MapResult.get("record_approve_t"));
		Assert.assertEquals(null, MapResult.get("record_approve_date"));
		Assert.assertEquals(null, MapResult.get("record_approve_title"));
		Assert.assertEquals(null, MapResult.get("record_approve_rian"));
		Assert.assertEquals(null, MapResult.get("record_approve_des1"));
		Assert.assertEquals(null, MapResult.get("record_approve_des2"));
		Assert.assertEquals(null, MapResult.get("record_approve_des3"));
		Assert.assertEquals(null, MapResult.get("record_approve_cen"));
		Assert.assertEquals(null, MapResult.get("record_approve_dep"));
		Assert.assertEquals(null, MapResult.get("thaidate_report"));
		Assert.assertEquals(null, MapResult.get("create_by"));
	}
	
	@Test
	public void PutValueToModel_andCheck() throws IOException, Exception{
		TestRecordApproveModel TRAM = new TestRecordApproveModel();
		Map MapResult = new TestRecordApproveDB().GetAllValueHeader_byDocno(this.docno,this.year);
		TRAM.setDocno(MapResult.get("docno").toString());
		Assert.assertEquals("00046", TRAM.getDocno());
	}
}
