package kr.or.ddit.groupware.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PmsVo {

	private int pms_no;
	private String app_char;
	private int emp_no;
	private String emp_id;
	private int app_emp_no;
	private String pms_nm;
	private String cont;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date s_dt;
	private String s_dtS;
	private String e_dtS;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date e_dt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date Dest_time; /* 프로젝트 추정시간*/
	private int prog;
	private int sta_cd;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg_dt;
	private String dept_nm;
	private String ko_nm;
	private String cd_ko_nm; /*직급 상태명*/
	private String title;
	private int attend_emp_no;
	private String pri_order_nm; /*우선순위 상태명*/
	private String sta_cd_nm; /*상태코드 상태명*/
	
	//------------------------------------------------
	
	/*일감리스트*/
	private int est_time; /*일감 추정시간*/
	private int work_no;
	private int higher_work_no;
	private String higher_work_nm;
	private String work_nm;
	private String file_nm;
	private String file_route;
	private int pri_order;
	private int workLevel; /**/
	
	
	
	
	
	public PmsVo() {
		
	}
	

	





	public PmsVo(int pms_no, String app_char, int emp_no, String emp_id, int app_emp_no, String pms_nm, String cont,
			Date s_dt, String s_dtS, String e_dtS, Date e_dt, Date dest_time, int prog, int sta_cd, Date reg_dt,
			String dept_nm, String ko_nm, String cd_ko_nm, String title, int attend_emp_no, String pri_order_nm,
			String sta_cd_nm, int est_time, int work_no, int higher_work_no, String higher_work_nm, String work_nm,
			String file_nm, String file_route, int pri_order, int workLevel) {
		super();
		this.pms_no = pms_no;
		this.app_char = app_char;
		this.emp_no = emp_no;
		this.emp_id = emp_id;
		this.app_emp_no = app_emp_no;
		this.pms_nm = pms_nm;
		this.cont = cont;
		this.s_dt = s_dt;
		this.s_dtS = s_dtS;
		this.e_dtS = e_dtS;
		this.e_dt = e_dt;
		Dest_time = dest_time;
		this.prog = prog;
		this.sta_cd = sta_cd;
		this.reg_dt = reg_dt;
		this.dept_nm = dept_nm;
		this.ko_nm = ko_nm;
		this.cd_ko_nm = cd_ko_nm;
		this.title = title;
		this.attend_emp_no = attend_emp_no;
		this.pri_order_nm = pri_order_nm;
		this.sta_cd_nm = sta_cd_nm;
		this.est_time = est_time;
		this.work_no = work_no;
		this.higher_work_no = higher_work_no;
		this.higher_work_nm = higher_work_nm;
		this.work_nm = work_nm;
		this.file_nm = file_nm;
		this.file_route = file_route;
		this.pri_order = pri_order;
		this.workLevel = workLevel;
	}








	public PmsVo(int pms_no, String app_char, int emp_no, int app_emp_no, String pms_nm, String cont, Date s_dt,
			String s_dtS, String e_dtS, Date e_dt, Date dest_time, int prog, int sta_cd, Date reg_dt, String dept_nm,
			String ko_nm, String cd_ko_nm, String title, int attend_emp_no, String pri_order_nm, String sta_cd_nm,
			int est_time, int work_no, int higher_work_no, String higher_work_nm, String work_nm, int pri_order,
			int workLevel) {
		super();
		this.pms_no = pms_no;
		this.app_char = app_char;
		this.emp_no = emp_no;
		this.app_emp_no = app_emp_no;
		this.pms_nm = pms_nm;
		this.cont = cont;
		this.s_dt = s_dt;
		this.s_dtS = s_dtS;
		this.e_dtS = e_dtS;
		this.e_dt = e_dt;
		this.Dest_time = dest_time;
		this.prog = prog;
		this.sta_cd = sta_cd;
		this.reg_dt = reg_dt;
		this.dept_nm = dept_nm;
		this.ko_nm = ko_nm;
		this.cd_ko_nm = cd_ko_nm;
		this.title = title;
		this.attend_emp_no = attend_emp_no;
		this.pri_order_nm = pri_order_nm;
		this.sta_cd_nm = sta_cd_nm;
		this.est_time = est_time;
		this.work_no = work_no;
		this.higher_work_no = higher_work_no;
		this.higher_work_nm = higher_work_nm;
		this.work_nm = work_nm;
		this.pri_order = pri_order;
		this.workLevel = workLevel;
	}




	
	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public int getDays() {
		int dateDiff = (int) Math.ceil((e_dt.getTime()-s_dt.getTime())/(1000*3600*24));

		return dateDiff;
		
	}
	public int getPms_no() {
		return pms_no;
	}

	public void setPms_no(int pms_no) {
		this.pms_no = pms_no;
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


	public int getApp_emp_no() {
		return app_emp_no;
	}


	public void setApp_emp_no(int app_emp_no) {
		this.app_emp_no = app_emp_no;
	}


	public String getPms_nm() {
		return pms_nm;
	}


	public void setPms_nm(String pms_nm) {
		this.pms_nm = pms_nm;
	}


	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
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

	public Date getDest_time() {
		return Dest_time;
	}

	public void setDest_time(Date dest_time) {
		Dest_time = dest_time;
	}

	public int getEst_time() {
		return est_time;
	}


	public void setEst_time(int est_time) {
		this.est_time = est_time;
	}


	public int getProg() {
		return prog;
	}


	public void setProg(int prog) {
		this.prog = prog;
	}


	public int getSta_cd() {
		return sta_cd;
	}


	public void setSta_cd(int sta_cd) {
		this.sta_cd = sta_cd;
	}


	public Date getReg_dt() {
		return reg_dt;
	}


	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}


	public String getDept_nm() {
		return dept_nm;
	}


	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}

	public String getKo_nm() {
		return ko_nm;
	}

	public void setKo_nm(String ko_nm) {
		this.ko_nm = ko_nm;
	}

	public int getAttend_emp_no() {
		return attend_emp_no;
	}

	public void setAttend_emp_no(int attend_emp_no) {
		this.attend_emp_no = attend_emp_no;
	}

	public int getWork_no() {
		return work_no;
	}

	public void setWork_no(int work_no) {
		this.work_no = work_no;
	}

	public int getHigher_work_no() {
		return higher_work_no;
	}

	public void setHigher_work_no(int higher_work_no) {
		this.higher_work_no = higher_work_no;
	}

	public String getWork_nm() {
		return work_nm;
	}

	public void setWork_nm(String work_nm) {
		this.work_nm = work_nm;
	}

	public int getPri_order() {
		return pri_order;
	}

	public void setPri_order(int pri_order) {
		this.pri_order = pri_order;
	}

	public String getPri_order_nm() {
		return pri_order_nm;
	}

	public void setPri_order_nm(String pri_order_nm) {
		this.pri_order_nm = pri_order_nm;
	}

	public String getSta_cd_nm() {
		return sta_cd_nm;
	}

	public void setSta_cd_nm(String sta_cd_nm) {
		this.sta_cd_nm = sta_cd_nm;
	}


	public int getWorkLevel() {
		return workLevel;
	}

	public void setWorkLevel(int workLevel) {
		this.workLevel = workLevel;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}

	public String getCd_ko_nm() {
		return cd_ko_nm;
	}


	public void setCd_ko_nm(String cd_ko_nm) {
		this.cd_ko_nm = cd_ko_nm;
	}

	public String getHigher_work_nm() {
		return higher_work_nm;
	}

	public void setHigher_work_nm(String higher_work_nm) {
		this.higher_work_nm = higher_work_nm;
	}
	public String getS_dtS() {
		return s_dtS;
	}

	public void setS_dtS(String s_dtS) {
		this.s_dtS = s_dtS;
	}

	public String getE_dtS() {
		return e_dtS;
	}
	public void setE_dtS(String e_dtS) {
		this.e_dtS = e_dtS;
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


	
	@Override
	public String toString() {
		return "PmsVo [pms_no=" + pms_no + ", app_char=" + app_char + ", emp_no=" + emp_no + ", emp_id=" + emp_id
				+ ", app_emp_no=" + app_emp_no + ", pms_nm=" + pms_nm + ", cont=" + cont + ", s_dt=" + s_dt + ", s_dtS="
				+ s_dtS + ", e_dtS=" + e_dtS + ", e_dt=" + e_dt + ", Dest_time=" + Dest_time + ", prog=" + prog
				+ ", sta_cd=" + sta_cd + ", reg_dt=" + reg_dt + ", dept_nm=" + dept_nm + ", ko_nm=" + ko_nm
				+ ", cd_ko_nm=" + cd_ko_nm + ", title=" + title + ", attend_emp_no=" + attend_emp_no + ", pri_order_nm="
				+ pri_order_nm + ", sta_cd_nm=" + sta_cd_nm + ", est_time=" + est_time + ", work_no=" + work_no
				+ ", higher_work_no=" + higher_work_no + ", higher_work_nm=" + higher_work_nm + ", work_nm=" + work_nm
				+ ", file_nm=" + file_nm + ", file_route=" + file_route + ", pri_order=" + pri_order + ", workLevel="
				+ workLevel + "]";
	}
	
	
}
