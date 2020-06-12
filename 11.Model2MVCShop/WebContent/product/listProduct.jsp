<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.service.product.vo.*" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@ page import="com.model2.mvc.common.*" %>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
List<ProductVO> list= (List<ProductVO>)request.getAttribute("list");
Page resultPage=(Page)request.getAttribute("resultPage");

Search search = (Search)request.getAttribute("search");
//==> null �� ""(nullString)���� ����
String searchCondition = CommonUtil.null2str(search.getSearchCondition());
String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	
%>
--%>
<%-- 
<%if(request.getParameter("menu").equals("manage")){%>
--%>

<c:if test ="${param.menu=='manage' }">

<html>
<head>

<title>��ǰ ����</title>
<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>

<script type="text/javascript">

function fncGetUserList(currentPage) {
	$("#currentPage").val(currentPage)
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
}

$(function() {
	 
	 $( "button.btn.btn-default" ).on("click" , function() {
		fncGetUserList(1);
	});
});
	

	

</script>
</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />


<form name="detailForm" action="/product/listProduct?menu=manage" method="post">
<input type="hidden" name="menu" value="${param.menu }">
<div class="container">
<div class="page-header text-info">
							<h3>��ǰ ����</h3>				
	
</div>
<div class="row">

		<div class="col-md-6 text-left">
		    	<p class="text-primary">
	��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		
		<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
				
			</select>
			</div>
		 <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
			<input type="text"  class="form-control" id="searchKeyword" name="searchKeyword" placeholder="�˻���"
						value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
			</div>
		
	
		
		<button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>


<table class="table table-hover table-striped" >

	<thead>
	<tr>
		<td class="ct_list_b">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	</thead>
		
	<tbody>
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
	<c:set var="i" value="${i+1 }"/>
	<tr class="ct_list_pop">
	<td align="center">${ i }</td>
			<td></td>
			<td align="left"><a href="/product/updateProduct?prodNo=${product.prodNo}">${product.prodName}</a></td>
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}</td>
			<td></td>
			<td align="left">�Ǹ��� 
			</td>		
					
	</tr>
		
	</c:forEach>
		</tbody>	
</table>

		</div>	
		<jsp:include page="../common/pageNavigator_new.jsp"/>
    

<!--  ������ Navigator �� -->
</body>
</html>
</c:if>
<%-- 
<%}else{%>
--%>

<c:if test ="${param.menu=='search' }">

<html>
<head>
<title>��ǰ �����ȸ</title>
<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        
        p{
        	display: none;
        }
    </style>
<script type="text/javascript">



function fncGetUserList(currentPage) {
	$("#currentPage").val(currentPage)
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
}

$(function() {
	 
	 $( "button.btn.btn-default" ).on("click" , function() {
		fncGetUserList(1);
	});
});
		
$(function() {
$(".ct_list_pop td:nth-child(3)" ).on("click" , function() {
	self.location ="/product/getProduct?prodNo="+$(this).text().trim();
});
});

	$(function() {
		
		
	
	$(".ct_list_pop td:nth-child(11)").on("click" , function() {
	
	var prodNo = $(this).text().trim();
	
	$.ajax( 
			{
				url : "/product/json/getProduct/"+prodNo ,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
					
					
					var displayValue = "<h6>"
												+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
												+"��ǰ��  : "+JSONData.prodName+"<br/>"
												+"��ǰ���� : "+JSONData.prodDetail+"<br/>"
												+"��ǰ���� : "+JSONData.price+"<br/>"
												+"��ǰ�̹��� : "+"<img src=\"../images/uploadFiles/"+JSONData.fileName+"\" width=\"200\"/>"+"<br/>"
												+"</h6>";
											
					$("h6").remove();
					$( "#"+prodNo+"" ).html(displayValue);
				}
		});
		////////////////////////////////////////////////////////////////////////////////////////////
	
	});
	$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
	
	
	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		
	
	
	});	
	
	
	
</script>
</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />


<form name="detailForm" action="/product/listProduct?menu=search" method="post">
<input type="hidden" name="menu" value="${param.menu }">
<div class="container">
<div class="page-header text-info">
							<h3>��ǰ �����ȸ</h3>
					
			</div>
		


<div class="row">

<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
	
		
		<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			     <div class="form-group">
			<select class="form-control" name="searchCondition" >
			
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
			</select>
			</div>
			<%--<input type="text" name="searchKeyword"  value="<%= searchKeyword %>"--%>
			<div class="form-group">
			<label class="sr-only" for="searchKeyword">�˻���</label>
			<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���" 
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}">
			
			</div>
	<button type="button" class="btn btn-default">�˻�</button>
		
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
</form>
</div>
</div>


<table class="table table-hover table-striped" >
	
		<thead>
	<tr>
		<td class="ct_list_b">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ǰ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>	
	</tr>
	</thead>
	
	
	<tbody>
		
	
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
	<c:set var="i" value="${i+1 }"/>
	<tr class="ct_list_pop">
	<td align="center">${ i }</td>
			<td></td>
			<td align="left">${product.prodNo}</td>
			<td></td>
			<td align="left">${product.prodName}</td>
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}</td>
			<td></td>
			<td align="left">
			<i class="glyphicon glyphicon-ok" id= "${product.prodNo}"></i>
			  	<input type="hidden" value="${product.prodNo}">
			  	<p>${product.prodNo }</p>
			  </td>
	</tr>
	</c:forEach>
	</tbody>
	
	
	
	
	
	
</table>

	</div>
		
		<jsp:include page="../common/pageNavigator_new.jsp"/>
    	


</c:if>

	</body>
</html>


