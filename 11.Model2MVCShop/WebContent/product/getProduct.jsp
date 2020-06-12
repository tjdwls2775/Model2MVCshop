<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%@ page import="com.model2.mvc.service.product.vo.*" %>
--%>
<%--
ProductVO vo = (ProductVO)request.getAttribute("productVO");
System.out.println("123"+vo);
--%>
<c:choose>
<c:when test = "${param.menu != '' and param.menu == 'manage'}" > 
<%-- 
<%if(request.getParameter("menu") != null){
if(request.getParameter("menu").equals("manage")){%>
--%>
<html>
<head>
<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	</script>
	</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />
				
				<div class="container">
				<div class="page-header">
				
					<h3 class=" text-info">상품상세조회</h3>
			</div>		
				
			<div class="row">
			<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
			
			</div>
		
			<hr/>
			
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4"><img src = "../images/uploadFiles/${product.fileName}"/></div>
		</div>

		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		<hr/>
	
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
		<hr/>
		
			<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">구매</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
		</body>
		<html>

</c:when>

<%-- 
<%}}else {%>
--%>
<c:otherwise>
<html>
<head>
<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	 
	 var prodNo = ${product.prodNo};
	 
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button" ).on("click" , function() {
					self.location = "/product/updateProduct?prodNo=${product.prodNo}"
				});
			
	
			
			
		});
	 
		
	 $(window).scroll(function() {
	     if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	    
	    	 loadNext();
	    	 
	       
	     }
	 });

	 


	 function loadNext(){
		 prodNo++;
    	 
		 			
		  $.ajax(
				  {

			    url : "/product/json/getProduct/"+prodNo ,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				
		    success: function(JSONData , status){
		    	
		    	var displayValue = 
		    		"<div class='row'>"+
		    	  "<div class='col-sm-6 col-md-4'>"+
		    	    "<div class='thumbnail'>"+
		    	    "<img src=\"../images/uploadFiles/"+JSONData.fileName+"\" width=\"200\"/>"+
		    	      "<div class='caption'>"+
		    	        "<h3>"+"<a href='/product/getProduct?prodNo="+JSONData.prodNo+"'>"+JSONData.prodName+"</a>"+"</h3>"+
		    	        "<p>"+JSONData.prodNo+"</p>"+
		    	      "</div>"+
		    	    "</div>"+
		    	  "</div>"+
		    	  
		    	  
		    	  "<div class='col-sm-6 col-md-4'>"+
		    	    "<div class='thumbnail'>"+
		    	    "<img src=\"../images/uploadFiles/"+JSONData.fileName+"\" width=\"200\"/>"+
		    	      "<div class='caption'>"+
		    	        "<h3>"+"<a href='/product/getProduct?prodNo="+JSONData.prodNo+"'>"+JSONData.prodName+"</a>"+"</h3>"+
		    	        "<p>"+JSONData.prodNo+"</p>"+
		    	      "</div>"+
		    	    "</div>"+
		    	  "</div>"+
		    	  
		    	  
		    	  "<div class='col-sm-6 col-md-4'>"+
		    	    "<div class='thumbnail'>"+
		    	    "<img src=\"../images/uploadFiles/"+JSONData.fileName+"\" width=\"200\"/>"+
		    	      "<div class='caption'>"+
		    	        "<h3>"+"<a href='/product/getProduct?prodNo="+JSONData.prodNo+"'>"+JSONData.prodName+"</a>"+"</h3>"+
		    	        "<p>"+JSONData.prodNo+"</p>"+
		    	      "</div>"+
		    	    "</div>"+
		    	  "</div>"+
		    	  
		    	"</div>"
		    	
		    	
		    	
		 
		    		
		    		 		
		    		
		    		
					
		      $('.szszsz').append(displayValue);
		      
		    }
				
		  });
		  
		}



		
		
		



		
	</script>
	</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />
				
				<div class="container">
				<div class="page-header">
				
					<h3 class=" text-info">상품상세조회</h3>
			</div>		
	
			<div class="row">
			<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
			
			</div>
		
			<hr/>
			
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4"><img src = "../images/uploadFiles/${product.fileName}"/></div>
		</div>

		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		<hr/>
	
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
		<hr/>
		
			<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">상품수정</button>
	  		</div>
		</div>
		
		<br/>
		<div class="szszsz" id="szszsz" name="szszsz">
 	무한스크롤시작~~~~~~~~~~~~~~~~~~~~~~~<p>
 	무한스크롤시작~~~~~~~~~~~~~~~~~~~~~~~<p>
 	무한스크롤시작~~~~~~~~~~~~~~~~~~~~~~~<p>
 	
 	</div>
 	</div>
 	
 	
		</body>
		<html>
</c:otherwise>
</c:choose>
<%-- 
    <%} %>
    --%>