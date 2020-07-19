package mm.bean;

import java.io.Serializable;
import java.sql.Date;

public class RFQ_item implements Serializable {

	private int rfq_num;
	private String material_num;
	
	public int getRfq_num() {
		return rfq_num;
	}
	public void setRfq_num(int rfq_num) {
		this.rfq_num = rfq_num;
	}
	public String getMaterial_num() {
		return material_num;
	}
	public void setMaterial_num(String material_num) {
		this.material_num = material_num;
	}
	
	


}
