package com.briup.cms.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.cms.bean.Article;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.dao.ArticleDao;
import com.briup.cms.service.IArticleService;

@SuppressWarnings("all")
@Service("articleService")
public class ArticleServiceImpl implements IArticleService{
	@Autowired
	private ArticleDao articleDao;
	
	@Override
	public void publish(Article article) throws ServiceException {
		article.setPublishDate(new Date());
		articleDao.save(article);
	}

	@Override
	public List<Article> findAll() throws ServiceException {
		return articleDao.findAll();
	}

	@Override
	public List<Article> findAllByCategoryId(long id) throws ServiceException {
		String hql = "from Article a where a.category.id=?";
		return articleDao.findByHql(hql, id);
	}

	@Override
	public void delete(long id) throws ServiceException {
		Article article = articleDao.findById(id);
		if (article == null) {
			throw new ServiceException("要删除的文章不存在");
		}else {
			articleDao.delete(article);
		}
	}

	@Override
	public Article findById(long id) throws ServiceException {
		
		return articleDao.findById(id);
	}

	@Override
	public void updateArticle(Article article) throws ServiceException {
		articleDao.update(article);
	}

	@Override
	public List<Article> findArticlesByCondition(String key, String value) throws ServiceException {
		String hql = "";
		if(key.equals("title")){
			value = "%"+value+"%";
			hql = "from Article a where a.title like ?";
		}
		if(key.equals("author")){
			hql = "from Article a where a.author=?";
		}
		if(key.equals("category")){
			hql = "from Article a where a.category.name=?";
		}
		
		return articleDao.findByHql(hql, value);
	}

	@Override
	public void updateArticleClickTimes(long id) throws ServiceException {
		String hql = "update from Article set clickTimes=clickTimes+1 where id="+id;
		articleDao.updateArticleClickTimes(hql);
	}


}
