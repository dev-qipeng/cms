package com.briup.cms.web.action.user;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import com.briup.cms.bean.Article;
import com.briup.cms.bean.Category;
import com.briup.cms.bean.Link;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.service.IArticleService;
import com.briup.cms.service.IBasicInfoService;
import com.briup.cms.service.ICategoryService;
import com.briup.cms.service.ILinkService;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("all")
@Scope("prototype")
public class UserAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IBasicInfoService basicInfoService;
	@Autowired
	private ILinkService linkService;
	@Autowired
	private IArticleService articleService;
	
	private List<Category> categoryList;
	private Map<String,String> basicInfoMap;
	private List<Link> linkList;
	private List<Article> articleList;
	
	private Article article;
	private Category category;
	
	@Action(value="home",results={@Result(name="success",location="/WEB-INF/jsp/user/user_home.jsp")})
	public String home(){
		try {
			linkList = linkService.findAllLink();
			categoryList = categoryService.findAll();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	
	@Action(value="showArticleContentPage",results={@Result(name="success",location="/WEB-INF/jsp/user/articleContent.jsp")})
	public String showArticleContentPage(){
		try {
			articleService.updateArticleClickTimes(article.getId());
			article = articleService.findById(article.getId());
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	@Action(value="showArticleListByCondition",results={@Result(name="success",location="/WEB-INF/jsp/user/articleListByCategory.jsp")})
	public String showArticleListByCondition(){
		System.out.println(category.toString());
		try {
			articleList = articleService.findAllByCategoryId(category.getId());
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}
	public Map<String, String> getBasicInfoMap() {
		return basicInfoMap;
	}
	public void setBasicInfoMap(Map<String, String> basicInfoMap) {
		this.basicInfoMap = basicInfoMap;
	}
	public List<Link> getLinkList() {
		return linkList;
	}
	public void setLinkList(List<Link> linkList) {
		this.linkList = linkList;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public List<Article> getArticleList() {
		return articleList;
	}
	public void setArticleList(List<Article> articleList) {
		this.articleList = articleList;
	}
}
