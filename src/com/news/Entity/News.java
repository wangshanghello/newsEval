package com.news.Entity;

public class News {
	private Integer newsId;//���ű��
	private Integer calssId;//�������������
	private Integer kindId;//�������ŷ�����
	private Integer myOther;//ԭ����ת��
	private String headTitle;//���ű���
	private String content;//��������
	private String connect;//�������
	private String author;//����
	private String edior;//�༭
	private String newsFrom;//����
	private Integer top;//�Ƿ��ö�
	private String newsTime;//���ŷ���ʱ��
	private Integer hits;//���ŵ������
	private Integer state;//����״̬
	private Integer tag;//���ű��
	
	public Integer getNewsId() {
		return newsId;
	}
	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}
	public Integer getCalssId() {
		return calssId;
	}
	public void setCalssId(Integer calssId) {
		this.calssId = calssId;
	}
	public Integer getKindId() {
		return kindId;
	}
	public void setKindId(Integer kindId) {
		this.kindId = kindId;
	}
	public Integer getMyOther() {
		return myOther;
	}
	public void setMyOther(Integer myOther) {
		this.myOther = myOther;
	}
	public String getHeadTitle() {
		return headTitle;
	}
	public void setHeadTitle(String headTitle) {
		this.headTitle = headTitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getConnect() {
		return connect;
	}
	public void setConnect(String connect) {
		this.connect = connect;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getEdior() {
		return edior;
	}
	public void setEdior(String edior) {
		this.edior = edior;
	}
	public String getNewsFrom() {
		return newsFrom;
	}
	public void setNewsFrom(String newsFrom) {
		this.newsFrom = newsFrom;
	}
	public Integer getTop() {
		return top;
	}
	public void setTop(Integer top) {
		this.top = top;
	}
	public String getNewsTime() {
		return newsTime;
	}
	public void setNewsTime(String newsTime) {
		this.newsTime = newsTime;
	}
	public Integer getHits() {
		return hits;
	}
	public void setHits(Integer hits) {
		this.hits = hits;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getTag() {
		return tag;
	}
	public void setTag(Integer tag) {
		this.tag = tag;
	}



	@Override
	public String toString() {
		return "News [newsId=" + newsId + ", calssId=" + calssId + ", kindId="
				+ kindId + ", myOther=" + myOther + ", headTitle=" + headTitle
				+ ", content=" + content + ", connect=" + connect + ", author="
				+ author + ", edior=" + edior + ", newsFrom=" + newsFrom
				+ ", top=" + top + ", newsTime=" + newsTime + ", hits=" + hits
				+ ", state=" + state + ", tag=" + tag + "]";
	}
	
	
	
}
