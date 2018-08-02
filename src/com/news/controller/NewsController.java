package com.news.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.news.Entity.News;
import com.news.Entity.Newsclass;
import com.news.Entity.User;
import com.news.serivce.NewsSerivce;

/**
 * 
 * @author wangshang
 * @date 2018年7月5日/上午10:31:29
 * @类作用: 控制层
 */
@Controller
public class NewsController {

	@Autowired
	private NewsSerivce newsSerivce;

	// 登录
	@RequestMapping("/login")
	public String login(User u,HttpSession session) {
		session.setAttribute("username", u.getUsername());
		Integer login = newsSerivce.login(u);
		if (login > 0) {
			return "redirect:/index";
		}
		return "redirect:/login.jsp";
	}

	// 主页
	@RequestMapping("/index")
	public String index(HttpServletRequest request,HttpSession session) {
		List<News> newsInfo = newsSerivce.newsInfos();
		String username = (String) session.getAttribute("username");
		Integer findUserState = newsSerivce.findUserState(username);
		request.setAttribute("UserState", findUserState);
		request.setAttribute("username", username);
		request.setAttribute("newsInfo", newsInfo);
		
		return "index";
	}

	// 新闻栏目
	@RequestMapping("/newslm")
	public String newslm(HttpServletRequest request,
			@RequestParam(value = "pn", defaultValue = "1") int pn, Model model) {

		// 在查询之前需要调用，传入当前第几页，以及每页多少条记录
		PageHelper.startPage(pn, 3);

		List<Newsclass> findnewslm = newsSerivce.findnewslm();

		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo<Newsclass> page = new PageInfo<Newsclass>(findnewslm, 3);
		model.addAttribute("pageInfo", page);
		return "newslm";
	}

	// 新闻栏目分类
	@RequestMapping("/newsfl")
	public String newsfl(HttpServletRequest request,
			@RequestParam(value = "pn", defaultValue = "1") int pn, Model model) {

		// 在查询之前需要调用，传入当前第几页，以及每页多少条记录
		PageHelper.startPage(pn, 3);

		List<Map<String, Object>> findnewsfl = newsSerivce.findnewsfl();

		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo<Map<String, Object>> page = new PageInfo<Map<String, Object>>(
				findnewsfl, 3);
		model.addAttribute("pageInfo", page);
		return "newsfl";
	}

	// 用户管理
	@RequestMapping("/userInfo")
	public String userInfo(HttpServletRequest request,
			@RequestParam(value = "pn", defaultValue = "1") int pn, Model model) {
		// 在查询之前需要调用，传入当前第几页，以及每页多少条记录
		PageHelper.startPage(pn, 3);
		List<User> userInfo = newsSerivce.userInfo();
		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo<User> page = new PageInfo<User>(userInfo, 3);
		model.addAttribute("pageInfo", page);

		return "userInfo";
	}

	@RequestMapping("/newsInfo")
	public String newsInfo(HttpServletRequest request,
			@RequestParam(value = "pn", defaultValue = "1") int pn, Model model) {
		// 在查询之前需要调用，传入当前第几页，以及每页多少条记录
		PageHelper.startPage(pn, 3);

		List<News> newsInfo = newsSerivce.newsInfo();

		// 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
		// 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
		PageInfo<News> page = new PageInfo<News>(newsInfo, 3);
		model.addAttribute("pageInfo", page);

		return "newsInfo";
	}

	@RequestMapping("/newsIndexInfo")
	public String newsIndexInfo(HttpServletRequest request,HttpSession session) {
		// 在查询之前需要调用，传入当前第几页，以及每页多少条记录

		List<News> newsInfo = newsSerivce.newsInfos();
		String username = (String) session.getAttribute("username");
		Integer findUserState = newsSerivce.findUserState(username);
		request.setAttribute("UserState", findUserState);
		request.setAttribute("newsInfo", newsInfo);
		request.setAttribute("username", username);
		return "index";
	}

	@RequestMapping("/addNews")
	public String addNews(News n) {
		
		System.out.println("goto");
		newsSerivce.addnews(n);

		return "redirect:/newsInfo";
	}

	@RequestMapping("/findNewsInfo")
	public void findNewsInfo(News n, HttpServletResponse response)
			throws IOException {
	
		List<News> findNewsInfo = newsSerivce.findNewsInfo(n);
		for (News news : findNewsInfo) {
			System.out.println(news.toString());
		}
		JSONArray fromObject = JSONArray.fromObject(findNewsInfo);
		response.getWriter().write(fromObject.toString());
	}

	// 删除
	@RequestMapping("/deleteNews")
	public String deleteNews(@RequestParam("newsId") Integer newsId) {
		System.out.println(newsId);
		newsSerivce.deleteNews(newsId);
		return "redirect:/newsInfo";
	}

	@RequestMapping("/updateIdNews")
	public String updateIdNews(@RequestParam("newsId") Integer newsId,
			HttpServletRequest request) {
		List<News> updateIdNews = newsSerivce.updateIdNews(newsId);
		request.setAttribute("updateIdNews", updateIdNews);
		return "updateNews";
	}

	@RequestMapping("/updateNews")
	public String updateNews(News n) {
		newsSerivce.updateNews(n);
		return "redirect:/newsInfo";
	}

	@RequestMapping("/addUser")
	public String addUser(User u) {
		newsSerivce.addUser(u);
		return "redirect:/userInfo";
	}
	
	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session) {
		session.invalidate();
		return "redirect:/login.jsp";
	}
	
	@RequestMapping("/deletenewslm")
	public String deletenewslm(@RequestParam("classId") Integer classId) {
		newsSerivce.deletenewslm(classId);
		return "redirect:/newslm";
	}
	
	@RequestMapping("/updateIdnewslm")
	public String updateIdnewslm(@RequestParam("classId") Integer classId,HttpServletRequest request) {
		
		List<Newsclass> updateIdnewslm = newsSerivce.updateIdnewslm(classId);
		request.setAttribute("updateIdnewslm", updateIdnewslm);
		return "updatenewslm";
	}
	
	@RequestMapping("/updatenewslm")
	public String updatenewslm(Newsclass n) {
		newsSerivce.updatenewslm(n);
		System.out.println(n.toString());
		return "redirect:/newslm";
	}
	
	@RequestMapping("/addnewslm")
	public String addnewslm() {
		newsSerivce.addnewslm();
		return "redirect:/newslm";
	}
}
