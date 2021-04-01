package kr.or.ddit.groupware.model;

public class DeptVo {
	
	private int dept_no;		//부서 일련번호
	private int higher_dept_no;	//상위부서 일련번호
	private String dept_nm;		//부서 이름
	
	
	public DeptVo() {}
	
	public DeptVo(int dept_no, int higher_dept_no, String dept_nm) {
		super();
		this.dept_no = dept_no;
		this.higher_dept_no = higher_dept_no;
		this.dept_nm = dept_nm;
	}
	
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getHigher_dept_no() {
		return higher_dept_no;
	}
	public void setHigher_dept_no(int higher_dept_no) {
		this.higher_dept_no = higher_dept_no;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	
	@Override
	public String toString() {
		return "DeptVo [dept_no=" + dept_no + ", higher_dept_no=" + higher_dept_no + ", dept_nm=" + dept_nm + "]";
	}
	
	

}
