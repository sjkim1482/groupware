package kr.or.ddit.groupware.model;

public class JobVo {

	private int emp_no;		//사원번호
	private int job_cd;		//직무코드(H003)
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getJob_cd() {
		return job_cd;
	}
	public void setJob_cd(int job_cd) {
		this.job_cd = job_cd;
	}
	@Override
	public String toString() {
		return "JobVo [emp_no=" + emp_no + ", job_cd=" + job_cd + "]";
	}
	
	
	

}
