<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.active span {
	color: red;
}

.divtable {
	padding-bottom: 30px;
}
.ico_edit,.ml5{
	cursor: pointer;
}
</style>

<script type="text/javascript">
	$(function(){
		
		
		//单击修改图标
		$(".ico_edit").on("click",function(){
			var id = $(this).attr("val");
			var url = "showUpdateCategoryPage.action";
			$(".rightContent").load(url,{'category.id':id});
		});
		
		//单击删除图标
		$(".ico_del").off("click").on("click",function(){
			var id = $(this).attr("val");
			var url = "deleteCategory.action";
			var tr = $(this).parent().parent();
			//发送删除
			$.get(url,{'category.id':id},function(obj){
				//删除成功时
				if(obj.tag == "OK"){
					tr.fadeOut(1000,function(){
		//				remove();
					});
					$.messager.show({
						title : '操作提示',
						msg : obj.msg,
						timeout : 2000,
						showType : 'slide'
					});
				} else{
					$.messager.alert('操作提示',obj.msg,'info');
				}
				
			},"json");
			
			
		});
		
		
	});


</script>

<body>
	<div class="divtable">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="tab1">
			<tbody>
				<tr>
					<th class="tl pl5">栏目名称</th>
					<th class="tl pl5">栏目编号</th>
					<th class="tl pl5">操作</th>
				</tr>
				<c:forEach items="${categoryList }" var="c">
					<tr>
						<td class="pl5">${c.name }</td>
						<td class="pl5"><span class="fontLv">${c.code }</span></td>
						<td class="pl5">
							<span class="ico_edit ml5" val="${c.id }"></span>
							<span class="ico_del ml5" val="${c.id }"></span>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="btn_left">
			<!-- <span class="btnL"><em class="btnR">删除</em></span> -->
		</div>
	</div>
</body>
</html>

</html>