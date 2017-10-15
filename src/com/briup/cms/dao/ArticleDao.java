package com.briup.cms.dao;

import org.springframework.stereotype.Repository;

import com.briup.cms.bean.Article;
import com.briup.cms.common.exception.ServiceException;

/**
 * 文章信息dao
 */
@Repository
public class ArticleDao extends BaseDao<Article>{
	
	public void updateArticleClickTimes(String hql) throws ServiceException{
		getSession().createQuery(hql).executeUpdate();
	}
}
