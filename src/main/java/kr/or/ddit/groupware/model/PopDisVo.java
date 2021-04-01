package kr.or.ddit.groupware.model;

import java.util.Date;

public class PopDisVo {
	
	private int emp_no    ;
	private int popup_no  ;
	private Date inact_e_dt;
	private int act_cd    ;
	
	
	public PopDisVo(int emp_no, int popup_no, Date inact_e_dt, int act_cd) {
		super();
		this.emp_no = emp_no;
		this.popup_no = popup_no;
		this.inact_e_dt = inact_e_dt;
		this.act_cd = act_cd;
	}
	
	@Override
	public String toString() {
		return "PopDisVo [emp_no=" + emp_no + ", popup_no=" + popup_no + ", inact_e_dt=" + inact_e_dt + ", act_cd="
				+ act_cd + "]";
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getPopup_no() {
		return popup_no;
	}
	public void setPopup_no(int popup_no) {
		this.popup_no = popup_no;
	}
	public Date getInact_e_dt() {
		return inact_e_dt;
	}
	public void setInact_e_dt(Date inact_e_dt) {
		this.inact_e_dt = inact_e_dt;
	}
	public int getAct_cd() {
		return act_cd;
	}
	public void setAct_cd(int act_cd) {
		this.act_cd = act_cd;
	}
}

