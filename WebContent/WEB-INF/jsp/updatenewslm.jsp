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
					<form class="form-horizontal" action="<%=path%>/updatenewslm"
						method="post">
						<fieldset>
							<legend>修改栏目</legend>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="ds_host">栏目名:</label>
								<div class="col-sm-4">
								<c:forEach items="${updateIdnewslm}" var="c">
									<input class="form-control" id="content" type="text"
										name="content" value="${c.content}"/>
										
									<input type="hidden" name="classId" value="${c.classId }" />	
										</c:forEach>
								</div>
								
							</div>

						</fieldset>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">确认修改</button>
						</div>


					</form>

				</div>

			</div>
		</div>
	</div>
</body>
</html>