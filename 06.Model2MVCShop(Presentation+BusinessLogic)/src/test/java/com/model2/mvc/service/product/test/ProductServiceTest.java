package com.model2.mvc.service.product.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.service.domain.Product;

import com.model2.mvc.service.product.ProductService;

import com.model2.mvc.common.Search;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })
public class ProductServiceTest {
	
	

		//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
		@Autowired
		@Qualifier("productServiceImpl")
		private ProductService productService;

		//@Test
		public void testAddProduct() throws Exception {
			
			
			Product product = new Product();
			
			product.setProdNo(10045);
			product.setProdName("tes5t02");
			product.setProdDetail("test421");
			product.setManuDate("12354");
			product.setPrice(500);
			product.setFileName("jpg133242");
		
			
			productService.addProduct(product);
			
			product = productService.getProduct(10045);

		
			System.out.println("first"+product);
			
			//==> API 확인
			Assert.assertEquals(10045, product.getProdNo());
			Assert.assertEquals("test02", product.getProdName());
			Assert.assertEquals("test1", product.getProdDetail());
			Assert.assertEquals("12", product.getManuDate());
			Assert.assertEquals(500, product.getPrice());
			Assert.assertEquals("jpg", product.getFileName());
			
		}
		@Test
		public void testGetProduct() throws Exception {
			
			Product product = new Product();
			
			
			product = productService.getProduct(10043);

			//==> console 확인
			System.out.println(product);
			
			//==> API 확인
			/*
			Assert.assertEquals("10043", product.getProdNo());
			Assert.assertEquals("1235555345", product.getProdName());
			Assert.assertEquals("4", product.getProdDetail());
			Assert.assertEquals("123444", product.getManuDate());
			Assert.assertEquals("2020-05-16", product.getPrice());
			Assert.assertEquals("12", product.getFileName());

			*/
		}
		//@Test
		 public void testUpdateProduct() throws Exception{
			 
			 Product product = productService.getProduct(10045);
			Assert.assertNotNull(product);
			
	/*		Assert.assertEquals("testUserName", product.getUserName());
			Assert.assertEquals("111-2222-3333", product.getPhone());
			Assert.assertEquals("경기도", product.getAddr());
			Assert.assertEquals("test@test.com", product.getEmail());
*/
			product.setProdName("change");
			product.setProdDetail("cc");
			product.setManuDate("12354");
			product.setPrice(500);
			product.setFileName("jpg133242");
			
			productService.updateProduct(product);
			System.out.println("update : "+product);
			
			product = productService.getProduct(10045);
			Assert.assertNotNull(product);
			
			
			System.out.println("update : "+product);
				
			//==> API 확인
	/*		Assert.assertEquals("change", product.getUserName());
			Assert.assertEquals("777-7777-7777", product.getPhone());
			Assert.assertEquals("change", product.getAddr());
			Assert.assertEquals("change@change.com", product.getEmail());
			*/
		 }
		//@Test
		 public void testGetProductListAll() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	Map<String,Object> map = productService.getProductList(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	Assert.assertEquals(3, list.size());
		 	
			
		 	System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("0");
		 	search.setSearchKeyword("");
		 	map = productService.getProductList(search);
		 	
		 	list = (List<Object>)map.get("list");
		 	Assert.assertEquals(3, list.size());
		 	
		 	//==> console 확인
		 	//System.out.println(list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 }
		 //@Test
		 public void testGetProductListByProdNo() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("0");
		 	search.setSearchKeyword("10028");
		 	Map<String,Object> map = productService.getProductList(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
			
		 	System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 	search.setSearchCondition("0");
		 	search.setSearchKeyword(""+System.currentTimeMillis());
		 	map = productService.getProductList(search);
		 	
		 	list = (List<Object>)map.get("list");
		 	Assert.assertEquals(0, list.size());
		 	
		
		 	System.out.println(list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 }
		 //@Test
		 public void testGetProductListByProdName() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("1");
		 	search.setSearchKeyword("asd123");
		 	Map<String,Object> map = productService.getProductList(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
			
		 	System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 	search.setSearchCondition("1");
		 	search.setSearchKeyword(""+System.currentTimeMillis());
		 	map = productService.getProductList(search);
		 	
		 	list = (List<Object>)map.get("list");
		 	Assert.assertEquals(0, list.size());
		 	
		
		 	System.out.println(list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
}
		 //@Test
		 public void testGetProductListByPrice() throws Exception{
			 System.out.println(":::::============producyList start");
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("2");
		 	search.setSearchKeyword("500");
		 	Map<String,Object> map = productService.getProductList(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
			
		    System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 	search.setSearchCondition("2");
		 	search.setSearchKeyword(""+System.currentTimeMillis());
		 	map = productService.getProductList(search);
		 	
		 	list = (List<Object>)map.get("list");
		 	Assert.assertEquals(0, list.size());
		 	
		
		 	System.out.println(list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
}		 
}
			

