<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

	$(function(){
		
		//查找按钮
		$(".btn_gray").off("click").on("click",function(){
			
		var key = $(".c_condition").find("select").val();
		var value = $(".c_condition").find("input").val();
		var url = "seachArticle.action";
		
		if(key == "-1"){
			$.messager.alert('操作提示','请选择条件','info');
			return false;
		}
		if(!value){
			$.messager.alert('操作提示','关键字不能为空','info');
			return false;
		}
		$(".rightContent").load(url,{key:key,value:value});
		
		});
		
		//修改
		$(".ico_edit").off("click").on("click",function(){
			var id = $(this).attr("val");
			var url = "showUpdateArticleInfoPage.action";
			$(".rightContent").load(url,{'article.id':id});
		});
		
		
		//删除
		$(".ico_del").off("click").on("click",function(){
			
			var id = $(this).attr("val");
			var url = "deleteArticle.action";
			var tr = $(this).parent().parent()
			$.get(url,{'article.id':id},function(msg){
				
				//删除成功时
				if(msg.tag == "OK"){
					tr.fadeOut(1000,function(){
						remove();
					});
					$.messager.show({
						title : '操作提示',
						msg : msg.msg,
						timeout : 2000,
						showType : 'slide'
					});
					
				}else {
					$.messager.alert('操作提示',msg.msg,'info');
				}
			},"json");
		});
		
	});


</script>

<style>
	.ico_edit,.ml5{
		cursor: pointer;
	}
</style>
<div style="padding: 10px;0">
	<div class="c_condition">
		<span> <select name="key">
					<option value="-1">-请选择-</option>
					<option value="title">标题</option>
					<option value="author">作者</option>
					<option value="category">栏目</option>
				</select>
		</span> 
		<span>关键字：<input type="text" name="value"></span>
		<button class="btn_gray">搜索</button>
	</div>
	<div class="divtable">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="tab1">
			<tbody>
				<tr>
					<th class="tl pl5">标题</th>
					<th class="tl pl5">所属栏目</th>
					<th class="tl pl5">作者</th>
					<th class="tl pl5">发布日期</th>
					<th class="tl pl5">点击次数</th>
					<th class="tl pl5">操作</th>
				</tr>
				<c:forEach items="${articleList }" var="a">
					<tr>
						<td class="pl5">${a.title }</td>
						<td class="pl5">${a.category.name }</td>
						<td class="pl5">${a.author }</td>
						<td class="pl5">${a.publishDate }</td>
						<td class="pl5">${a.clickTimes }</td>
						<!-- 拓展 js -->
						<td class="pl5"><span class="ico_edit ml5" val="${a.id }"></span>
							<span class="ico_del ml5" val="${a.id }"></span></td>
					</tr>
				</c:forEach>
				
				
			</tbody>
		</table>

	</div>
	<div class="btn_left">
		<!-- <span class="btnL"><em class="btnR">删除</em></span> -->
	</div>
</div>