<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	
	$(function(){
		$(".art_img").on("click",function(){
			var url = $(this).find("a").attr("href");
			$(".content").load(url);
			return false;
		});
	});
</script>

<div class="congw">
      <div class="conlist">
      		<div class="position">
              	<span class="poshome">您现在的位置：</span>
                  <a href="home.action">首页</a> >> 
                  <a href="#">
                  	${category.name }
                  </a>
           </div>
           <div class="search_result">
	           <c:forEach items="${articleList }" var="a">
		           <div class="art_box">
			           <div class="art_img"><a href="showArticleContentPage.action?article.id=${a.id }"><img src="../theme/1/images/front/doc.png"></a></div>
			           <div class="art_txt">
				           <div class="title">${a.title }<span class="icon_pen"></span></div>
				           <div class="tag_txt"><span>栏目名称：${a.category.name }</span><span class="pl30">点击次数：${a.clickTimes }</span></div>
				           <div class="tag_txt">
					           <span>作者：${a.author }</span>
					           <span class="pl30">发布时间：${a.publishDate }</span>
				           </div>
			           </div>
		           </div>
		       </c:forEach>
		  	<div class="page"></div>
		  </div>
           
               	
               
      </div>
       <div class="link">
       	<div class="linelink">
       		<span>友情链接：</span><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a>
           </div>
       </div>
   </div>
