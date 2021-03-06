<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="userNo" value="${sessionScope.userNo}"/>
<!DOCTYPE html>
    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="${contextPath}/index.jsp">
                            <img src="${contextPath}/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                            	<li ><a href="${contextPath}/index.jsp">홈</a></li>
                            	<li ><a href="${contextPath}/eventServlet/listEvent.do">이벤트</a></li>
                                <li ><a href="${contextPath}/notice/listNotice.do">고객센터</a></li>
                                <li><a href="#">카테고리 <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="${contextPath}/ctgrServlet/romance.do">로맨스</a></li>
                                        <li><a href="${contextPath}/ctgrServlet/adventure.do">액션/모험</a></li>
                                        <li><a href="${contextPath}/ctgrServlet/comedy.do">코미디</a></li>
                                        <li><a href="${contextPath}/ctgrServlet/drama.do">드라마</a></li>
                                        <li><a href="${contextPath}/ctgrServlet/thriller.do">공포/스릴러</a></li>
                                        <li><a href="${contextPath}/ctgrServlet/phantasy.do">SF/판타지</a></li>
                                        <li><a href="${contextPath}/ctgrServlet/animation.do">애니메이션</a></li>
                                        <li><a href="${contextPath}/ctgrServlet/documentary.do">다큐멘터리</a></li>
                                        <li><a href="${contextPath}/ctgrServlet/crime.do">범죄</a></li>
                                    </ul>
                                </li>
                                <c:choose>
			                       	<c:when test="${sessionScope.userID!=null}">	
		                                <li><a href="#">마이페이지 <span class="arrow_carrot-down"></span></a>
		                                    <ul class="dropdown">
		                                        <li><a href="${contextPath}/ordersvlt/myOrderList.do">나의 구매내역</a></li>
		                                        <li><a href="${contextPath}/wishsvlt/myWishList.do">나의 찜 목록</a></li>
		                                        <li><a href="${contextPath}/me/info.do?userID=${userID}">회원정보수정</a></li>
		                                        <li><a href="${contextPath}/me/withdrawal.do?userID=${userID}">회원탈퇴</a></li>
		                                        <li><a href="${contextPath}/qna/myQnaList.do">문의내역</a></li>
		                                    </ul>
		                                </li>
	                                </c:when>
                                </c:choose>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <a href="#" class="search-switch"><span class="icon_search"></span></a>
                       <!-- 위시리스트 아이콘 입니다 -->
                       <!--  <a href="#" ><span class="icon_star"></span></a> -->
	                      <c:choose>
		                       <c:when test="${sessionScope.userID!=null}">		
                     		    <a href="${contextPath}/ordersvlt/cart.do" ><span class="icon_cart"></span></a>
		                        <a href="${contextPath}/user/logout.do" ><span class="icon_lock-open"></span></a>
	                        	<c:if test='${userID=="admin"}'>
	                       			<a href="${contextPath}/adminPage/dashBoard.do" ><span class="icon_datareport"></span></a>
								</c:if>
	                       		<a href="#"><span class="icon_profile"></span></a>
	                       		<p style="color: white;">${sessionScope.userID}님 로그인중</p>
		                       	
		                       </c:when>
		                       <c:otherwise>
		                       		<a href="${contextPath}/login/login.jsp"><span class="icon_profile"></span></a>
		                       </c:otherwise>
	                       </c:choose>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->
    