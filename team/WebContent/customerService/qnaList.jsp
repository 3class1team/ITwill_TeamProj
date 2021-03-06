<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<c:set var="userNo" value="${sessionScope.userNo}"/>
<c:set var="qnaList" value="${qnaList}"/>
<c:set var="qnaListCount" value="${qnaListCount}"/>
<c:set var="section" value="${qnaMap.section}"/>
<c:set var="pageNo" value="${qnaMap.pageNo}"/>
<c:set var="search" value="${qnaMap.search}"/>

<%
	request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/plyr.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    <link rel="stylesheet" href="../css/customerService.css" type="text/css">
    <link rel="stylesheet" href="../css/event.css" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Notice Section Begin -->
	<section class="blog-details spad">
	    <div class="container">
		    <div class="row d-flex justify-content-center">
	            <div class="col-lg-8">
	                <div class="blog__details__title">
	                    <h2>문의내역</h2>
	                </div>
	            </div>
	            <div class="col-lg-12">
			        <div class="blog__details__content border">
                        <div class="blog__details__form colorwhite pd-30">
	                        <div class="btn-area ar">
	                        <h4 style="float: left;">나의 문의내역</h4>
								<a href="${contextPath}/qna/addQna.do" class="btn-box board mr-top-20">문의하기</a>
							</div>
						    <table class="notice_table">
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:*">
								<col style="width:10%;">
							</colgroup>
							<thead>
							<tr>
								<th>상태</th>
								<th>구분</th>
								<th style="text-align: left;">제목</th>
								<th>등록일</th>
							</tr>
							</thead>
							<tbody>
							<c:choose>	
								<c:when test="${qnaListCount == 0 }">
									<tr>
										<td colspan="4">등록된 문의내역이 없습니다.</td>
									</tr>		
								</c:when>
								<c:otherwise>
									<c:forEach var="qna" items="${qnaList}">
									<fmt:formatDate var="qnaFormattedDate" value="${qna.qnaWriteDate }" pattern="yy-MM-dd"/>
									<tr>
										<c:choose>
											<c:when test="${qna.answerContent!=null}">
												<td>답변완료</td>
											</c:when>
											<c:otherwise>
												<td>답변대기</td>
											</c:otherwise>
										</c:choose>
										<td><span>${qna.qnaCategory}</span></td>
										<td class="table_title"><a href="${contextPath}/qna/viewQna.do?qnaNo=${qna.qnaNo}" class="table_title"><span style="color: #ffffff;">${qna.qnaTitle}</span></a></td>
										<td>${qnaFormattedDate}</td>
									</tr>
									</c:forEach>
								</c:otherwise>	
							</c:choose>
							</tbody>
							</table>
							<!-- 페이징 -->
				            <div class="row" style="justify-content: center;">
				            <c:if test="${qnaListCount != 0}">
				            	<c:choose>
				            		<c:when test="${qnaListCount > 100}">
				            			<c:forEach var="page" begin="1" end="10" step="1">
					            			<c:if test="${section > 1 && page = 1}">
					            			<div class="paging">
					            				<a href="${contextPath}/qna/myQnaList.do?section=${section-1}&pageNo=${(section-1)*10+1}">
					            				<span class="arrow_carrot-left"></span></a>
					            			</div>
					            			</c:if>
					            			<div class="paging">
					            				<a href="${contextPath}/qna/myQnaList.do?section=${section}&pageNo=${page}">${(section-1)*10}</a>
				            				</div>
				            				<c:if test="${page==10}">
				            				<div class="paging">	
				            					<a href="${contextPath}/qna/myQnaList.do?section=${section+1}&pageNo=${section*10+1}">
				            					<span class="arrow_carrot-right"></span></a>
				            				</div>
				            				</c:if>
				            			</c:forEach>
				            		</c:when>
				            		<c:when test="${qnaListCount == 100}">
				            			<c:forEach var="page" begin="1" end="10" step="1">
				            			<div class="paging">	
				            				<span><a>${page}</a></span>
				            			</div>	
				            			</c:forEach>
				            		</c:when>
				            		<c:when test="${qnaListCount < 100 }">
				            			<c:forEach var="page" begin="1" end="${qnaListCount/10+1}" step="1">
				            				<c:choose>
				            					<c:when test="${page==pageNo}">
				            					<div class="paging">
				            						<span><a class="current" href="${contextPath}/qna/myQnaList.do?section=${section}&pageNo=${page}">${page}</a></span>
				            					</div>
				            					</c:when>
				            					<c:otherwise>
				            					<div class="paging">
				            						<span><a href="${contextPath}/qna/myQnaList.do?section=${section}&pageNo=${page}">${page}</a></span>
				            					</div>	
				            					</c:otherwise>
				            				</c:choose>
				            			</c:forEach>
				            		</c:when>
				            	</c:choose>
							</c:if>
							</div>
							<!-- 페이징 끝 -->	
						</div>	
					</div>		
				</div>			
	        </div>
		</div>
    </section>
    <!-- Notice Section End -->
	
	
	<!-- footer영역 -->
	<jsp:include page="../inc/footer.jsp" />

</body>
</html>