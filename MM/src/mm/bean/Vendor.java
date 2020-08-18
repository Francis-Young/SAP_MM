package mm.bean;

import java.io.Serializable;

public class Vendor implements Serializable {

	private String vnum;
	private String vcode;
	private String vname;
	private String vtype;
	private String vtaxnum;
	private String vcompanycode;
	private String vreconacct;
	private String vpaymentterms;
	private String vcurrency;
	private String vstreet;
	private String vpostalcode;
	private String vcity;
	private String vcountry;
	private String vregion;
	private String vlanguage;
	private String vclerk;
	private boolean vdoublecheckinvoice;

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

	public boolean isVdoublecheckinvoice() {
		return vdoublecheckinvoice;
	}

	public void setVdoublecheckinvoice(boolean vdoublecheckinvoice) {
		this.vdoublecheckinvoice = vdoublecheckinvoice;
	}

	public String getVnum() {
		return vnum;
	}

	public void setVnum(String vnum) {
		this.vnum = vnum;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public String getVtype() {
		return vtype;
	}

	public void setVtype(String vtype) {
		this.vtype = vtype;
	}

	public String getVtaxnum() {
		return vtaxnum;
	}

	public void setVtaxnum(String vtaxnum) {
		this.vtaxnum = vtaxnum;
	}

	public String getVcompanycode() {
		return vcompanycode;
	}

	public void setVcompanycode(String vcompanycode) {
		this.vcompanycode = vcompanycode;
	}

	public String getVreconacct() {
		return vreconacct;
	}

	public void setVreconacct(String vreconacct) {
		this.vreconacct = vreconacct;
	}

	public String getVpaymentterms() {
		return vpaymentterms;
	}

	public void setVpaymentterms(String vpaymentterms) {
		this.vpaymentterms = vpaymentterms;
	}

	public String getVcurrency() {
		return vcurrency;
	}

	public void setVcurrency(String vcurrency) {
		this.vcurrency = vcurrency;
	}

	public String getVstreet() {
		return vstreet;
	}

	public void setVstreet(String vstreet) {
		this.vstreet = vstreet;
	}

	public String getVpostalcode() {
		return vpostalcode;
	}

	public void setVpostalcode(String vpostalcode) {
		this.vpostalcode = vpostalcode;
	}

	public String getVcity() {
		return vcity;
	}

	public void setVcity(String vcity) {
		this.vcity = vcity;
	}

	public String getVcountry() {
		return vcountry;
	}

	public void setVcountry(String vcountry) {
		this.vcountry = vcountry;
	}

	public String getVregion() {
		return vregion;
	}

	public void setVregion(String vregion) {
		this.vregion = vregion;
	}

	public String getVlanguage() {
		return vlanguage;
	}

	public void setVlanguage(String vlanguage) {
		this.vlanguage = vlanguage;
	}

	public String getVclerk() {
		return vclerk;
	}

	public void setVclerk(String vclerk) {
		this.vclerk = vclerk;
	}

}
