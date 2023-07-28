package com.human.vo;

public class FreeBoardVO {

	// 시퀀스
	private int f_num;
	// 외래키
	private String u_id;
	// 외래키
	private String u_name;
	// varchar2(50)
	private String f_title;
	// varchar2(2000)
	private String f_content;
	// 체크인 익명, 기본 default 기본
	private String f_type;
	private int f_viewCnt;
	private String f_filename;
	// timestamp default sysdate
	private String f_date;

	public int getF_num() {
		return f_num;
	}

	public void setF_num(int f_num) {
		this.f_num = f_num;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public String getF_content() {
		return f_content;
	}

	public void setF_content(String f_content) {
		this.f_content = f_content;
	}

	public String getF_type() {
		return f_type;
	}

	public void setF_type(String f_type) {
		this.f_type = f_type;
	}

	public int getF_viewCnt() {
		return f_viewCnt;
	}

	public void setF_viewCnt(int f_viewCnt) {
		this.f_viewCnt = f_viewCnt;
	}

	public String getF_filename() {
		return f_filename;
	}

	public void setF_filename(String f_filename) {
		this.f_filename = f_filename;
	}

	public String getF_date() {
		return f_date;
	}

	public void setF_date(String f_date) {
		this.f_date = f_date;
	}

}
