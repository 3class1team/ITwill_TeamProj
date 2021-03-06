<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="userID" value="${sessionScope.userID}"/>
<c:set var="list" value="${requestScope.list}"/>

<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원정보수정</title>
    
   	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 

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
    <link rel="stylesheet" href="../css/signup.css" type="text/css">
   
    <script type="text/javascript">
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    function idCheck(){
		var userID = document.userForm.userID.value;
		if(userID==""){
			alert("아이디를 입력하세요.");
			document.userForm.userID.focus();
			return
		}
		window.open("${contextPath}/user/idCheck.do?userID="+userID, "" , "width=500,height=200")
	}
    
    function nickCheck(){
		var userNickname = document.userForm.userNickname.value;
		if(userNickname==""){
			alert("닉네임을 입력하세요.");
			document.userForm.userNickname.focus();
			return
		}
		window.open("${contextPath}/user/nickCheck.do?userNickname="+userNickname, "" , "width=500,height=200")
	}
    
    function telCheck(){
		var userTel = document.userForm.userTel.value;
		if(userTel==""){
			alert("전화번호를 입력하세요.");
			document.userForm.userTel.focus();
			return
		}
		window.open("${contextPath}/user/telCheck.do?userTel="+userTel, "" , "width=500,height=200")
	}
    
    function mailCheck(){
		var userEmail = document.userForm.userEmail.value;
		if(userEmail==""){
			alert("이메일을 입력하세요.");
			document.userForm.userEmail.focus();
			return
		}
		window.open("${contextPath}/user/mailCheck.do?userEmail="+userEmail, "" , "width=500,height=200")
	}
    
	function resetCheck1() {
		document.userForm.idCheckState.value = 0;
	}
	
	function resetCheck2() {
		document.userForm.nicknameCheckState.value = 0;
	}
	
	function resetCheck3() {
		document.userForm.telCheckState.value = 0;
	}
	function resetCheck4() {
		document.userForm.emailCheckState.value = 0;
	}
	
	function check(){
		/* if (document.userForm.idCheckState.value != 1) {
			confirm("아이디 중복체크를 해주세요.");
			return false;
		} 
		if (document.userForm.nicknameCheckState.value != 1) {
			confirm("닉네임 중복체크를 해주세요.");
			return false;
		}
		if (document.userForm.telCheckState.value != 1) {
			confirm("전화번호 중복체크를 해주세요.");
			return false;
		}
		if (document.userForm.emailCheckState.value != 1) {
			confirm("이메일 중복체크를 해주세요.");
			return false;
		}*/
		if (document.userForm.userPW.value == "") {
            alert("비밀번호를 입력하지 않았습니다.")
            document.userForm.userPW.focus();
            return false;
        }
        if (userForm.userPW.value == userForm.userID.value) {
            alert("아이디와 비밀번호가 같습니다.")
            document.userForm.userPw.focus();
            return false;
        }
        if (document.userForm.userPW.value != document.userForm.userPW2.value) {
            alert("비밀번호가 일치하지 않습니다")
            document.userForm.userPW2.value = ""
            document.userForm.userPW2.focus();
            return false;
        }
	}
    
    </script>
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

   	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="../img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>회원정보수정</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Signup Section Begin -->
    <section class="signup spad">
        <div class="container">
            <div >
                    <div class="join__form">
                    	<div  style="margin-left: 160px;">
                    		<h3 >회원정보수정</h3>
                    	</div>
                        <form action="${contextPath}/me/modUser.do?userID=${userID}" method="post"  name="userForm" onsubmit="return check();">
                        	<input type="hidden" name="idCheckState" value="0" />
                        	<input type="hidden" name="nicknameCheckState" value="0" />
                        	<input type="hidden" name="telCheckState" value="0" />
                        	<input type="hidden" name="emailCheckState" value="0" />
                            <div class="input__item1" style="margin-left: 50px; display: flex">
                                <input type="text" value="${list.userID}" placeholder="아이디" name="userID" id="userID" onkeyup="resetCheck1()" required="required" disabled="disabled">
                                <span class="icon_profile"></span>
                                <button type="button"  class="site-btn-join" onclick="idCheck()" > 중복확인</button>
                            </div>
                            <div class="input__item" style="margin-left: 50px;">
                                <input type="password" value="${list.userPW}" placeholder="비밀번호" name="userPW" id="userPW" required="required">
                                <span class="icon_lock"></span>
                            </div>
                            <div class="input__item" style="margin-left: 50px;">
                                <input type="password" placeholder="비밀번호 확인" name="userPW2" id="userPW2" required="required">
                                <span class="icon_lock"></span>
                            </div>
                            <div class="input__item" style="margin-left: 50px;">
                                <input type="text" value="${list.userName}" placeholder="사용자 이름" name="userName" >
                                <span class="icon_profile"></span>
                            </div>
							<div class="input__item1" style="margin-left: 50px;  display: flex">
                                <input type="text" value="${list.userNickname}" placeholder="닉네임" name="userNickname" onkeyup="resetCheck2()" required="required">
                                <span class="icon_profile"></span>
                                <button type="button" class="site-btn-join" onclick="nickCheck()" > 중복확인</button>
                            </div>
							<div class="input__item1" style="margin-left: 50px; display: flex">
                                <input type="text" value="${list.userTel}" placeholder="전화번호" name=userTel onkeyup="resetCheck3()" required="required">
                                <span class="icon_phone"></span>
                                <button type="button"  class="site-btn-join" onclick="telCheck()" > 중복확인</button>
                            </div>
                            <div class="input__item1" style="margin-left: 50px; display: flex">
                                <input type="email" value="${list.userEmail}" placeholder="이메일 주소 " name="userEmail" onkeyup="resetCheck4()" required="required">
                                <span class="icon_mail"></span>
                                <button type="button"  class="site-btn-join" onclick="mailCheck()" > 중복확인</button>
                            </div>
                            
                            <div class="input__item1" style="margin-left: 50px; display: flex">
                            	<input type="text" value="${list.userAddr1}" id="sample4_postcode"   placeholder="우편번호" name="userAddr1" readonly="readonly">
                            	<span class="icon_pencil"></span>
                            	<button type="button" onclick="sample4_execDaumPostcode()" class="site-btn-join">주소찾기</button>
                            	<!-- <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> -->
                            </div>
        
                            <div class="input__item" style="margin-left: 50px;">
                            	<input type="text" value="${list.userAddr2}" id="sample4_roadAddress"  placeholder="도로명주소" name="userAddr2" readonly="readonly">
                            	<span class="icon_pencil"></span>
                            </div>
                            <div class="input__item" style="margin-left: 50px;">
                            	<input type="text" value="${list.userAddr3}" id="sample4_jibunAddress"  placeholder="지번주소" name="userAddr3" readonly="readonly">
                            	<span class="icon_pencil"></span>
                            </div>
                            <div class="input__item" style="margin-left: 50px;">
								<span id="guide" value="${list.userAddr4}" style="color:#999;display:none"></span>
								<input type="text" id="sample4_extraAddress" placeholder="상세주소" name="userAddr4">
								<span class="icon_pencil"></span>
                            </div>
				  	     	<div style="margin-left: 140px;">
                            	<button type="submit" class="site-btn" >수정하기</button>	
                           	</div>
                        </form>
                    </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->

    <jsp:include page="../inc/footer.jsp" />

</body>

</html>