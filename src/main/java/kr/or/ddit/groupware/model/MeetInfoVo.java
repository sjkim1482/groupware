package kr.or.ddit.groupware.model;

public class MeetInfoVo {

	private int emp_no;
	private int meet_no;
	
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getMeet_no() {
		return meet_no;
	}
	public void setMeet_no(int meet_no) {
		this.meet_no = meet_no;
	}
	@Override
	public String toString() {
		return "MeetInfoVo [emp_no=" + emp_no + ", meet_no=" + meet_no + "]";
	}
	
}
