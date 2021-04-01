package kr.or.ddit.groupware.model;

public class OnOffVo {
	
	private int emp_no;
	private String emp_id;
	private String ko_nm;
	private String eg_nm;
	private String dept_nm;
	private String day;
	private String date;
	private String attend_time;
	private String offwork_time;
	private String late;
	private String cd_ko_nm;
	
	public OnOffVo() {}

	public OnOffVo(int emp_no, String emp_id, String ko_nm, String eg_nm, String dept_nm, String day, String date,
			String attend_time, String offwork_time, String late, String cd_ko_nm) {
		this.emp_no = emp_no;
		this.emp_id = emp_id;
		this.ko_nm = ko_nm;
		this.eg_nm = eg_nm;
		this.dept_nm = dept_nm;
		this.day = day;
		this.date = date;
		this.attend_time = attend_time;
		this.offwork_time = offwork_time;
		this.late = late;
		this.cd_ko_nm = cd_ko_nm;
	}
	
	

	public String getCd_ko_nm() {
		return cd_ko_nm;
	}

	public void setCd_ko_nm(String cd_ko_nm) {
		this.cd_ko_nm = cd_ko_nm;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getKo_nm() {
		return ko_nm;
	}

	public void setKo_nm(String ko_nm) {
		this.ko_nm = ko_nm;
	}

	

	public String getEg_nm() {
		return eg_nm;
	}

	public void setEg_nm(String eg_nm) {
		this.eg_nm = eg_nm;
	}

	public String getDept_nm() {
		return dept_nm;
	}

	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAttend_time() {
		return attend_time;
	}

	public void setAttend_time(String attend_time) {
		this.attend_time = attend_time;
	}

	public String getOffwork_time() {
		return offwork_time;
	}

	public void setOffwork_time(String offwork_time) {
		this.offwork_time = offwork_time;
	}

	public String getLate() {
		return late;
	}

	public void setLate(String late) {
		this.late = late;
	}

	@Override
	public String toString() {
		return "OnOffVo [emp_no=" + emp_no + ", emp_id=" + emp_id + ", ko_nm=" + ko_nm + ", eg_nm=" + eg_nm
				+ ", dept_nm=" + dept_nm + ", day=" + day + ", date=" + date + ", attend_time=" + attend_time
				+ ", offwork_time=" + offwork_time + ", late=" + late + ", cd_ko_nm=" + cd_ko_nm + "]";
	}



}
