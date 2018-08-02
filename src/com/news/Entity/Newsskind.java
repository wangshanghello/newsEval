package com.news.Entity;
public class Newsskind {
	private Integer KindId;//��Ŀ������
	private String content;//��Ŀ��������
	private Integer classId;//����������Ŀ���
	
	public Integer getKindId() {
		return KindId;
	}
	public void setKindId(Integer kindId) {
		KindId = kindId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
}
