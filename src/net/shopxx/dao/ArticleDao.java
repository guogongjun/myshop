/*
 * Copyright 2005-2013 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao;

import java.util.Date;
import java.util.List;

import net.shopxx.Filter;
import net.shopxx.Order;
import net.shopxx.Page;
import net.shopxx.Pageable;
import net.shopxx.entity.Article;
import net.shopxx.entity.ArticleCategory;
import net.shopxx.entity.Tag;

/**
 * Dao - 文章
 * 
 * @author SHOP++ Team
 * @version 3.0
 */
public interface ArticleDao extends BaseDao<Article, Long> {

	/**
	 * 查找文章
	 * 
	 * @param articleCategory
	 *            文章分类
	 * @param tags
	 *            标签
	 * @param count
	 *            数量
	 * @param filters
	 *            筛选
	 * @param orders 
	 *            排序
	 * @return 文章
	 */
	List<Article> findList(ArticleCategory articleCategory, List<Tag> tags, Integer count, List<Filter> filters, List<Order> orders);

	/**
	 * 查找文章
	 * 
	 * @param articleCategory
	 *            文章分类
	 * @param beginDate
	 *            起始日期
	 * @param endDate
	 *            结束日期
	 * @param first
	 *            起始记录
	 * @param count
	 *            数量
	 * @return 文章
	 */
	List<Article> findList(ArticleCategory articleCategory, Date beginDate, Date endDate, Integer first, Integer count);

	/**
	 * 查找文章分页
	 * 
	 * @param articleCategory
	 *            文章分类
	 * @param tags
	 *            标签
	 * @param pageable
	 *            分页信息
	 * @return 文章分页
	 */
	Page<Article> findPage(ArticleCategory articleCategory, List<Tag> tags, Pageable pageable);
	
	/**
	 * 查找文章
	 * 
	 * @param name
	 *            文章mingchen
	 * @return 文章
	 */
	Article findByName(String name);

	/**
	 * 查找最新1条文章
	 * @param articleCategory 
	 * @returnPage<Article>hfh
	 */
	Page<Article> findNewArticle(ArticleCategory articleCategory) ;

	List<Article> findByContent(String problemType, ArticleCategory articleCategory);

	List<Article> findByTitle(String name, ArticleCategory articleCategory);
	
	/**
	 * 查找文章分页（排序由Pageable对象设置）
	 * 
	 * @param articleCategory
	 *            文章分类
	 * @param tags
	 *            标签
	 * @param pageable
	 *            分页信息
	 * @return 文章分页
	 */
	Page<Article> findPageOrderBySetting(ArticleCategory articleCategory, List<Tag> tags, Pageable pageable);

}