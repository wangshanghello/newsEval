<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/static/util/util.jsp" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=path%>/static/css/styles.css" rel="stylesheet">
<style type="text/css">
body,td,th { font-family: "Source Sans Pro", sans-serif; }
body { background-color: #2B2B2B; }
</style>
</head>
<body>


<div class="wrapper">

	<div class="container">
		<h1>Welcome</h1>
		<form class="form" action="<%=path %>/login" method="post">
			<input type="text" placeholder="Username" name="username">
			<input type="password" placeholder="Password" name="password">
			<button type="button" id="login-button">Login</button>
		</form>
	</div>
	

	
</div>

<script type="text/javascript">
$('#login-button').click(function(event){
	event.preventDefault();
	$('form').fadeOut(500);
	
	setTimeout(function(){
		$('form').submit();
	},3000);
	
	$('.wrapper').addClass('form-success');
});
</script>

</body>
</html>