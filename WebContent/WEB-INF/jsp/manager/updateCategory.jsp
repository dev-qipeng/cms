<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		//当栏目输入框失去焦点时判断栏目是否被占用
		$("tbody").find("input").eq(0).on("blur",function(){
			var name = $(this).val();
			if(!name){
				$("#msg_span").html("");
				return false;
			}
			var url = "findCategoryByName.action";
			//发送请求查询数据库中是否有重名的栏目名
			$.get(url,{'category.name':name},function(obj){
				if (obj.flag == "ERROR") {
					console.log(obj.msg);
					$("#msg_span").html(obj.msg).toggleClass("error_span");
				}else{
					console.log(obj.msg);
					$("#msg_span").html(obj.msg).toggleClass("success_span");
				}
				
			},"json");
		});
		
		//提交按钮单机事件
		$(".btn_gray").off("click").on("click",function(){
			
			var name = $("tbody").find("input").eq(0).val();
			var code = $("tbody").find("input").eq(1).val();
			//验证输入
			if (!name || !code) {
				$.messager.alert('操作提示','不允许为空！','info');
				return false;
			}
			if(isNaN(code)){
				$.messager.alert('操作提示','栏目编号必须为数字','info');
				return false;
			}
			
			if($("#msg_span").attr("class") == "error_span"){
				$.messager.alert('操作提示','栏目名已被占用','info');
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
				var url = "showCategoryListPage.action";
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
				<form action="updateCategory.action" method="post">
					<input type="hidden" name="category.id" value="${category.id }">
					<div class="c_condition website_condition dot_line">
						<span class="yx_txt_center">修改栏目</span>
					</div>
					<div class="divtable mt5">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tab3">
							<tbody>
								<tr>
									<td class="tr" width="80">栏目名称：</td>
									<td class="pl5"><input type="text" value="${category.name }" name="category.name"><span id="msg_span"></span></td>
								</tr>
								<tr>
									<td class="tr" width="80">栏目编号：</td>
									<td class="pl5"><input type="text" value="${category.code }" name="category.code"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_left btn_left_bcol">
						<button class="btn_gray mr5 ml5">修改</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>