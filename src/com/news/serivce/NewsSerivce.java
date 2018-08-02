package com.news.serivce;

import java.util.List;
import java.util.Map;

import com.news.Entity.News;
import com.news.Entity.Newsclass;
import com.news.Entity.User;

/**
 * 
 *  @author wangshang
 * 	@date 2018年7月5日/上午10:35:46  
 * 	@类作用: 逻辑层
 */
public interface NewsSerivce {
	//查询新闻栏目
	List<Newsclass> findnewslm();
	//验证密码是否正确
	Integer login(User u);
	//新闻栏目分类
	List<Map<String, Object>> findnewsfl();
	List<User> userInfo();
	List<News> newsInfo();
	void addnews(News n);
	List<News> newsInfos();
	List<News> findNewsInfo(News n);
	void deleteNews(Integer newsId);
	List<News>  updateIdNews(Integer newsId);
	void updateNews(News n);
	void addUser(User u);
	Integer findUserState(String username);
	void deletenewslm(Integer newsId);
	void updatenewslm(Newsclass n);
	List<Newsclass> updateIdnewslm(Integer classId);
	void addnewslm();

}
