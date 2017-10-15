<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<div class="top">
	<div class="topbg">
        <div class="logo_sign">
        	<div class="logo"></div>
            <div class="sign">
            	<span>欢迎您系统管理员</span>
                <span class="sp_home"><a href="<%=basePath %>user/home.action">首页</a></span>
                <span class="sp_backstage"><a href="<%=basePath %>manager/home.action">后台管理</a></span>
            </div>
        </div>
        <div class="nav">
        	<ul class="navUI">
            	<li><a href="home.action">首页</a></li>
            	<c:forEach var="c" items="${categoryList }">
					<li><a href="showArticleListByCondition.action" cid="${c.id }">${c.name }</a></li>
            	</c:forEach>
            </ul>
        </div>
        
    </div>
</div>