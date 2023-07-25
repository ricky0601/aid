<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SW계정 만들기</title>
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
							<span class="ir_wa">SW</span>
						</span>
					</h1>
				</div>
				<article id="mainContent" class="content-article">
					<div class="cont_start">
						<form action="/sw/newUser" method="post">
							<h2 class="tit_g">가입을 시작합니다!</h2>
							<div class="reg_area">
								<label for="username">사용자명</label>
      							<input type="text" id="userName" name="userName" required placeholder="사용할 이름을 입력해주세요.">
      
      							<label for="email">아이디</label>
      							<input type="email" id="userId" name="userId" required placeholder="사용할 아이디를 입력해주세요.">
      
      							<label for="password">비밀번호</label>
      							<input type="password" id="password" name="password" required placeholder="사용할 비밀번호를 입력해주세요.">
      
      							<button type="submit">가입하기</button>
							</div>
						</form>
					</div>
				</article>
			</main>
		</div>
	</div>
</body>
</html>