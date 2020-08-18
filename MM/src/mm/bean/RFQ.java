package mm.bean;

import java.io.Serializable;
import java.sql.Date;

public class RFQ implements Serializable {

	private int rfq_num;
	private String rfq_type;
	private String rfq_language;
	private Date rfq_date;
	private Date rfq_deadline;
	private String rfq_purchasing_org;
	private String rfq_purchasing_group;
	private String rfq_plant;
	private String vendor_code;
	private String rfq_coll;
	private String rfq_code;
	private String requisition_code;
	
	public int getRfq_num() {
		return rfq_num;
	}
	public void setRfq_num(int rfq_num) {
		this.rfq_num = rfq_num;
	}
	public String getRfq_type() {
		return rfq_type;
	}
	public void setRfq_type(String rfq_type) {
		this.rfq_type = rfq_type;
	}
	public String getRfq_language() {
		return rfq_language;
	}
	public void setRfq_language(String rfq_language) {
		this.rfq_language = rfq_language;
	}
	public Date getRfq_date() {
		return rfq_date;
	}
	public void setRfq_date(Date rfq_date) {
		this.rfq_date = rfq_date;
	}
	public Date getRfq_deadline() {
		return rfq_deadline;
	}
	public void setRfq_deadline(Date rfq_deadline) {
		this.rfq_deadline = rfq_deadline;
	}
	public String getRfq_purchasing_org() {
		return rfq_purchasing_org;
	}
	public void setRfq_purchasing_org(String rfq_purchasing_org) {
		this.rfq_purchasing_org = rfq_purchasing_org;
	}
	public String getRfq_purchasing_group() {
		return rfq_purchasing_group;
	}
	public void setRfq_purchasing_group(String rfq_purchasing_group) {
		this.rfq_purchasing_group = rfq_purchasing_group;
	}
	public String getRfq_plant() {
		return rfq_plant;
	}
	public void setRfq_plant(String rfq_plant) {
		this.rfq_plant = rfq_plant;
	}

	public String getVendor_code() {
		return vendor_code;
	}
	public void setVendor_code(String vendor_code) {
		this.vendor_code = vendor_code;
	}
	public String getRfq_coll() {
		return rfq_coll;
	}
	public void setRfq_coll(String rfq_coll) {
		this.rfq_coll = rfq_coll;
	}
	public String getRfq_code() {
		return rfq_code;
	}
	public void setRfq_code(String rfq_code) {
		this.rfq_code = rfq_code;
	}
	public String getRequisition_code() {
		return requisition_code;
	}
	public void setRequisition_code(String requisition_code) {
		this.requisition_code = requisition_code;
	}
	
	

	
	
	
	
	
	
	
	
	
	
	

	


}
