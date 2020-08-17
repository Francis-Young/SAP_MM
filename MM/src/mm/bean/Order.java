package mm.bean;

import java.io.Serializable;

import java.sql.Date;

public class Order implements Serializable {

	private int order_num;
	private int vendor_num;
	private int rfq_num;
	private java.sql.Date docdate;
	private String pur_org;
	private String pur_group;
	
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getVendor_num() {
		return vendor_num;
	}
	public void setVendor_num(int vendor_num) {
		this.vendor_num = vendor_num;
	}
	public int getRfq_num() {
		return rfq_num;
	}
	public void setRfq_num(int rfq_num) {
		this.rfq_num = rfq_num;
	}
	public java.sql.Date getDocdate() {
		return docdate;
	}
	public void setDocdate(java.sql.Date docdate) {
		this.docdate = docdate;
	}
	public String getPur_org() {
		return pur_org;
	}
	public void setPur_org(String pur_org) {
		this.pur_org = pur_org;
	}
	public String getPur_group() {
		return pur_group;
	}
	public void setPur_group(String pur_group) {
		this.pur_group = pur_group;
	}
	
	
	
	
	
	
	

	


}
