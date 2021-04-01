package kr.or.ddit.groupware.model;

public class MsgBoxVo {

	private int msg_box_no;
	private int emp_no;
	private String msg_box_nm;
	private int act_cd;
	public int getMsg_box_no() {
		return msg_box_no;
	}
	public void setMsg_box_no(int msg_box_no) {
		this.msg_box_no = msg_box_no;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getMsg_box_nm() {
		return msg_box_nm;
	}
	public void setMsg_box_nm(String msg_box_nm) {
		this.msg_box_nm = msg_box_nm;
	}
	public int getAct_cd() {
		return act_cd;
	}
	public void setAct_cd(int act_cd) {
		this.act_cd = act_cd;
	}
	
	@Override
	public String toString() {
		return "MsgBoxVo [msg_box_no=" + msg_box_no + ", emp_no=" + emp_no + ", msg_box_nm=" + msg_box_nm + ", act_cd="
				+ act_cd + "]";
	}
	
	

}
