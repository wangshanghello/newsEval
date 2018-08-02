package com.news.Entity;
public class Newsclass {
	private Integer classId;//������Ŀ���
	private String content;//������Ŀ����
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Newsclass [classId=" + classId + ", content=" + content + "]";
	}
	
}
