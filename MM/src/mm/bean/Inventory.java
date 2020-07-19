package mm.bean;

import java.io.Serializable;
import java.sql.Date;

public class Inventory implements Serializable {

	private int material_num;
	private String material_plant;
	private String storageloc;
	private int material_storagenum;
	public int getMaterial_num() {
		return material_num;
	}
	public void setMaterial_num(int material_num) {
		this.material_num = material_num;
	}
	public String getMaterial_plant() {
		return material_plant;
	}
	public void setMaterial_plant(String material_plant) {
		this.material_plant = material_plant;
	}
	public String getStorageloc() {
		return storageloc;
	}
	public void setStorageloc(String storageloc) {
		this.storageloc = storageloc;
	}
	public int getMaterial_storagenum() {
		return material_storagenum;
	}
	public void setMaterial_storagenum(int material_storagenum) {
		this.material_storagenum = material_storagenum;
	}
	
	
	
	
	
	
	
	
	

	


}
