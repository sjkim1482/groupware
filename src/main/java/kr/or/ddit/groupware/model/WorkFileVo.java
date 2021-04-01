package kr.or.ddit.groupware.model;

public class WorkFileVo {
	
	private int work_no;
	private int file_no;
	
	public WorkFileVo() {};
	
	public WorkFileVo(int work_no, int file_no) {
		super();
		this.work_no = work_no;
		this.file_no = file_no;
	}
	
	public int getWork_no() {
		return work_no;
	}
	public void setWork_no(int work_no) {
		this.work_no = work_no;
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	
	@Override
	public String toString() {
		return "WorkFileVo [work_no=" + work_no + ", file_no=" + file_no + "]";
	}
	
	
}
