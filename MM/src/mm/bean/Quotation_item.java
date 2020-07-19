package mm.bean;

import java.io.Serializable;
import java.sql.Date;

public class Quotation_item implements Serializable {

	private int quotation_item_num;
	private int quotation_num;
	private String material;
	private double price;
	private int quantity;
	private Date delivery_date;
	private String currency_unit;
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
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
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
	
	
	


	
	
	
	
	
	
	

	


}
