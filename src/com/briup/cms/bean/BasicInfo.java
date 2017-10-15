package com.briup.cms.bean;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 基础信息
 */
@Entity
@Table(name="tbl_basicInfo")
public class BasicInfo {
	private Long id;
	//基本信息名称
	private String name;	
	//基本信息的值
	private String address;	
	//版权信息
	private String copyright;	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCopyright() {
		return copyright;
	}
	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}
	public BasicInfo() {
		
	}
	public BasicInfo(String name, String address, String copyright) {
		super();
		this.name = name;
		this.address = address;
		this.copyright = copyright;
	}
	@Override
	public String toString() {
		return "BasicInfo [id=" + id + ", name=" + name + ", address=" + address + ", copyright=" + copyright + "]";
	}
	
	
}
