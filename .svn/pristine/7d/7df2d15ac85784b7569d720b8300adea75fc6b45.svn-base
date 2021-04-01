package kr.or.ddit.groupware.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class EmpVo {
	
	private int emp_no;			//사원번호
	private int dept_no;		//부서 일련번호
	private int mgr_no;			//상사 사원번호
	private String emp_id;		//사원 아이디
	private String pass;		//비밀번호
	private String ko_nm;		//한글성명
	private String eg_nm;		//영문성명
	private String gender;		//성별
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;			//생년월일
	private String per_pn;		//개인ph
	private String dept_pn;		//부서ph
	private String per_email;	//개인email
	private String dept_email;	//부서email
	private String zipcode;		//우편번호
	private String addr1;		//주소
	private String addr2;		//상세주소
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date hire_dt;		//입사일자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date retire_dt;		//퇴사일자
	
	private int sal;			//급여
	private String profile_nm;	//프로필 사진이름
	private String profile_route;	//프로필 사진경로
	private double vac_cnt;		//연차일수
	private int per_info_agr_cd;	//개인정보동의코드(H005)
	private int ath_lv_cd;		//권한등급코드
	private int serve_cd;		//재직코드(H002)
	private int po_cd;			//직급코드(H001)
	private int real_wk_cd;		//근무상태코드(H004)
	private List<Integer> job_cd; 	//직무코드(H003)

	private String serve_nm;	//재직 한글이름
	private String po_nm;		//직급 한글이름
	private String cd_ko_nm;	//코드 한글이름
	private String job_nm;		//직무 한글이름
	private String dept_nm;		//부서 한글이름
	
	private int dept_cnt;		//부서별 count
	private int po_cnt;			//직급별 count
	private int gender_cnt;		//성별 count
	private int serve_cnt;		//재직별 count
	
	public EmpVo() {}

	public EmpVo(int emp_no, int dept_no, int mgr_no, String emp_id, String pass, String ko_nm, String eg_nm, String gender, Date birth,
				 String per_pn, String dept_pn, String per_email, String dept_email, String zipcode, String addr1, String addr2,
				 Date hire_dt, Date retire_dt, int sal, String profile_nm, String profile_route, int vac_cnt, int per_info_agr_cd,
				 int ath_lv_cd, int serve_cd, int po_cd, int real_wk_cd, String serve_nm, String po_nm, String cd_ko_nm, String job_nm, String dept_nm) { 
		
		this.emp_no = emp_no;
		this.dept_no = dept_no;
		this.mgr_no = mgr_no;
		this.emp_id = emp_id;
		this.pass = pass;
		this.ko_nm = ko_nm;
		this.eg_nm = eg_nm;
		this.gender = gender;
		this.birth = birth;
		this.per_pn = dept_pn;
		this.per_email = per_email;
		this.dept_email = dept_email;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.hire_dt = hire_dt;
		this.retire_dt = retire_dt;
		this.sal = sal;
		this.profile_nm = profile_nm;
		this.profile_route = profile_route;
		this.vac_cnt = vac_cnt;
		this.per_info_agr_cd = per_info_agr_cd;
		this.ath_lv_cd = ath_lv_cd;
		this.serve_cd = serve_cd;
		this.po_cd = po_cd;
		this.real_wk_cd = real_wk_cd;
		this.serve_nm = serve_nm;
		this.po_nm = po_nm;
		this.cd_ko_nm = cd_ko_nm;
		this.job_nm = job_nm;
		this.dept_nm = dept_nm;
	}
	
	//재직별chart(get/set)
	public int getGender_cnt() {
		return gender_cnt;
	}
	public int getServe_cnt() {
		return serve_cnt;
	}
	//성별chart(get/set)
	public void setServe_cnt(int serve_cnt) {
		this.serve_cnt = serve_cnt;
	}
	public void setGender_cnt(int gender_cnt) {
		this.gender_cnt = gender_cnt;
	}
	//직급별chart(get/set)
	public int getPo_cnt() {
		return po_cnt;
	}
	public void setPo_cnt(int po_cnt) {
		this.po_cnt = po_cnt;
	}
	//부서별chart(get/set)
	public int getDept_cnt() {
		return dept_cnt;
	}
	public void setDept_cnt(int dept_cnt) {
		this.dept_cnt = dept_cnt;
	}

	//엑셀다운로드(입사일자)
	public String getHire_dtExcel() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(hire_dt);
	}
	//엑셀다운로드(퇴사일자)
	public String getRetire_dtExcel() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(retire_dt);
	}
	//엑셀다운로드(생년월일)
	public String getBirth_Excel() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(birth);
	}
	
	public List<Integer> getJob_cd() {
		return job_cd;
	}

	public void setJob_cd(List<Integer> job_cd) {
		this.job_cd = job_cd;
	}

	public void setJob_nm(String job_nm) {
		this.job_nm = job_nm;
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
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getMgr_no() {
		return mgr_no;
	}
	public void setMgr_no(int mgr_no) {
		this.mgr_no = mgr_no;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getPer_pn() {
		return per_pn;
	}
	public void setPer_pn(String per_pn) {
		this.per_pn = per_pn;
	}
	public String getDept_pn() {
		return dept_pn;
	}
	public void setDept_pn(String dept_pn) {
		this.dept_pn = dept_pn;
	}
	public String getPer_email() {
		return per_email;
	}
	public void setPer_email(String per_email) {
		this.per_email = per_email;
	}
	public String getDept_email() {
		return dept_email;
	}
	public void setDept_email(String dept_email) {
		this.dept_email = dept_email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public Date getHire_dt() {
		return hire_dt;
	}
	public void setHire_dt(Date hire_dt) {
		this.hire_dt = hire_dt;
	}
	
	public String getRetire_dt() {
		if(this.retire_dt == null) {
			return "";
		}else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			return sdf.format(retire_dt);
		}
	}
	public void setRetire_dt(Date retire_dt) {
		this.retire_dt = retire_dt;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public String getProfile_nm() {
		return profile_nm;
	}
	public void setProfile_nm(String profile_nm) {
		this.profile_nm = profile_nm;
	}
	public String getProfile_route() {
		return profile_route;
	}
	public void setProfile_route(String profile_route) {
		this.profile_route = profile_route;
	}
	public double getVac_cnt() {
		return vac_cnt;
	}
	public void setVac_cnt(double vac_cnt) {
		this.vac_cnt = vac_cnt;
	}
	public int getPer_info_agr_cd() {
		return per_info_agr_cd;
	}
	public void setPer_info_agr_cd(int per_info_agr_cd) {
		this.per_info_agr_cd = per_info_agr_cd;
	}
	public int getAth_lv_cd() {
		return ath_lv_cd;
	}
	public void setAth_lv_cd(int ath_lv_cd) {
		this.ath_lv_cd = ath_lv_cd;
	}
	public int getServe_cd() {
		return serve_cd;
	}
	public void setServe_cd(int serve_cd) {
		this.serve_cd = serve_cd;
	}
	public int getPo_cd() {
		return po_cd;
	}
	public void setPo_cd(int po_cd) {
		this.po_cd = po_cd;
	}
	public int getReal_wk_cd() {
		return real_wk_cd;
	}
	public void setReal_wk_cd(int real_wk_cd) {
		this.real_wk_cd = real_wk_cd;
	}
	public String getServe_nm() {
		return serve_nm;
	}
	public void setServe_nm(String serve_nm) {
		this.serve_nm = serve_nm;
	}
	public String getPo_nm() {
		return po_nm;
	}
	public void setPo_nm(String po_nm) {
		this.po_nm = po_nm;
	}
	public String getJob_nm() {
		return job_nm;
	}
	
	public void setJob_nm(List<String> job_nm) {
		String list = "";
		for(int i = 0; i<job_nm.size(); i++) {
			list += job_nm.get(i);
			if(i != job_nm.size()-1) {
				list += " / ";
			}
			
		}
		this.job_nm = list;
	}

	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}

	@Override
	public String toString() {
		return "EmpVo [emp_no=" + emp_no + ", dept_no=" + dept_no + ", mgr_no=" + mgr_no + ", emp_id=" + emp_id
				+ ", pass=" + pass + ", ko_nm=" + ko_nm + ", eg_nm=" + eg_nm + ", gender=" + gender + ", birth=" + birth
				+ ", per_pn=" + per_pn + ", dept_pn=" + dept_pn + ", per_email=" + per_email + ", dept_email="
				+ dept_email + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2=" + addr2 + ", hire_dt=" + hire_dt
				+ ", retire_dt=" + retire_dt + ", sal=" + sal + ", profile_nm=" + profile_nm + ", profile_route="
				+ profile_route + ", vac_cnt=" + vac_cnt + ", per_info_agr_cd=" + per_info_agr_cd + ", ath_lv_cd="
				+ ath_lv_cd + ", serve_cd=" + serve_cd + ", po_cd=" + po_cd + ", real_wk_cd=" + real_wk_cd + ", job_cd="
				+ job_cd + ", serve_nm=" + serve_nm + ", po_nm=" + po_nm + ", cd_ko_nm=" + cd_ko_nm + ", job_nm="
				+ job_nm + ", dept_nm=" + dept_nm + ", dept_cnt=" + dept_cnt + ", po_cnt=" + po_cnt + ", gender_cnt="
				+ gender_cnt + ", serve_cnt=" + serve_cnt + "]";
	}
	





	
}
