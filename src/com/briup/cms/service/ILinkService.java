package com.briup.cms.service;


import java.util.List;

import com.briup.cms.bean.Link;
import com.briup.cms.common.exception.ServiceException;

/**
 * 友情链接接口
 */
public interface ILinkService {
	
	//添加链接
	void saveLink(Link link)throws ServiceException;
	//修改链接
	void updateLink(Link link)throws ServiceException;
	//删除链接
	void deleteLink(long id)throws ServiceException;
	//查询所有的链接
	List<Link> findAllLink()throws ServiceException;
	//通过id查询链接
	Link findLinkById(long id)throws ServiceException;
	
}
