package mm.bean;

import java.io.Serializable;

import java.sql.Date;

public class Order implements Serializable {

	private int order_num;
	private String vendor_code;
	private String rfq_code;
	private java.sql.Date docdate;
	private String pur_org;
	private String pur_group;
	private String order_code;
	private int order_num_m;
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
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
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public String getRfq_code() {
		return rfq_code;
	}
	public void setRfq_code(String rfq_code) {
		this.rfq_code = rfq_code;
	}
	public String getVendor_code() {
		return vendor_code;
	}
	public void setVendor_code(String vendor_code) {
		this.vendor_code = vendor_code;
	}
	public int getOrder_num_m() {
		return order_num_m;
	}
	public void setOrder_num_m(int order_num_m) {
		this.order_num_m = order_num_m;
	}
	
	
	
	
	
	
	

	


}
