/*
 * Copyright 2005-2013 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import net.shopxx.dao.ProductCategoryDao;
import net.shopxx.entity.ProductCategory;
import net.shopxx.entity.Store;
import net.shopxx.service.ProductCategoryService;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service - 商品分类
 * 
 * @author SHOP++ Team
 * @version 3.0
 */
@Service("productCategoryServiceImpl")
public class ProductCategoryServiceImpl extends BaseServiceImpl<ProductCategory, Long> implements ProductCategoryService {

	@Resource(name = "productCategoryDaoImpl")
	private ProductCategoryDao productCategoryDao;

	@Resource(name = "productCategoryDaoImpl")
	public void setBaseDao(ProductCategoryDao productCategoryDao) {
		super.setBaseDao(productCategoryDao);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findRoots() {
		return productCategoryDao.findRoots(null);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findRoots(Integer count) {
		return productCategoryDao.findRoots(count);
	}

	@Transactional(readOnly = true)
	@Cacheable("productCategory")
	public List<ProductCategory> findRoots(Integer count, String cacheRegion) {
		return productCategoryDao.findRoots(count);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findParents(ProductCategory productCategory) {
		return productCategoryDao.findParents(productCategory, null);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findParents(ProductCategory productCategory, Integer count) {
		return productCategoryDao.findParents(productCategory, count);
	}

	@Transactional(readOnly = true)
	@Cacheable("productCategory")
	public List<ProductCategory> findParents(ProductCategory productCategory, Integer count, String cacheRegion) {
		return productCategoryDao.findParents(productCategory, count);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findTree() {
		return productCategoryDao.findChildren(null, null);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findChildren(ProductCategory productCategory) {
		return productCategoryDao.findChildren(productCategory, null);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findChildren(ProductCategory productCategory, Integer count) {
		return productCategoryDao.findChildren(productCategory, count);
	}

	@Transactional(readOnly = true)
	@Cacheable("productCategory")
	public List<ProductCategory> findChildren(ProductCategory productCategory, Integer count, String cacheRegion) {
		return productCategoryDao.findChildren(productCategory, count);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "product", "productCategory", "review", "consultation" }, allEntries = true)
	public void save(ProductCategory productCategory) {
		super.save(productCategory);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "product", "productCategory", "review", "consultation" }, allEntries = true)
	public ProductCategory update(ProductCategory productCategory) {
		return super.update(productCategory);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "product", "productCategory", "review", "consultation" }, allEntries = true)
	public ProductCategory update(ProductCategory productCategory, String... ignoreProperties) {
		return super.update(productCategory, ignoreProperties);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "product", "productCategory", "review", "consultation" }, allEntries = true)
	public void delete(Long id) {
		super.delete(id);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "product", "productCategory", "review", "consultation" }, allEntries = true)
	public void delete(Long... ids) {
		super.delete(ids);
	}

	@Override
	@Transactional
	@CacheEvict(value = { "product", "productCategory", "review", "consultation" }, allEntries = true)
	public void delete(ProductCategory productCategory) {
		super.delete(productCategory);
	}
	
	/**
	 * @Description 根据父类id查询子类
	 * @param  parentId
	 * @author Guoxianlong
	 * @create_date Sep 3, 2014 8:59:39 AM
	 */
	@Transactional
	public List<ProductCategory> findChildrenByParent(Long parentId) {
		return productCategoryDao.findChildrenByParent(parentId);
	}
	
	@Transactional(readOnly = true)
	public List<ProductCategory> findRootsByEntcode(Integer count, String entcode) {
		return productCategoryDao.findRootsByEntcode(count , entcode);
	}
	
	@Transactional(readOnly = true)
	@Cacheable("productCategory")
	public List<ProductCategory> findRoots(Integer count, Long storeId, String cacheRegion) {
		return productCategoryDao.findRoots(count, storeId);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findRootsByEntcode(Integer count, Long storeId, String entcode) {
		return productCategoryDao.findRootsByEntcode(count, storeId, entcode);
	}
	
	@Transactional(readOnly = true)
	public List<ProductCategory> findRoots(Integer count, Long storeId) {
		return productCategoryDao.findRoots(count, storeId);
	}

	public ProductCategory findProductCategoryByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return productCategoryDao.findProductCategoryByKeyword(keyword);
	}

	@Override
	public List<ProductCategory> findTreeForStore() {
		return productCategoryDao.findChildrenForStore(null, null);
	}
	
	@Transactional
	public List<ProductCategory> findChildrenForStoreForFront (ProductCategory productCategory, Integer count, Store store) {
		return productCategoryDao.findChildrenForStoreForFront(productCategory, count, store);
	}
	
	@Transactional
	public List<ProductCategory> findListForDeleteStore(Store store){
		return productCategoryDao.findListForDeleteStore(store);
	}
	
}