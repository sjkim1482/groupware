package kr.or.ddit.groupware.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

//게시판 게시글
public class BoardPostVo {
	private int post_no        ;
	private String title          ;
	private String cont           ;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_dt         ;
	private int hits           ;
	private int emp_no         ;
	private int bor_no         ;
	private int del_cd        ;
	private int higher_post_no ;
	private String ko_nm;
	private int boardLevel;
	
	public BoardPostVo() {}
	
	public BoardPostVo(int post_no, String title, String cont, Date reg_dt, int hits, int emp_no, int bor_no,
			int del_cd, int higher_post_no) {
		super();
		this.post_no = post_no;
		this.title = title;
		this.cont = cont;
		this.reg_dt = reg_dt;
		this.hits = hits;
		this.emp_no = emp_no;
		this.bor_no = bor_no;
		this.del_cd = del_cd;
		this.higher_post_no = higher_post_no;
	}
	
	

	public int getBoardLevel() {
		return boardLevel;
	}

	public void setBoardLevel(int boardLevel) {
		this.boardLevel = boardLevel;
	}

	public String getKo_nm() {
		return ko_nm;
	}

	public void setKo_nm(String ko_nm) {
		this.ko_nm = ko_nm;
	}

	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getBor_no() {
		return bor_no;
	}
	public void setBor_no(int bor_no) {
		this.bor_no = bor_no;
	}
	public int getDel_cd() {
		return del_cd;
	}
	public void setDel_cd(int del_cd) {
		this.del_cd = del_cd;
	}
	public int getHigher_post_no() {
		return higher_post_no;
	}
	public void setHigher_post_no(int higher_post_no) {
		this.higher_post_no = higher_post_no;
	}

	@Override
	public String toString() {
		return "BoardPostVo [post_no=" + post_no + ", title=" + title + ", cont=" + cont + ", reg_dt=" + reg_dt
				+ ", hits=" + hits + ", emp_no=" + emp_no + ", bor_no=" + bor_no + ", del_cd=" + del_cd
				+ ", higher_post_no=" + higher_post_no + ", ko_nm=" + ko_nm + "]";
	}

	

	

	
	
}