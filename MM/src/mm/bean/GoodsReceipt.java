package mm.bean;

import java.io.Serializable;

public class GoodsReceipt implements Serializable  {

	private String m_text;
	private int delivery_num;
	private String check;
	private int m_num;
	private String sloc;
	private String order_num;
	private String posting_date;
	private String document_date;
	private String delivery_note;
	private int pre_m_num;
	private int end_m_num;

	
	public int getEnd_m_num() {
		return end_m_num;
	}
	public void setEnd_m_num(int end_m_num) {
		this.end_m_num = end_m_num;
	}
	public int getPre_m_num() {
		return pre_m_num;
	}
	public void setPre_m_num(int pre_m_num) {
		this.pre_m_num = pre_m_num;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getPosting_date() {
		return posting_date;
	}
	public void setPosting_date(String posting_date) {
		this.posting_date = posting_date;
	}
	public String getDocument_date() {
		return document_date;
	}
	public void setDocument_date(String document_date) {
		this.document_date = document_date;
	}
	public String getDelivery_note() {
		return delivery_note;
	}
	public void setDelivery_note(String delivery_note) {
		this.delivery_note = delivery_note;
	}
	public String getM_text() {
		return m_text;
	}
	public void setM_text(String m_text) {
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
	public int getDelivery_num() {
		return delivery_num;
	}
	public void setDelivery_num(int delivery_num) {
		this.delivery_num = delivery_num;
	}
	
	
}
