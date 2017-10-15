<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="link">
	<div class="linelink">
		<span>友情链接：</span>
		<c:forEach items="${linkList }" var="ll">
			|<a href="${ll.url }" target="_blank">${ll.name }</a>
		</c:forEach>
	</div>
</div>