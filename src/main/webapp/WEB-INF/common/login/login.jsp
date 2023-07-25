<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SW 계정</title>
	<link rel="stylesheet" href="../../web/css/main.css">
	<link rel="stylesheet" href="../../web/css/login.css">
</head>
<body>
	<div class="container_doc">
		<div class="inner_container">
			<main class="doc-main">
				<div class="doc-title">
					<h1 class="tit_service">
						<span class="logo_sw">
							<a href="/">
								<span class="ir_wa">SW</span>
							</a>
							
						</span>
					</h1>
				</div>
				<article id="mainContent" class="content-article">
					<div class="cont_login">
						<div class="login_sw">
							<form method="post" id="login_form">
								<div class="box_tf fst">
									<label class="screen_out" for="id">계정정보 입력</label>
									<input type="text" id="id" name="id" placeholder="SW 아이디 " class="tf_g">
									<div class="util_tf"></div>
								</div>
								<div class="box_tf">
									<label class="screen_out" for="password">비밀번호 입력</label>
									<input type="password" id="password" name="password" placeholder="비밀번호" autocomplete="off" class="tf_g" >
									<div class="util_tf"></div>
								</div>
								<div class="confirm_btn">
									<button type="submit" class="btn_g highlight submit">로그인</button>
								</div>
							</form>
							<div class="info_user">
								<a href="/sw/newUser" class="link_join">회원가입</a>
							</div>
						</div>
					</div>
				</article>
			</main>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	<%-- 로그인 버튼 클릭 --%>
	$('.btn_g').on('click', function(){
		<%-- form validation --%>
		if ($.trim($('#id').val()) == '') {
			alert('아이디를 입력해주세요.');
			$('#id').siblings('div.alarm').show();
			return false;
		} else {
			$('#id').siblings('div.alarm').hide();
		}
		if ($.trim($('#password').val()) == '') {
			alert('비밀번호를 입력해주세요.');
			$('#password').siblings('div.alarm').show();
			return false;
		} else {
			$('#password').siblings('div.alarm').hide();
		}
		<%-- ajax 호출 --%>
		$.ajax({
			url: '/login',
			type: 'POST',
			data: $('#login_form').serialize(),
			success: function(data){
				var result_cd = data.result_cd;
				if(result_cd == '00'){
					//메인 페이지로 이동
					location.href = '/';
				}else{
					var result_msg = data.result_msg;
					alert(result_msg);
				}
			},
			error: function(error){
				console.log(error);
			}
		});
	});
});
</script>
</body>
</html>