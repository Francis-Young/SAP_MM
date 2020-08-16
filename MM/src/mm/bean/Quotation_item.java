package mm.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

public class Quotation_item implements Serializable {

	private int quotation_item_num;
	private int quotation_num;
	private String material_num;
	private BigDecimal price;
	private int quantity;
	private Date delivery_date;
	private String currency_unit;
	private int quotation_status;
	private String storageloc;
	
	
	public int getQuotation_item_num() {
		return quotation_item_num;
	}
	public void setQuotation_item_num(int quotation_item_num) {
		this.quotation_item_num = quotation_item_num;
	}
	public int getQuotation_num() {
		return quotation_num;
	}
	public void setQuotation_num(int quotation_num) {
		this.quotation_num = quotation_num;
	}

	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(Date delivery_date) {
		this.delivery_date = delivery_date;
	}
	public String getCurrency_unit() {
		return currency_unit;
	}
	public void setCurrency_unit(String currency_unit) {
		this.currency_unit = currency_unit;
	}
	public int getQuotation_status() {
		return quotation_status;
	}
	public void setQuotation_status(int quotation_status) {
		this.quotation_status = quotation_status;
	}
	public String getMaterial_num() {
		return material_num;
	}
	public void setMaterial_num(String material_num) {
		this.material_num = material_num;
	}
	public String getStorageloc() {
		return storageloc;
	}
	public void setStorageloc(String storageloc) {
		this.storageloc = storageloc;
	}
	
	
	


	
	
	
	
	
	
	

	


}
