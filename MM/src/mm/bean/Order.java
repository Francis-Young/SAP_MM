package mm.bean;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable {

	private int order_num;
	private int vendor_num;
	private int rfq_num;
	
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
	
	
	
	
	
	
	

	


}
