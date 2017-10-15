package com.briup.cms.web.action.manager;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.briup.cms.bean.Link;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.common.util.WebUtil;
import com.briup.cms.service.ILinkService;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONObject;
@SuppressWarnings("all")
public class LinkAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	@Autowired
	private ILinkService linkService;
	
	private Link link;
	
	@Action("addLink")
	public void addLink(){
		System.out.println(link.toString());
		String msg = "";
		try {
			linkService.saveLink(link);
			msg = "添加成功！";
		} catch (ServiceException e) {
			msg = "添加失败！ "+e.getMessage();
			e.printStackTrace();
		}
		WebUtil.sendResponse(msg);
	}
	
	@Action("deleteLink")
	public void deleteLink(){
		JSONObject obj = new JSONObject();
		try {
			linkService.deleteLink(link.getId());
			obj.put("tag", "OK");
			obj.put("msg", "删除成功！");
		} catch (ServiceException e) {
			obj.put("tag", "ERROR");
			obj.put("msg", "删除失败！: "+e.getMessage());
			e.printStackTrace();
		}
		WebUtil.sendResponse(obj.toString());
	}
	
	
	@Action("updateLink")
	public void updateLink(){
		String msg = "";
		try {
			linkService.updateLink(link);
			msg = "修改成功！";
		} catch (ServiceException e) {
			msg = "修改失败！"+e.getMessage();
			e.printStackTrace();
		}
		WebUtil.sendResponse(msg);
	}
	public Link getLink() {
		return link;
	}
	public void setLink(Link link) {
		this.link = link;
	}
}	
