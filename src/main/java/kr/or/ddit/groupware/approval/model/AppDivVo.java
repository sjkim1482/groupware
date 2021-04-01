package kr.or.ddit.groupware.approval.model;

public class AppDivVo {
	
	private int app_div_no;
	private String app_div_nm;
	
	public int getApp_div_no() {
		return app_div_no;
	}
	public void setApp_div_no(int app_div_no) {
		this.app_div_no = app_div_no;
	}
	public String getApp_div_nm() {
		return app_div_nm;
	}
	public void setApp_div_nm(String app_div_nm) {
		this.app_div_nm = app_div_nm;
	}
	@Override
	public String toString() {
		return "AppDivVo [app_div_no=" + app_div_no + ", app_div_nm=" + app_div_nm + "]";
	}
	
}
