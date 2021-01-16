<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
 	
 	<!-- InquireForm Section Begin -->
    <section class="blog-details spad">
	    <div class="container">
		    <div class="row d-flex justify-content-center">
	            <div class="col-lg-8">
	                <div class="blog__details__title">
	                    <h2>고객센터</h2>
	                </div>
	            </div>
			    <div class="col-lg-12">
			        <div class="blog__details__content">
			     		<ul class="blog__details__btns">
	                        <li class="blog__details__btns__item">
	                            <h5><a href="notice.jsp">공지사항</a></h5>
	                        </li>
	                        <li class="blog__details__btns__item">
	                            <h5><a href="faq.jsp">자주 묻는 질문</a></h5>
	                        </li>
	                        <li class="blog__details__btns__item">
	                            <h5><a href="inquireForm.jsp">문의하기</a></h5>
	                        </li>
                        </ul>
                        <div class="blog__details__form">
	                        <h4>고객 문의</h4>
	                        <form action="#">
	                            <div style="margin-top: 45px;">
	                                <div class="col-lg-12">
	                                	<span style="color: #ffffff;">이름</span>
	                                	<input type="text" placeholder="Name">
	                                </div>
	                                <div class="col-lg-12">
	                                	<span style="color: #ffffff;">문의 제목</span>
										<input type="text" placeholder="제목을 입력해주세요">
	                                </div>
	                                <div class="col-lg-12">
	                                	<span style="color: #ffffff;">문의 내용</span>
	                                    <textarea placeholder="문의 내용을 입력해주세요"></textarea>
	                                    <button type="submit" class="site-btn">확인</button>
	                                    <button type="reset" class="site-btn">취소</button>
	                                </div>
	                            </div>
	                        </form>
	                    </div>           

		                <div class="noticeForm">
	                        <h4>고객 문의</h4>
						    <form action="${contextPath}/noticeServlet/addNotice.do" method="post" class="writeForm">
								<table class="table">
									<colgroup>
										<col width="20%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th>제목</th>
											<td>
												<input type="text" name="eventTitle" placeholder="제목을 입력해 주세요." class="widhun">
											</td>
										</tr>
										<tr>
											<th>종류</th>
											<td>
												<select class="nice-select">
													<option>선택하세요</option>
													<option>공지</option>
													<option>안내</option>
													<option>이벤트</option>
													<option>점검</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>내용</th>
											<td>
												<textarea cols="40" rows="15" name="eventContent" placeholder="내용을 입력해 주세요." class="widhun"></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="button">
									<button type="button" class="site-btn cancel" onclick="history.back();">취소</button>
									<button type="submit" class="site-btn submit">등록</button>
								</div>
							</form>
						</div>   
	               	</div>	
	            </div>
	        </div>
		</div>
    </section>
    <!-- InquireForm Section End -->
	
	
	<!-- footer영역 -->
	<jsp:include page="../inc/footer.jsp" />

</body>
</html>