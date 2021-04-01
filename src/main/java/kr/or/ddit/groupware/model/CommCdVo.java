package kr.or.ddit.groupware.model;

public class CommCdVo {
	
	private String comm_tp_char;	//공통코드유형 일련문자
	private int comm_no;			//공통코드 일련번호
	private String cd_ko_nm;		//코드 한글이름
	private String cd_use;			//코드 사용여부
	 
	public CommCdVo() {}
	 
	public CommCdVo(String comm_tp_char, int comm_no, String cd_ko_nm, String cd_use) {
		super();
		this.comm_tp_char = comm_tp_char;
		this.comm_no = comm_no;
		this.cd_ko_nm = cd_ko_nm;
		this.cd_use = cd_use;
	}
	
	public String getComm_tp_char() {
		return comm_tp_char;
	}
	public void setComm_tp_char(String comm_tp_char) {
		this.comm_tp_char = comm_tp_char;
	}
	public int getComm_no() {
		return comm_no;
	}
	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}
	public String getCd_ko_nm() {
		return cd_ko_nm;
	}
	public void setCd_ko_nm(String cd_ko_nm) {
		this.cd_ko_nm = cd_ko_nm;
	}
	public String getCd_use() {
		return cd_use;
	}
	public void setCd_use(String cd_use) {
		this.cd_use = cd_use;
	}
	
	
	@Override
	public String toString() {
		return "CommCdVo [comm_tp_char=" + comm_tp_char + ", comm_no=" + comm_no + ", cd_ko_nm=" + cd_ko_nm
				+ ", cd_use=" + cd_use + "]";
	}
	
}
