package mm.bean;

import java.io.Serializable;
import java.sql.Date;

public class RFQ_item implements Serializable {
	private int rfqItem_num;
	private String rfq_code;
	private String material_num;
	private int requisition_quantity;
	private Date requisition_deliverydate;
	private String requisition_storageloc;
	private String requisition_plant;

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
	public String getRequisition_storageloc() {
		return requisition_storageloc;
	}
	public void setRequisition_storageloc(String requisition_storageloc) {
		this.requisition_storageloc = requisition_storageloc;
	}
	public String getRequisition_plant() {
		return requisition_plant;
	}
	public void setRequisition_plant(String requisition_plant) {
		this.requisition_plant = requisition_plant;
	}
	public int getRfqItem_num() {
		return rfqItem_num;
	}
	public void setRfqItem_num(int rfqItem_num) {
		this.rfqItem_num = rfqItem_num;
	}
	public String getRfq_code() {
		return rfq_code;
	}
	public void setRfq_code(String rfq_code) {
		this.rfq_code = rfq_code;
	}
	
	


}
