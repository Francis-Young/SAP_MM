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
	private int requisition_num;
	
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
	public int getRequisition_num() {
		return requisition_num;
	}
	public void setRequisition_num(int requisition_num) {
		this.requisition_num = requisition_num;
	}
	
	
	
	
	
	
	
	
	
	
	
	

	


}
