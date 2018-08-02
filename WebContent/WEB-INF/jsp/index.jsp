<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>
<script src="<%=path%>/static/js/jquery-2.1.1.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="<%=path%>/static/css/bootstrap.css" rel="stylesheet">
<script src="<%=path%>/static/js/xxx.js"></script>
<!-- Bootstrap core CSS -->
<link href="<%=path%>/static/css/xxx.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {

		$("li").click(function() {
			$(".div").hide()
		})
	})
</script>
</head>
<body>
	欢迎你！${requestScope.username }
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=path%>/newsIndexInfo">新闻发布</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<c:if test="${requestScope.UserState==1}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> 栏目管理 <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#" onclick="load('<%=path%>/newslm')">新闻栏目管理</a></li>
							<li><a href="#" onclick="load('<%=path%>/newsfl')">栏目分类信息</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> 用户管理 <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#" onclick="load('<%=path%>/userInfo')">用户信息管理</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> 新闻管理模块 <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#" onclick="load('<%=path%>/newsInfo')">新闻信息</a></li>
						</ul></li>
						
						<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">退出系統<b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="<%=path%>/loginOut">退出</a></li>
						</ul></li>
				</c:if>
				<c:if test="${requestScope.UserState==0}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">退出系統<b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="<%=path%>/loginOut">退出</a></li>
						</ul></li>

				</c:if>
			</ul>
		</div>
	</div>
	</nav>

	<c:forEach items="${newsInfo}" var="n">

		<div style="margin-left: 150px; margin-top: 20px" class="div">

			<h4>新闻最新发布: ${n.headTitle}</h4>
			内容:${n.content }

			<hr>
		</div>
	</c:forEach>
	<iframe id="ifc" style="width: 99.5%; height: 580px; margin-left: 5px"></iframe>

</body>
</html>