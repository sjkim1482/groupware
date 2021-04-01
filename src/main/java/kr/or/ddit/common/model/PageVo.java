package kr.or.ddit.common.model;

public class PageVo {
	private int page;
	private int pageSize;
	private String keyword;
	private int bor_no;
	private int emp_no;
	private int msg_box_no;
	
	public PageVo() {}
	
	public PageVo(int page, int pageSize) {
		this.page = page;
		this.pageSize = pageSize;
	}
	
	
	
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getBor_no() {
		return bor_no;
	}

	public void setBor_no(int bor_no) {
		this.bor_no = bor_no;
	}

	
	public int getPage() {
		return page == 0 ? 1:page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize == 0 ? 15 : pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String toString() {
		return "PageVo [page=" + page + ", pageSize=" + pageSize + ", keyword=" + keyword + ", bor_no=" + bor_no
				+ ", emp_no=" + emp_no + ", msg_box_no=" + msg_box_no + "]";
	}

	
	
	
	
}
