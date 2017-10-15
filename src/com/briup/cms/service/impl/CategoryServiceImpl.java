package com.briup.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.cms.bean.Category;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.dao.CategoryDao;
import com.briup.cms.service.ICategoryService;

@SuppressWarnings("all")
@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService{
	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public void addCategory(Category category) throws ServiceException {
		categoryDao.save(category);
		
	}

	@Override
	public List<Category> findAll() throws ServiceException {
		return categoryDao.findAll();
	}

	@Override
	public void deleteCategoryById(long id) throws ServiceException {
		Category category = categoryDao.findById(id);
		if (category == null) {
			throw new ServiceException("要删除的类别不存在");
		}else {
			categoryDao.delete(category);
		}
		
	}

	@Override
	public Category findById(long id) throws ServiceException {
		return categoryDao.findById(id);
	}

	@Override
	public Category findByName(String name) throws ServiceException {
		String hql = "from Category c where c.name=?";
		List<Category> list = categoryDao.findByHql(hql, name);
		if (list == null || list.size() == 0) {
			return null;
		}
		return list.get(0);
	}

	@Override
	public void updateCategory(Category category) throws ServiceException {
		categoryDao.update(category);
		
	}

}
