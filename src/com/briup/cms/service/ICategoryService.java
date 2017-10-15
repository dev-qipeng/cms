package com.briup.cms.service;

import java.util.List;

import com.briup.cms.bean.Category;
import com.briup.cms.common.exception.ServiceException;
/**
 * 栏目接口
 */
public interface ICategoryService {
	//添加栏目
	void addCategory(Category category)throws ServiceException;
	//查询所有栏目
	List<Category> findAll()throws ServiceException;
	//删除栏目
	void deleteCategoryById(long id)throws ServiceException;
	//通过id查询
	Category findById(long id)throws ServiceException;
	//通过name查询
	Category findByName(String name)throws ServiceException;
	//修改栏目
	void updateCategory(Category category)throws ServiceException;
}
