package com.briup.cms.web.action.manager;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.briup.cms.bean.BasicInfo;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.common.util.WebUtil;
import com.briup.cms.service.IBasicInfoService;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("all")
public class BasicInfoAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	@Autowired
	private IBasicInfoService basicInfoService;
	
	private BasicInfo basicInfo;
	
	@Action("setBasicInfo")
	public void setBasicInfo(){
		System.out.println(basicInfo.toString());
		String msg = "";
		try {
			basicInfoService.update(basicInfo);
			msg = "设置成功！";
		} catch (ServiceException e) {
			msg = "设置成功！ "+e.getMessage();
			e.printStackTrace();
		}
		WebUtil.sendResponse(msg);
	}

	public BasicInfo getBasicInfo() {
		return basicInfo;
	}

	public void setBasicInfo(BasicInfo basicInfo) {
		this.basicInfo = basicInfo;
	}

}
