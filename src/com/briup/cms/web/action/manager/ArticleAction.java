package com.briup.cms.web.action.manager;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.briup.cms.bean.Article;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.common.util.JsonUtil;
import com.briup.cms.common.util.WebUtil;
import com.briup.cms.service.IArticleService;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONObject;
@SuppressWarnings("all")
public class ArticleAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	@Autowired
	private IArticleService articleService;
	
	private List<Article> articleList;
	
	private Article article;
	
	//用户搜索文章信息: 下拉列表的值
	private String key;
	//用户搜索文章信息: 输入框的值
	private String value;
	
	@Action("articlePublish")
	public void articlePublish(){
		System.out.println(article.toString());
		String msg = "";
		try {
			articleService.publish(article);
			msg = "添加成功！";
		} catch (ServiceException e) {
			e.printStackTrace();
			msg = "添加失败！";
		}
		WebUtil.sendResponse(msg);
	}
	
	@Action(value="seachArticle",results={@Result(name="success",location="/WEB-INF/jsp/manager/articleList.jsp")})
	public String seachArticle(){
		System.out.println("key="+key+",value="+value);
		try {
			articleList = articleService.findArticlesByCondition(key, value);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	@Action("updateArticleInfo")
	public void updateArticleInfo(){
		System.out.println(article);
		String msg = "";
		try {
			articleService.updateArticle(article);
			msg = "修改成功！";
		} catch (ServiceException e) {
			msg = "修改失败！ "+e.getMessage();
			e.printStackTrace();
		}
		WebUtil.sendResponse(msg);
	}
	
	@Action("deleteArticle")
	public void deleteArticle(){
		System.out.println(article.toString());
		JSONObject obj = new JSONObject();
		try {
			articleService.delete(article.getId());
			obj.put("tag", "OK");
			obj.put("msg", "删除成功！");
		} catch (ServiceException e) {
			obj.put("tag", "ERROR");
			obj.put("msg", "删除失败！："+e.getMessage());
			e.printStackTrace();
		}
		WebUtil.sendResponse(obj.toString());
	}
	
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public List<Article> getArticleList() {
		return articleList;
	}
	public void setArticleList(List<Article> articleList) {
		this.articleList = articleList;
	}
}
