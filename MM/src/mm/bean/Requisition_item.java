package mm.bean;

import java.io.Serializable;
import java.sql.Date;

public class Requisition_item implements Serializable {

	
	private int req_item_num;
	private String material_num;
	private int requisition_quantity;
	private Date requisition_deliverydate;
	private String requisition_plant;
	private String requisition_storageloc;
	private String requisition_code;
	

	public int getReq_item_num() {
		return req_item_num;
	}
	public void setReq_item_num(int req_item_num) {
		this.req_item_num = req_item_num;
	}	
	public String getMaterial_num() {
		return material_num;
	}
	public void setMaterial_num(String material_num) {
		this.material_num = material_num;
	}
	public int getRequisition_quantity() {
		return requisition_quantity;
	}
	public void setRequisition_quantity(int requisition_quantity) {
		this.requisition_quantity = requisition_quantity;
	}
	public Date getRequisition_deliverydate() {
		return requisition_deliverydate;
	}
	public void setRequisition_deliverydate(Date requisition_deliverydate) {
		this.requisition_deliverydate = requisition_deliverydate;
	}
	public String getRequisition_plant() {
		return requisition_plant;
	}
	public void setRequisition_plant(String requisition_plant) {
		this.requisition_plant = requisition_plant;
	}
	public String getRequisition_storageloc() {
		return requisition_storageloc;
	}
	public void setRequisition_storageloc(String requisition_storageloc) {
		this.requisition_storageloc = requisition_storageloc;
	}

	public String getRequisition_code() {
		return requisition_code;
	}
	public void setRequisition_code(String requisition_code) {
		this.requisition_code = requisition_code;
	}
	
	
	
	
	
	

	


}
