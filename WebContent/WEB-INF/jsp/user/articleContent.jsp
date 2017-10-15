<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	
	$(function(){
		$(".position").find("a").eq(1).on("click",function(){
			var url = $(this).attr("href");
			$(".content").load(url);
			return false;
		});
	});
</script>
<div class="congw">
      <div class="conarticle">
               <div class="position">
               	<span class="poshome">您现在的位置：</span>
                   <a href="home.action">首页</a> >> <a href="showArticleListByCondition.action?category.id=${article.category.id }">${article.category.name }</a>
               </div>
               <div class="title">${article.title }</div>
               <div class="abstract">
               	<span>发布时间：${article.publishDate }</span>
                   <span>作者：${article.author }</span>
                   <span>点击${article.clickTimes }次</span>
               </div>
               <div class="details">
               	<p>${article.content }</p>
               </div>
      </div>
       <div class="link">
       	<div class="linelink">
       		<span>友情链接：</span><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海教育网</a>
           </div>
       </div>
   </div>