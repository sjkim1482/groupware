package kr.or.ddit.groupware.approval.model;

public class PerAppLineVo {
	
	private int per_app_line_no;
	private int emp_no         ;
	private int per_app_step   ;
	
	public int getPer_app_line_no() {
		return per_app_line_no;
	}
	public void setPer_app_line_no(int per_app_line_no) {
		this.per_app_line_no = per_app_line_no;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getPer_app_step() {
		return per_app_step;
	}
	public void setPer_app_step(int per_app_step) {
		this.per_app_step = per_app_step;
	}
	@Override
	public String toString() {
		return "PerAppLineVo [per_app_line_no=" + per_app_line_no + ", emp_no=" + emp_no + ", per_app_step="
				+ per_app_step + "]";
	}
	
	
}
