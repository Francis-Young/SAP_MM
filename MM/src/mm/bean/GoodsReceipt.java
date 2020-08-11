package mm.bean;

import java.io.Serializable;

public class GoodsReceipt implements Serializable  {

	private int m_text;
	private String check;
	private int m_num;
	private String sloc;
	public int getM_text() {
		return m_text;
	}
	public void setM_text(int m_text) {
		this.m_text = m_text;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getSloc() {
		return sloc;
	}
	public void setSloc(String sloc) {
		this.sloc = sloc;
	}
	
	
	
}
