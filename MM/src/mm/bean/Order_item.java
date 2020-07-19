package mm.bean;

import java.io.Serializable;
import java.sql.Date;

public class Order_item implements Serializable {

	private int order_num;
	private int purchase_requisition_num;
	private double price;
	private int quantity;
	private Date delivery_date;
	private Date stat_delivery_date;
	private String currency_unit;
	private String material_num;
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getPurchase_requisition_num() {
		return purchase_requisition_num;
	}
	public void setPurchase_requisition_num(int purchase_requisition_num) {
		this.purchase_requisition_num = purchase_requisition_num;
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
	public Date getStat_delivery_date() {
		return stat_delivery_date;
	}
	public void setStat_delivery_date(Date stat_delivery_date) {
		this.stat_delivery_date = stat_delivery_date;
	}
	public String getCurrency_unit() {
		return currency_unit;
	}
	public void setCurrency_unit(String currency_unit) {
		this.currency_unit = currency_unit;
	}
	public String getMaterial_num() {
		return material_num;
	}
	public void setMaterial_num(String material_num) {
		this.material_num = material_num;
	}
	
	
	
	
	
	
	

	


}
