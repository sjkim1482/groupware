package kr.or.ddit.groupware.approval.model;

import java.util.Date;

public class AppLineVo {
	
	private String app_char   ;
	private int emp_no     ;
	private int app_cd     ;
	private int befo_app_cd;
	private int fin_app_cd ;
	private Date app_dt;
	private int app_step   ;
	private String cd_ko_nm;
	private String ko_nm;
	private int app_sta_cd;
	private String turn_rea;
	
	
	public String getTurn_rea() {
		return turn_rea;
	}
	public void setTurn_rea(String turn_rea) {
		this.turn_rea = turn_rea;
	}
	public int getApp_sta_cd() {
		return app_sta_cd;
	}
	public void setApp_sta_cd(int app_sta_cd) {
		this.app_sta_cd = app_sta_cd;
	}
	public String getKo_nm() {
		return ko_nm;
	}
	public void setKo_nm(String ko_nm) {
		this.ko_nm = ko_nm;
	}
	public String getCd_ko_nm() {
		return cd_ko_nm;
	}
	public void setCd_ko_nm(String cd_ko_nm) {
		this.cd_ko_nm = cd_ko_nm;
	}
	public Date getApp_dt() {
		return app_dt;
	}
	public void setApp_dt(Date app_dt) {
		this.app_dt = app_dt;
	}
	public String getApp_char() {
		return app_char;
	}
	public void setApp_char(String app_char) {
		this.app_char = app_char;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getApp_cd() {
		return app_cd;
	}
	public void setApp_cd(int app_cd) {
		this.app_cd = app_cd;
	}
	public int getBefo_app_cd() {
		return befo_app_cd;
	}
	public void setBefo_app_cd(int befo_app_cd) {
		this.befo_app_cd = befo_app_cd;
	}
	public int getFin_app_cd() {
		return fin_app_cd;
	}
	public void setFin_app_cd(int fin_app_cd) {
		this.fin_app_cd = fin_app_cd;
	}
	public int getApp_step() {
		return app_step;
	}
	public void setApp_step(int app_step) {
		this.app_step = app_step;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AppLineVo [app_char=");
		builder.append(app_char);
		builder.append(", emp_no=");
		builder.append(emp_no);
		builder.append(", app_cd=");
		builder.append(app_cd);
		builder.append(", befo_app_cd=");
		builder.append(befo_app_cd);
		builder.append(", fin_app_cd=");
		builder.append(fin_app_cd);
		builder.append(", app_dt=");
		builder.append(app_dt);
		builder.append(", app_step=");
		builder.append(app_step);
		builder.append(", cd_ko_nm=");
		builder.append(cd_ko_nm);
		builder.append(", ko_nm=");
		builder.append(ko_nm);
		builder.append(", app_sta_cd=");
		builder.append(app_sta_cd);
		builder.append(", turn_rea=");
		builder.append(turn_rea);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
