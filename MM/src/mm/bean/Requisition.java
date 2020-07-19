package mm.bean;

import java.io.Serializable;
import java.sql.Date;

public class Requisition implements Serializable {

	private int requisition_num;
	private String requisition_discription;
	private String requisition_purchasegroup;
	
	
	public int getRequisition_num() {
		return requisition_num;
	}
	public void setRequisition_num(int requisition_num) {
		this.requisition_num = requisition_num;
	}
	public String getRequisition_discription() {
		return requisition_discription;
	}
	public void setRequisition_discription(String requisition_discription) {
		this.requisition_discription = requisition_discription;
	}
	public String getRequisition_purchasegroup() {
		return requisition_purchasegroup;
	}
	public void setRequisition_purchasegroup(String requisition_purchasegroup) {
		this.requisition_purchasegroup = requisition_purchasegroup;
	}
	
	
	
	
	

	


}
