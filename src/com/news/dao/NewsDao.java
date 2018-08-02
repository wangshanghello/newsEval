package com.news.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.news.Entity.News;
import com.news.Entity.Newsclass;
import com.news.Entity.User;
/**
 * 
 *  @author wangshang
 * 	@date 2018年7月5日/上午11:04:37  
 * 	@类作用: 持久层
 */
@Repository
public interface NewsDao {
	//查询新闻栏目
	List<Newsclass> findnewslm();
	//验证密码是否存在
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
