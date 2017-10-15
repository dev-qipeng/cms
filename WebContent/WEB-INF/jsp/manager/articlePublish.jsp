<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style>
	.success_span{
		color:green;
	}
	.error_span{
		color:red;
	}
</style>
<script type="text/javascript">
	
	$(function(){
		
		//提交表单
		$(".btn_gray").off("click").on("click", function() {
			var title = $("tbody").find("input").eq(0).val();
			var auther = $("tbody").find("input").eq(1).val();
			var id = $("tbody").find("select").val();
			var content = $("tbody").find("textarea").val();
			//验证输入
			if (!title || !auther || !content) {
				$.messager.alert('操作提示','不允许为空！','info');
				return false;
			}
			if(!id){
				$.messager.alert('操作提示','必须选择一个类别','info');
				return false;
			}
			
			//提交表单并接收返回数据
			$("form").ajaxSubmit(function(msg) {

				//显示提示 使用easyUI
				$.messager.show({
					title : '操作提示',
					msg : msg,
					timeout : 2000,
					showType : 'slide'
				});
				var url = "showArticleListPage.action";
				$(".rightContent").load(url);
				$(".baseUI li").eq(0).addClass("active").siblings().removeClass("active");
			});

			return false;
		});
	});


</script>
<div class="editingarea">
	<div class="c_flex">
		<span class="c_flexible"></span>
	</div>
	<div class="c_editview">
		<div class="c_r_right_border">
			<div class="website_base">
				<form action="<%=basePath %>manager/articlePublish.action" method="post">
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">信息发布</span>
				</div>
				<div class="divtable mt5">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tab3">
						<tbody>
							<tr>
								<td class="tr" width="80">标题：</td>
								<td class="pl5"><input type="text" name="article.title"><span id="msg_span"></span></td>
							</tr>
							<tr>
								<td class="tr" width="80">作者：</td>
								<td class="pl5"><input type="text" name="article.author"></td>
							</tr>
							<tr>
								<td class="tr" width="80">所属栏目：</td>
								<td class="pl5">
									<select name="article.category.id">
										<option value="">--请选择--</option>
										<c:forEach items="${categoryList }" var="category">
											<option value="${category.id }">${category.name }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<textarea name="article.content" class="website_edit" cols="100"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_left btn_left_bcol">
					<button class="btn_gray mr5 ml5">发布</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>