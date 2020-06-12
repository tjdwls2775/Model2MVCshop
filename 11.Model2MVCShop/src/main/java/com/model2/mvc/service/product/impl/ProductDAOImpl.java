package com.model2.mvc.service.product.impl;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.product.ProductService;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDAO;


@Repository("productDAOImpl")
public class ProductDAOImpl implements ProductDAO{
	
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public ProductDAOImpl() {
		System.out.println(this.getClass());
	}
	@Override
	public void addProduct(Product product) throws Exception {
		
		sqlSession.insert("ProductMapper.addProduct", product);
	}

	
	public Product getProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}

	
	public List<Product> getProductList(Search search) throws Exception {
		return  sqlSession.selectList("ProductMapper.getProductList", search);
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		sqlSession.update("ProductMapper.updateProduct", product);
	}
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}
	
}
	
