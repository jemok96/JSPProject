package com.dongwon.entity;

import java.sql.Date;

public class FreeBoardDTO {
	private int id;
	private String title;
	private String writer_id;
	private Date regdate;
	private String content;
	private int hit;
	
	public FreeBoardDTO() {}
	public FreeBoardDTO(int id, String title, String writer_id, Date regdate, String content, int hit) {
		this.id = id;
		this.title = title;
		this.writer_id = writer_id;
		this.regdate = regdate;
		this.content = content;
		this.hit = hit;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "freeBoard [id=" + id + ", title=" + title + ", writer_id=" + writer_id + ", regdate=" + regdate
				+ ", content=" + content + ", hit=" + hit + "]";
	}
	
	
}
