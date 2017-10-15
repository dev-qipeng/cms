<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	$(function(){
		//提交按钮单机事件
		$(".btn_gray").off("click").on("click",function(){
			
			var name = $("tbody").find("input").eq(0).val();
			var url = $("tbody").find("input").eq(1).val();
			//验证输入
			if (!name || !url) {
				$.messager.alert('操作提示','不允许为空！','info');
				return false;
			}
			
			//提交表单
			$("form").ajaxSubmit(function(msg){
				
				//显示提示 使用easyUI
				$.messager.show({
					title : '操作提示',
					msg : msg,
					timeout : 2000,
					showType : 'slide'
				});
				var url = "showBaseSetPage.action";
				$(".rightContent").load(url);
				
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
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">修改友情链接</span>
				</div>
				<form action="updateLink.action" method="post">
					<input type="hidden" name="link.id" value="${link.id }">
					<div class="divtable mt5">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tab3">
							<tbody>
								<tr>
									<td class="tr" width="80">链接名称：</td>
									<td class="pl5"><input type="text" name="link.name" value="${link.name }"></td>
								</tr>
								<tr>
									<td class="tr" width="80">链接地址：</td>
									<td class="pl5"><input type="text" name="link.url" value="${link.url }"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="c_condition website_condition dot_line add_new_link">
						<button class="btn_gray mr5 ml5">修改</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>