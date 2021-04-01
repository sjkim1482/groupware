package kr.or.ddit.groupware.approval.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class AppVo {
	
	private String app_char  ;
	private int emp_no    ;
	private int app_det_no;
	private String title     ;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_dt ;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date s_dt   ;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date e_dt   ;
	private String cont      ;
	private String turn_rea  ;
	private int app_sta_cd;
	private List<String> appLineList;
	private int count;
	private String app_det_title;
	private String ko_nm;
	private String dept_nm;
	private int app_div_no;
	private List<Integer> pmsEmpList;
	
	
	
	public List<Integer> getPmsEmpList() {
		return pmsEmpList;
	}
	public void setPmsEmpList(List<Integer> pmsEmpList) {
		this.pmsEmpList = pmsEmpList;
	}
	public int getApp_div_no() {
		return app_div_no;
	}
	public void setApp_div_no(int app_div_no) {
		this.app_div_no = app_div_no;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public String getApp_det_title() {
		return app_det_title;
	}
	public void setApp_det_title(String app_det_title) {
		this.app_det_title = app_det_title;
	}
	public String getKo_nm() {
		return ko_nm;
	}
	public void setKo_nm(String ko_nm) {
		this.ko_nm = ko_nm;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List<String> getAppLineList() {
		return appLineList;
	}
	public void setAppLineList(List<String> appLineList) {
		this.appLineList = appLineList;
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
	public int getApp_det_no() {
		return app_det_no;
	}
	public void setApp_det_no(int app_det_no) {
		this.app_det_no = app_det_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public Date getS_dt() {
		return s_dt;
	}
	public void setS_dt(Date s_dt) {
		this.s_dt = s_dt;
	}
	public Date getE_dt() {
		return e_dt;
	}
	public void setE_dt(Date e_dt) {
		this.e_dt = e_dt;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
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
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AppVo [app_char=");
		builder.append(app_char);
		builder.append(", emp_no=");
		builder.append(emp_no);
		builder.append(", app_det_no=");
		builder.append(app_det_no);
		builder.append(", title=");
		builder.append(title);
		builder.append(", reg_dt=");
		builder.append(reg_dt);
		builder.append(", s_dt=");
		builder.append(s_dt);
		builder.append(", e_dt=");
		builder.append(e_dt);
		builder.append(", cont=");
		builder.append(cont);
		builder.append(", turn_rea=");
		builder.append(turn_rea);
		builder.append(", app_sta_cd=");
		builder.append(app_sta_cd);
		builder.append(", appLineList=");
		builder.append(appLineList);
		builder.append(", count=");
		builder.append(count);
		builder.append(", app_det_title=");
		builder.append(app_det_title);
		builder.append(", ko_nm=");
		builder.append(ko_nm);
		builder.append(", dept_nm=");
		builder.append(dept_nm);
		builder.append(", app_div_no=");
		builder.append(app_div_no);
		builder.append(", pmsEmpList=");
		builder.append(pmsEmpList);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	
	

	
	
	
	
	
	
}
