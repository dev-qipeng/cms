package com.briup.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.cms.bean.BasicInfo;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.dao.BasicInfoDao;
import com.briup.cms.service.IBasicInfoService;

@SuppressWarnings("all")
@Service("basicInfoService")
public class BasicInfoServiceImpl implements IBasicInfoService{
	@Autowired
	private BasicInfoDao basicInfoDao;
	
	@Override
	public void saveOrUpdateBasicInfo(BasicInfo... basicInfos) throws ServiceException {
	}

	@Override
	public Map<String, String> findAllBasicInfo() throws ServiceException {
		
		
		return null;
	}

	@Override
	public void update(BasicInfo basicInfo) throws ServiceException {
		basicInfoDao.saveOrUpdate(basicInfo);
	}

	@Override
	public BasicInfo findOneBasicInfo() throws ServiceException {
		List<BasicInfo> list = basicInfoDao.findAll();
		if (list == null || list.size() == 0) {
			throw new ServiceException("未查找到");
		}else {
			return list.get(0);
		}
	}

}
