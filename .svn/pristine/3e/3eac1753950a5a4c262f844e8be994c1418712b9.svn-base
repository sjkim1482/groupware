package kr.or.ddit.groupware.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

// �뙘�뾽
public class PopUpVo {
	
	
	private int popup_no;
	private String title   ;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date s_time  ;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date e_time  ;
	private int act_cd  ;
	private String cont    ;
	
	public PopUpVo() {}
	
	public int getPopup_no() {
		return popup_no;
	}
	public void setPopup_no(int popup_no) {
		this.popup_no = popup_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getS_time() {
		return s_time;
	}
	public void setS_time(Date s_time) {
		this.s_time = s_time;
	}
	public Date getE_time() {
		return e_time;
	}
	public void setE_time(Date e_time) {
		this.e_time = e_time;
	}
	public int getAct_cd() {
		return act_cd;
	}
	public void setAct_cd(int act_cd) {
		this.act_cd = act_cd;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public PopUpVo(int popup_no, String title, Date s_time, Date e_time, int act_cd, String cont) {
		super();
		this.popup_no = popup_no;
		this.title = title;
		this.s_time = s_time;
		this.e_time = e_time;
		this.act_cd = act_cd;
		this.cont = cont;
	}
	@Override
	public String toString() {
		return "PopUpVo [popup_no=" + popup_no + ", title=" + title + ", s_time=" + s_time + ", e_time=" + e_time
				+ ", act_cd=" + act_cd + ", cont=" + cont + "]";
	}
	
	
	
}
