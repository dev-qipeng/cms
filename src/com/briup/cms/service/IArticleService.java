package com.briup.cms.service;

import java.util.List;

import com.briup.cms.bean.Article;
import com.briup.cms.common.exception.ServiceException;

/**
 * 文章信息接口
 */
public interface IArticleService {
	//发布文章信息
	void publish(Article article)throws ServiceException;
	//列出所有的文章信息
	List<Article> findAll()throws ServiceException;
	//通过栏目id查找该栏目下所有文章信息
	List<Article> findAllByCategoryId(long id)throws ServiceException;
	//删除文章信息
	void delete(long id)throws ServiceException;
	//通过id查询文章信息
	Article findById(long id)throws ServiceException;
	//修改文章信息
	void updateArticle(Article article)throws ServiceException;
	//根据指定条件查询文章信息
	List<Article> findArticlesByCondition(String key,String value)throws ServiceException;
	//修改文章的点击次数
	void updateArticleClickTimes(long id)throws ServiceException;
}
