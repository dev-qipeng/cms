<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.ico_edit,.ml5{
		cursor: pointer;
	}
</style>
<script type="text/javascript">

	$(function(){
		
		//单击修改图标
		$(".ico_edit").off("click").on("click",function(){
			var id = $(this).attr("val");
			var url = "showUpdateLinkPage.action";
			$(".rightContent").load(url,{'link.id':id});
		});
		
		//单击删除图标
		$(".ico_del").off("click").on("click",function(){
			var id = $(this).attr("val");
			var url = "deleteLink.action";
			var tr = $(this).parent().parent();
			//发送删除
			$.get(url,{'link.id':id},function(obj){
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
		
		
		//添加友情链接
		$("#add_link").off("click").on("click",function(){
			var name = $("#link_table").find("input").eq(0).val();
			var url = $("#link_table").find("input").eq(1).val();
			//验证输入
			if (!name || !url) {
				$.messager.alert('操作提示','不允许为空！','info');
				return false;
			}
			var action = "addLink.action";
			$.get(action,{'link.name':name,'link.url':url},function(msg){
				
				//显示提示 使用easyUI
				$.messager.show({
					title : '操作提示',
					msg : msg,
					timeout : 2000,
					showType : 'slide'
				});
				$(".rightContent").load("showBaseSetPage.action");
			});
			return false;
		});
		
		
		//设置基础信息
		$("#base_set_btn").off("click").on("click", function() {
			
			var name = $("#baseSet_table").find("input").eq(0).val();
			var address = $("#baseSet_table").find("input").eq(1).val();
			var copyright = $("#baseSet_table").find("input").eq(2).val();
			//验证输入
			if (!name || !address || !copyright) {
				$.messager.alert('操作提示','不允许为空！','info');
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
				$(".rightContent").load("showBaseSetPage.action");
			});
			return false;
		});
		
		
	});

</script>

<div class="editingarea">
<div style="float:left;width:48%">
	<div class="c_flex">
		<span class="c_flexible"></span>
	</div>
	<div class="c_editview">
		<div class="c_r_right_border">
			<div class="website_base">
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">添加友情链接</span>
				</div>
				<div class="divtable mt5">
					<table id="link_table" width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tab3">
						<tbody>
							<tr>
								<td class="tr" width="80">链接名称：</td>
								<td class="pl5"><input type="text" name="link.name"></td>
							</tr>
							<tr>
								<td class="tr" width="80">链接地址：</td>
								<td class="pl5"><input type="text" name="link.url"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="c_condition website_condition dot_line">
					<button id="add_link" class="btn_gray mr5 ml5">添加</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="c_editview">
		<div class="c_r_right_border">
		<form action="setBasicInfo.action" method="post">
			<div class="website_base">
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">基础信息设置</span>
				</div>
				<div class="divtable mt5">
					<table id="baseSet_table" width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tab3">
						<tbody>
							<tr>
								<td class="tr" width="80">公司名称：</td>
								<td class="pl5"><input  style="width:80%" type="text" name="basicInfo.name" value="${basicInfo.name }"></td>
							</tr>
							<tr>
								<td class="tr" width="80">公司地址：</td>
								<td class="pl5"><input  style="width:80%" type="text" name="basicInfo.address" value="${basicInfo.address }"></td>
							</tr>
							<tr>
								<td class="tr" width="80">版权信息：</td>
								<td class="pl5"><input style="width:80%" type="text" name="basicInfo.copyright" value="${basicInfo.copyright }"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="c_condition website_condition dot_line">
					<button id="base_set_btn" class="btn_gray mr5 ml5">设置</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
<div style="float:right;width:50%">
	<div class="divtable">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="tab1">
			<tbody>
				<tr>
					<th class="tl pl5">链接名称</th>
					<th class="tl pl5">链接地址</th>
					<th class="tl pl5">操作</th>
				</tr>
				<c:forEach items="${linkList }" var="ll">
					<tr>
						<td class="pl5">${ll.name }</td>
						<td class="pl5">
							<span class="fontLv">${ll.url }</span>
						</td>
						<td class="pl5">
							<span class="ico_edit" val="${ll.id }"></span>
							<span class="ico_del ml5" val="${ll.id }"></span>
						</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
</div>
</div>
