package mm.bean;

import java.io.Serializable;
import java.sql.Date;

public class Requisition_item implements Serializable {

	private int requisition_num;
	private String material_num;
	private int requisition_quantity;
	private Date requisition_deliverydate;
	private String requisition_plant;
	private String requisition_storageloc;
	
	
	public int getRequisition_num() {
		return requisition_num;
	}
	public void setRequisition_num(int requisition_num) {
		this.requisition_num = requisition_num;
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
	
	
	
	
	
	

	


}
