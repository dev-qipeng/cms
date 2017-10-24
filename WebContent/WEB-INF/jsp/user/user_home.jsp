<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/theme/1/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/theme/1/css/front/style.css">
<script type="text/javascript" src="<%=basePath %>/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/theme/1/js/base.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/jquery.form.js"></script>
<script type="text/javascript">
	function refresh(){
		window.location.reload();
	}
	$(function(){
		
		//导航栏单击事件
		$(".navUI a").off("click").on("click",function(){
			var url = $(this).attr("href");
			//如果单击的是首页
			if(url == "home.action"){
				refresh();//刷新页面
				return false;
			}
			var id = $(this).attr("cid");
			var name = $(this).html();
			$(".content").load(url,{'category.id':id,'category.name':name});
			return false;
		});
		
		//内容区域“更多”的单击事件
		$(".txt_time a").off("click").on("click",function(){
			var url = $(this).attr("href");
			var id = $(this).attr("cid");
			var name = $(this).attr("cname");
			$(".content").load(url,{'category.id':id,'category.name':name});
			return false;
		});
		
		//内容区域文章单击事件
		$(".discipUI a").off("click").on("click",function(){
			var url = $(this).attr("href");
			$(".content").load(url);
			return false;
		});
		
		
	});

</script>
</head>
<body>


<div id="main">
	<jsp:include page="../include/header.jsp"></jsp:include>
    
    <div class="content">
    	<div class="banner">
        	<div class="banimg"><img src="<%=basePath %>/theme/1/images/front/banner.png"></div>
        </div>
    	<div class="congw">
            
            <div class="clear"></div>
            <div class="box">
            <c:forEach items="${categoryList }" var="cl">
            	<div class="box_b">
                	<div class="title">
                    	<span class="txt_title">${cl.name }</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
	                        	<a href="showArticleListByCondition.action" cid="${cl.id }" cname="${cl.name }">更多>></a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                    		<c:forEach items="${cl.getArticles() }" var="a" end="5" begin="0">
	                        	<li>
	                            	<a href="showArticleContentPage.action?article.id=${a.id }" class="txt_title">${a.title }</a><span class="txt_discipline">${a.author }</span><span class="txt_time"><fmt:formatDate value="${a.publishDate }"/> </span>
	                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:forEach>
            </div>
     </div>
    	<jsp:include page="../include/link.jsp"></jsp:include>
    </div>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</div>
</body>
</html>
