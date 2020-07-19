package mm.bean;

import java.io.Serializable;
import java.sql.Date;

public class Quotation implements Serializable {

	private int quotation_num;
	private int rfq_num;
	private int vendor_num;
	
	public int getQuotation_num() {
		return quotation_num;
	}
	public void setQuotation_num(int quotation_num) {
		this.quotation_num = quotation_num;
	}
	public int getRfq_num() {
		return rfq_num;
	}
	public void setRfq_num(int rfq_num) {
		this.rfq_num = rfq_num;
	}
	public int getVendor_num() {
		return vendor_num;
	}
	public void setVendor_num(int vendor_num) {
		this.vendor_num = vendor_num;
	}

	
	
	
	
	
	
	

	


}
