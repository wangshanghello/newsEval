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
<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">
						<!-- 模态框（Modal）标题 -->
					</h4>
				</div>
				<div class="modal-body">
					<!-- 	在这里添加一些文本 -->
					<form class="form-horizontal" action="<%=path%>/addnewslm"
						method="post">
						<fieldset>
							<legend>创建栏目</legend>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="ds_host">栏目名:</label>
								<div class="col-sm-4">
									<input class="form-control" id="content" type="text"
										name="content" />
										
								</div>
								
							</div>

						</fieldset>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">确认创建</button>
						</div>


					</form>

				</div>

			</div>
		</div>
	</div>



<div class="container">

		<div class="row">

			<div class="col-md-12">

			<!-- 按钮触发模态框 -->
	<button class="btn btn-danger" data-toggle="modal"
		data-target="#myModal">创建栏目</button>

				<h2>
					<i class="fa fa-heartbeat"> </i>新闻栏目
				</h2>

			</div>

		</div>





		<div class="row">

			<div class="col-md-12">

				<table class="table table-hover">

					<tr>
						<th>#</th>
						<th>编号</th>
						<th>栏目名称</th>
						<th>刪除</th>
						<th>修改</th>

					</tr>

					<c:forEach items="${pageInfo.list}" var="s">

						<tr>
							<th><input type="checkbox" name="box" value=""
								id="test1" /></th>
							<th>${s.classId}</th>
							<th>${s.content }</th>
							<th><a href="<%=path%>/deletenewslm?classId=${s.classId}">刪除</a></th>
							<th><a href="<%=path%>/updateIdnewslm?classId=${s.classId}">修改</a></th>
						</tr>

					</c:forEach>

				</table>

			</div>

		</div>
	

	<div class="row">

		<div class="col-md-6">当前${pageInfo.pageNum }页,总${pageInfo.pages }页，总${pageInfo.total }条记录</div>

		<div class="col-md-6">

			<ul class="pagination">

				<li><a href="<%=path%>/newslm?pn=1">首页</a></li>

				<!--如果有前一页则加上前一页的超链接  -->

				<c:if test="${pageInfo.hasPreviousPage }">

					<li><a
						href="<%=path %>/newslm?pn=${pageInfo.pageNum-1}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>

					</a></li>

				</c:if>

				<!--循环遍历所有页码并显示 -->

				<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">

					<c:if test="${page_Num==pageInfo.pageNum }">

						<li class="active"><a href="#">${page_Num}</a></li>

					</c:if>



					<c:if test="${page_Num!=pageInfo.pageNum }">

						<li><a href="<%=path %>/newslm?pn=${page_Num}">${page_Num}</a></li>

					</c:if>





				</c:forEach>

				<!--如果有下一页则显示下一页的超级链接 -->

				<c:if test="${pageInfo.hasNextPage }">



					<li><a
						href="<%=path %>/newslm?pn=${pageInfo.pageNum+1}"
						aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>

				</c:if>

				<li><a href="<%=path %>/newslm?pn=${pageInfo.pages}">末页</a></li>

			</ul>

		</div>

	</div>

</div>

</body>
</html>