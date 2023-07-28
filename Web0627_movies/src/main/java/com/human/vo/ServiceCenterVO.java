package com.human.vo;

public class ServiceCenterVO {

	private int sc_num;
	private String u_id;
	private String sc_title;
	private String sc_content;
	private String sc_answer;
	private String sc_date;
	private int cnt;

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getSc_num() {
		return sc_num;
	}

	public void setSc_num(int sc_num) {
		this.sc_num = sc_num;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getSc_title() {
		return sc_title;
	}

	public void setSc_title(String sc_title) {
		this.sc_title = sc_title;
	}

	public String getSc_content() {
		return sc_content;
	}

	public void setSc_content(String sc_content) {
		this.sc_content = sc_content;
	}

	public String getSc_answer() {
		return sc_answer;
	}

	public void setSc_answer(String sc_answer) {
		this.sc_answer = sc_answer;
	}

	public String getSc_date() {
		return sc_date;
	}

	public void setSc_date(String sc_date) {
		this.sc_date = sc_date;
	}
}