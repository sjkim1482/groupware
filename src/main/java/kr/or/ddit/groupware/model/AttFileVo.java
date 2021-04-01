package kr.or.ddit.groupware.model;

import java.util.Date;

public class AttFileVo {
	
	private int file_no;
	private String file_nm;
	private String file_route;
	private Date reg_dt;
	private int del_cd;
	private double file_size;
	
	public AttFileVo() {}
	
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getFile_nm() {
		return file_nm;
	}
	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}
	public String getFile_route() {
		return file_route;
	}
	public void setFile_route(String file_route) {
		this.file_route = file_route;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public int getDel_cd() {
		return del_cd;
	}
	public void setDel_cd(int del_cd) {
		this.del_cd = del_cd;
	}
	public double getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public AttFileVo(int file_no, String file_nm, String file_route, Date reg_dt, int del_cd, double file_size) {
		super();
		this.file_no = file_no;
		this.file_nm = file_nm;
		this.file_route = file_route;
		this.reg_dt = reg_dt;
		this.del_cd = del_cd;
		this.file_size = file_size;
	}
	@Override
	public String toString() {
		return "AttFileVo [file_no=" + file_no + ", file_nm=" + file_nm + ", file_route=" + file_route + ", reg_dt="
				+ reg_dt + ", del_cd=" + del_cd + ", file_size=" + file_size + "]";
	}

	
	
}
