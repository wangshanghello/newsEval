package com.news.serivce;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.news.Entity.News;
import com.news.Entity.Newsclass;
import com.news.Entity.Newsskind;
import com.news.Entity.User;
import com.news.dao.NewsDao;

@Service("newsSerivce")
public class NewsSerivceImpl implements NewsSerivce {

	@Autowired
	private NewsDao newsDao;

	@Override
	public List<Newsclass> findnewslm() {
		// TODO Auto-generated method stub
		return newsDao.findnewslm();
	}

	@Override
	public Integer login(User u) {
		// TODO Auto-generated method stub
		return newsDao.login(u);
	}

	@Override
	public List<Map<String, Object>> findnewsfl() {
		// TODO Auto-generated method stub
		return newsDao.findnewsfl();
	}

	@Override
	public List<User> userInfo() {
		// TODO Auto-generated method stub
		return newsDao.userInfo();
	}

	@Override
	public List<News> newsInfo() {
		// TODO Auto-generated method stub
		return newsDao.newsInfo();
	}

	@Override
	public void addnews(News n) {
		// TODO Auto-generated method stub
		newsDao.addnews(n);
	}

	@Override
	public List<News> newsInfos() {
		// TODO Auto-generated method stub
		return newsDao.newsInfos();
	}

	@Override
	public List<News> findNewsInfo(News n) {
		// TODO Auto-generated method stub
		return newsDao.findNewsInfo(n);
	}

	@Override
	public void deleteNews(Integer newsId) {
		// TODO Auto-generated method stub
		newsDao.deleteNews(newsId);
	}

	@Override
	public List<News>  updateIdNews(Integer newsId) {
		// TODO Auto-generated method stub
		return newsDao.updateIdNews(newsId);
	}

	@Override
	public void updateNews(News n) {
		// TODO Auto-generated method stub
		newsDao.updateNews(n);
	}

	@Override
	public void addUser(User u) {
		// TODO Auto-generated method stub
		newsDao.addUser(u);
	}

	@Override
	public Integer findUserState(String username) {
		// TODO Auto-generated method stub
		return newsDao.findUserState(username);
	}

	@Override
	public void deletenewslm(Integer newsId) {
		// TODO Auto-generated method stub
		newsDao.deletenewslm(newsId);
	}

	@Override
	public void updatenewslm(Newsclass n) {
		// TODO Auto-generated method stub
		newsDao.updatenewslm(n);
	}

	@Override
	public List<Newsclass> updateIdnewslm(Integer classId) {
		// TODO Auto-generated method stub
		return newsDao.updateIdnewslm(classId);
	}

	@Override
	public void addnewslm() {
		// TODO Auto-generated method stub
		newsDao.addnewslm();
	}


}
