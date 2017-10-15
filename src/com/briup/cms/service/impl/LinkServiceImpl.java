package com.briup.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.cms.bean.Link;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.dao.LinkDao;
import com.briup.cms.service.ILinkService;

@SuppressWarnings("all")
@Service("linkService")
public class LinkServiceImpl implements ILinkService{
	@Autowired
	private LinkDao linkDao;
	
	@Override
	public void saveLink(Link link) throws ServiceException {
		linkDao.save(link);
	}

	@Override
	public void updateLink(Link link) throws ServiceException {
		linkDao.update(link);
	}

	@Override
	public void deleteLink(long id) throws ServiceException {
		Link link = linkDao.findById(id);
		if (link == null) {
			throw new ServiceException("您所删除的连接不存在！");
		}else{
			linkDao.delete(link);
		}
	}

	@Override
	public List<Link> findAllLink() throws ServiceException {
		return linkDao.findAll();
	}

	@Override
	public Link findLinkById(long id) throws ServiceException {
		return linkDao.findById(id);
	}

}
