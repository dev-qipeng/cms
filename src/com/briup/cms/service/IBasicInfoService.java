package com.briup.cms.service;

import java.util.Map;

import com.briup.cms.bean.BasicInfo;
import com.briup.cms.common.exception.ServiceException;

/**
 * 基础信息接口
 */
public interface IBasicInfoService {
	//设置基本信息
	void saveOrUpdateBasicInfo(BasicInfo... basicInfos)throws ServiceException;
	//查询出所有的
	Map<String,String> findAllBasicInfo()throws ServiceException;
	void update(BasicInfo basicInfo)throws ServiceException;
	BasicInfo findOneBasicInfo()throws ServiceException;
	
}
