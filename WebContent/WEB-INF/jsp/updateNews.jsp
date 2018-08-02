<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/static/util/util.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	$("#myModal").modal({
		keyboard : true,
		backdrop: 'static'   //bootstrap模态框禁止点击空白关闭
	});
});
</script>
<style>
#content{
	width: 150px;
	height: 30px;
}

</style>
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
					<form class="form-horizontal" action="<%=path%>/updateNews"
						method="post">
						<c:forEach items="${updateIdNews}" var ="u">
						<input type="hidden" name="newsId" value="${u.newsId }"/>
						<fieldset>
							<legend>新增新闻</legend>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="ds_host">新闻标题</label>
								<div class="col-sm-4">
									<input class="form-control" id="headTitle" type="text"
										name="headTitle" value="${u.headTitle}"/>
								</div>
								<label class="col-sm-2 control-label" for="ds_name">文章类型</label>
								<div class="col-sm-4">
									原创:<input id="myOther" type="radio" name="myOther" value="1" <c:if test="${u.myOther==1}"> checked="checked"</c:if> />
									转载:<input id="myOther" type="radio" name="myOther" value="2" <c:if test="${u.myOther==2}"> checked="checked"</c:if>/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="ds_username">新闻内容</label>
								<div class="col-sm-4">
									
									<input class="form-control" id="content" type="text"
										name="content" value="${u.content }"/>
									
								</div>
								<label class="col-sm-2 control-label" for="ds_password">作者</label>
								<div class="col-sm-4">
									<input class="form-control" id="author" type="text"
										name="author" value="${u.author }"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="ds_username">编辑</label>
								<div class="col-sm-4">
									<input class="form-control" id="edior" type="text" name="edior" value="${u.edior }"/>
								</div>

								<label class="col-sm-2 control-label" for="ds_password">出处</label>
								<div class="col-sm-4">
									<input class="form-control" id="newsFrom" type="text"
										name="newsFrom" value="${u.newsFrom }"/>
								</div>

							</div>
							<input type="hidden" name="newsTime" id="createdate" />


						</fieldset>
						</c:forEach>
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

</body>
</html>