package com.briup.cms.web.action.manager;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.briup.cms.bean.Category;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.common.util.JsonUtil;
import com.briup.cms.common.util.WebUtil;
import com.briup.cms.service.ICategoryService;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONObject;

@SuppressWarnings("all")
public class CategoryAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private ICategoryService categoryService;
	
	private Category category;
	
	@Action("addCategory")
	public void addCategory(){
		System.out.println(category.toString());
		String msg = "";
		try {
			categoryService.addCategory(category);
			msg = "添加成功！";
		} catch (ServiceException e) {
			msg = "添加失败！ : "+e.getMessage();
			e.printStackTrace();
		}
		
		WebUtil.sendResponse(msg);
	}
	
	
	@Action("updateCategory")
	public void updateCategory(){
		System.out.println(category);
		String msg = "";
		try {
			categoryService.updateCategory(category);
			msg = "修改成功！";
		} catch (ServiceException e) {
			msg = "修改失败！ "+e.getMessage();
			e.printStackTrace();
		}
		WebUtil.sendResponse(msg);
	}
	
	@Action("deleteCategory")
	public void deleteCategory(){
		System.out.println(category.toString());
		JSONObject obj = new JSONObject();
		try {
			categoryService.deleteCategoryById(category.getId());
			obj.put("tag", "OK");
			obj.put("msg", "删除成功！");
		} catch (ServiceException e) {
			obj.put("tag", "ERROR");
			obj.put("msg", "删除失败！: "+e.getMessage());
			e.printStackTrace();
		}
		WebUtil.sendResponse(obj.toString());
	}
	
	
	
	@Action("allCategory")
	public void allCategory(){
		String json = "";
		try {
			List<Category> list = categoryService.findAll();
			for (Category c : list) {
				System.out.println(c.toString());
			}
			json = JsonUtil.getJsonArrayFromObject(list);
		} catch (ServiceException e) {
			json = null;
			e.printStackTrace();
		}
		WebUtil.sendResponse(json);
	}
	
	@Action("findCategoryByName")
	public void findCategoryByName(){
		System.out.println(category.toString());
		JSONObject obj = new JSONObject();
		Category categoryName = null;
		try {
			categoryName= categoryService.findByName(category.getName());
			if (categoryName == null) {
				obj.put("flag", "SUCCESS");
				obj.put("msg", "栏目名可用");
			}else{
				obj.put("flag", "ERROR");
				obj.put("msg", "栏目名已经被占用");
			}
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		String jsonStr = obj.toString();
		WebUtil.sendResponse(jsonStr);
	}
	

	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
}
