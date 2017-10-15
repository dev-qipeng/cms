package com.briup.cms.bean;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 信息类
 */
@Entity
@Table(name="tbl_article")
public class Article {
	private Long id;
	//标题
	private String title;
	//内容
	private String content;
	//作者
	private String author;
	//发布日期
	private Date publishDate;
	//点击次数
	private Integer clickTimes = 0;
	//所属栏目 文章和栏目之间关系为多对一关系
	private Category category;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public Integer getClickTimes() {
		return clickTimes;
	}
	public void setClickTimes(Integer clickTimes) {
		this.clickTimes = clickTimes;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="c_id")
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", content=" + content + ", author=" + author
				+ ", publishDate=" + publishDate + ", clickTimes=" + clickTimes + ", category=" + category + "]";
	}
}
