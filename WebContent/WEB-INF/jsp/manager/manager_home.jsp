<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/theme/1/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/theme/1/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/theme/1/css/table.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/theme/1/css/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/theme/1/jquery-easyui-themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/theme/1/css/easyui-tabs.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/theme/1/css/EditingArea.css">
<script type="text/javascript" src="<%=basePath %>/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/theme/1/js/base.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/jquery.form.js"></script>
<script type="text/javascript">
	$(function(){
		
		
		
		
		
		
		
		
		$(".baseUI a").off("click").on("click",function(){
			
			var url = $(this).attr("href");
			$(".rightContent").load(url);
			$(this).parent().addClass("active").siblings().removeClass("active");
			
			
			//阻止超链接跳转
			return false;
		});
		
		//模拟按钮被点击
		$(".baseUI a:first").trigger("click");
		
		
	});

</script>


<style type="text/css">
.active span{
	color:red;
}
.divtable {
	padding-bottom: 30px;
}
</style>
</head>

<body>
	<div class="main">
		<div id="top">
			<div class="top">
				<div class="t_logo"></div>
				<div class="t_sign">
					<span>你好，管理员</span><a href="<%=basePath %>user/home.action" class="t_exit">退出</a>
				</div>
			</div>
		</div>
		<div id="cont">
			<div class="centent">
				<div class="left">
					<ul class="baseUI">
						<li><a href="<%=basePath%>/manager/showArticleListPage.action"><em class="base_basicset"></em><span>信息管理</span></a></li>
						<li><a href="<%=basePath%>/manager/showArticlePublishPage.action"><em class="base_roll"></em><span>信息发布</span></a></li>
						<li><a href="<%=basePath%>/manager/showCategoryListPage.action"><em class="base_userset"></em><span>栏目管理</span></a></li>
						<li><a href="<%=basePath%>/manager/showAddCategoryPage.action"><em class="base_auth"></em><span>添加栏目</span></a></li>
						<li><a href="<%=basePath%>/manager/showBaseSetPage.action"><em class="base_sys"></em><span>系统设置</span></a></li>
					</ul>
				</div>
				<div class="right" style="height: 530px; overflow: auto;">
					<!-- 内容加载区 -->
					<div class="rightContent" style="padding: 10px;">
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div id="foot">
			<a href="#">杰普软件科技有限公司</a>
		</div>
	</div>
</body>
</html>