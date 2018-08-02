<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/static/util/util.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function() {

	//获取当前时间，格式YYYY-MM-DD

	var date = new Date();
	var seperator1 = "-";
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var strDate = date.getDate();
	if (month >= 1 && month <= 9) {
		month = "0" + month;
	}
	if (strDate >= 0 && strDate <= 9) {
		strDate = "0" + strDate;
	}
	document.getElementById('createdate').value = year + seperator1 + month
			+ seperator1 + strDate;

}

function aaa(newsId){
		  $.post("<%=path%>/findNewsInfo",{newsId:newsId},function(data){
		   var obj = eval("("+data+")");
		   	$("#span1").html(obj[0].headTitle);
		    $("#span2").html(obj[0].content);
		    	});
}
</script>
</head>
<body>
	<!-- ***********************************************************************
								添加
************************************************************************* -->

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
					<form class="form-horizontal" action="<%=path%>/addNews"
						method="post">
						<fieldset>
							<legend>新增新闻</legend>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="ds_host">新闻标题</label>
								<div class="col-sm-4">
									<input class="form-control" id="headTitle" type="text"
										name="headTitle" />
								</div>
								<label class="col-sm-2 control-label" for="ds_name">文章类型</label>
								<div class="col-sm-4">
									原创:<input id="myOther" type="radio" name="myOther" value="1" />
									转载:<input id="myOther" type="radio" name="myOther" value="2" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="ds_username">新闻内容</label>
								<div class="col-sm-4">
									<textarea rows="5" cols="20" name="content"></textarea>
								</div>
								<label class="col-sm-2 control-label" for="ds_password">作者</label>
								<div class="col-sm-4">
									<input class="form-control" id="author" type="text"
										name="author" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="ds_username">编辑</label>
								<div class="col-sm-4">
									<input class="form-control" id="edior" type="text" name="edior" />
								</div>

								<label class="col-sm-2 control-label" for="ds_password">出处</label>
								<div class="col-sm-4">
									<input class="form-control" id="newsFrom" type="text"
										name="newsFrom" />
								</div>

							</div>
							<input type="hidden" name="newsTime" id="createdate" />


						</fieldset>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">确认发布</button>
						</div>


					</form>

				</div>

			</div>
		</div>
	</div>



	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
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
					标题:<span id="span1"></span>
						<p>
							内容:<span id="span2"></span>

				</div>

			</div>
		</div>
	</div>
	<!-- -------------------------------------------------------------- 
                       		查询
--------------------------------------------------------------->
	<div class="container">

		<div class="row">

			<div class="col-md-12">

				<h2>
					<i class="fa fa-heartbeat"> </i>新闻栏目
				</h2>

			</div>

		</div>

		<!-- 按钮触发模态框 -->
		<button class="btn btn-danger" data-toggle="modal"
			data-target="#myModal">添加新闻</button>



		<div class="row">

			<div class="col-md-12">

				<table class="table table-hover">

					<tr>

						<th>新闻标题</th>
						<th>作者</th>
						<th>编辑</th>
						<th>文章类型</th>
						<th>出处</th>
						<th>新闻发布时间</th>
						<th>操作</th>


					</tr>

					<c:forEach items="${pageInfo.list}" var="s">

						<tr data-toggle="modal" data-target="#myModal1"
							onclick="aaa(${s.newsId})">
							<th>${s.headTitle}</th>

							<th>${s.author}</th>
							<th>${s.edior}</th>
							<th><c:if test="${s.myOther==1}">
								原创
								</c:if> <c:if test="${s.myOther==2}">
								转载
								</c:if></th>
							<th>${s.newsFrom}</th>
							<th>${s.newsTime}</th>
						   <th ><a href="<%=path %>/deleteNews?newsId=${s.newsId}"><button>删除</button></a></th>
						    <th><a href="<%=path %>/updateIdNews?newsId=${s.newsId}"><button>修改</button></a></th>	
																	

						</tr>

					</c:forEach>

				</table>

			</div>

		</div>


		<div class="row">

			<div class="col-md-6">当前${pageInfo.pageNum }页,总${pageInfo.pages }页，总${pageInfo.total }条记录</div>

			<div class="col-md-6">

				<ul class="pagination">

					<li><a href="<%=path%>/newsInfo?pn=1">首页</a></li>

					<!--如果有前一页则加上前一页的超链接  -->

					<c:if test="${pageInfo.hasPreviousPage }">

						<li><a href="<%=path %>/newsInfo?pn=${pageInfo.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>

						</a></li>

					</c:if>

					<!--循环遍历所有页码并显示 -->

					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">

						<c:if test="${page_Num==pageInfo.pageNum }">

							<li class="active"><a href="#">${page_Num}</a></li>

						</c:if>



						<c:if test="${page_Num!=pageInfo.pageNum }">

							<li><a href="<%=path %>/newsInfo?pn=${page_Num}">${page_Num}</a></li>

						</c:if>





					</c:forEach>

					<!--如果有下一页则显示下一页的超级链接 -->

					<c:if test="${pageInfo.hasNextPage}">



						<li><a href="<%=path %>/newsInfo?pn=${pageInfo.pageNum+1}"
							aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>

					</c:if>

					<li><a href="<%=path %>/newsInfo?pn=${pageInfo.pages}">末页</a></li>

				</ul>

			</div>

		</div>

	</div>

</body>
</html>