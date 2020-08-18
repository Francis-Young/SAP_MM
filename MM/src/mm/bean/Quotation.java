package mm.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

public class Quotation implements Serializable {

	private int quotation_num;
	private String rfq_code;
	private String vendor_code;
	private BigDecimal value;
	private int status;
	private String quotation_code;
	
	public int getQuotation_num() {
		return quotation_num;
	}
	public void setQuotation_num(int quotation_num) {
		this.quotation_num = quotation_num;
	}

	public BigDecimal getValue() {
		return value;
	}
	public void setValue(BigDecimal value) {
		this.value = value;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getQuotation_code() {
		return quotation_code;
	}
	public void setQuotation_code(String quotation_code) {
		this.quotation_code = quotation_code;
	}
	public String getVendor_code() {
		return vendor_code;
	}
	public void setVendor_code(String vendor_code) {
		this.vendor_code = vendor_code;
	}
	public String getRfq_code() {
		return rfq_code;
	}
	public void setRfq_code(String rfq_code) {
		this.rfq_code = rfq_code;
	}

	
	
	
	
	
	
	

	


}
