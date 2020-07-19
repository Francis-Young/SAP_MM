package mm.bean;

import java.io.Serializable;

public class Vendor implements Serializable {

	private int vendornum;
	private String vendorname;

	public int getVendornum() {
		return vendornum;
	}

	public void setVendornum(int vendornum) {
		this.vendornum = vendornum;
	}

	public String getVendorname() {
		return vendorname;
	}

	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}
}
