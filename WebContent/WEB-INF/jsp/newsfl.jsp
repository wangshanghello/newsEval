<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/static/util/util.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="container">

		<div class="row">

			<div class="col-md-12">

				<h2>
					<i class="fa fa-heartbeat"> </i>新闻栏目分类
				</h2>

			</div>

		</div>





		<div class="row">

			<div class="col-md-12">

				<table class="table table-hover">

					<tr>
						<th>#</th>
						<th>栏目类型</th>
						<th>栏目名称</th>
						

					</tr>

					<c:forEach items="${pageInfo.list}" var="s">

						<tr>
							<th><input type="checkbox" name="box" value=""
								id="test1" /></th>
							<th>${s.flcontent}</th>
							<th>${s.lmcontent }</th>
							
						</tr>

					</c:forEach>

				</table>

			</div>

		</div>
	

	<div class="row">

		<div class="col-md-6">当前${pageInfo.pageNum }页,总${pageInfo.pages }页，总${pageInfo.total }条记录</div>

		<div class="col-md-6">

			<ul class="pagination">

				<li><a href="<%=path%>/newsfl?pn=1">首页</a></li>

				<!--如果有前一页则加上前一页的超链接  -->

				<c:if test="${pageInfo.hasPreviousPage }">

					<li><a
						href="<%=path %>/newsfl?pn=${pageInfo.pageNum-1}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>

					</a></li>

				</c:if>

				<!--循环遍历所有页码并显示 -->

				<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">

					<c:if test="${page_Num==pageInfo.pageNum }">

						<li class="active"><a href="#">${page_Num}</a></li>

					</c:if>



					<c:if test="${page_Num!=pageInfo.pageNum }">

						<li><a href="<%=path %>/newsfl?pn=${page_Num}">${page_Num}</a></li>

					</c:if>





				</c:forEach>

				<!--如果有下一页则显示下一页的超级链接 -->

				<c:if test="${pageInfo.hasNextPage }">



					<li><a
						href="<%=path %>/newsfl?pn=${pageInfo.pageNum+1}"
						aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>

				</c:if>

				<li><a href="<%=path %>/newsfl?pn=${pageInfo.pages}">末页</a></li>

			</ul>

		</div>

	</div>

</div>

</body>
</html>