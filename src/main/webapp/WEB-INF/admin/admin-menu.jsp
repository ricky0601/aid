<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SW 선물하기</title>
	<link rel="stylesheet" href="../../web/css/main.css">
	<style>
	    .button-container {
          margin-top: 20px;
        }

        button {
          display: inline-block;
          padding: 10px 20px;
          background-color: #E0FFFF;
          font-size: 16px;
          border: none;
          cursor: pointer;
          margin-right: 10px;
        }

        button:hover {
          background-color: #ADD8E6;
        }
	</style>
</head>
<body>
<div class="wrap_home">
    <header id="pcSWHead">
        <div class="pc_swhead">
            <h1 class="gift_bi">
                <a href="/" class="link_home">SW 선물하기</a>
            </h1>
            <div id="pcSWGnb" role="navigation" class="gift_gnb">
                <h2 class="screen_out">선물하기 메인 메뉴</h2>
                <ul class="list_gnb">
                    <li class="on">
                        <a class="link_item" href="/">
                            <span class="txt_item">
                                <span class="txt_g"> 홈 </span>
                            </span>
                        </a>
                    </li>
                    <li>
                        <c:choose>
                            <c:when test="${sessionScope.sMemberId ne null and sessionScope.sMemberId eq 'admin'}">
                                <!-- admin 계정이 로그인한 경우 -->
                                <a class="link_item" href="/admin-menu">
                                    <span class="txt_item">
                                        <span class="txt_g"> 관리자 메뉴 </span>
                                    </span>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <!-- admin 계정이 아닌 경우 -->
                                <a href="/boardList" class="link_item">
                                    <span class="txt_item">
                                        <span class="txt_g"> 상품 후기 </span>
                                    </span>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
            </div>
            <div class="gift_utils">
                <div id="pcSWAccount" class="box_login">
                    <h2 class="screen_out">로그인 정보</h2>
                        <c:choose>
                            <c:when test="${sessionScope.sMemberId ne null}">
                                <a href="/logout" class="link_login">로그아웃</a>
                            </c:when>
                            <c:otherwise>
                                <a href="/login" class="link_login">로그인</a>
                            </c:otherwise>
                        </c:choose>
                </div>
            </div>
        </div>
    </header>
    
    <main id="swContent">
		<h2 class="screen_out">선물하기 본문</h2>
		<article id="mArticle">
			<div class="area_g area_home_theme">
				<h3 class="screen_out">선물 테마 검색</h3>
				<div class="wrap_home_theme">
					<div class="inner_home_theme">
						<div class="button-container">
                            <button onclick="goToProductManagement()">상품 관리</button>
                            <button onclick="goToMemberManagement()">회원 관리</button>
                            <button onclick="goToBoardManagement()">게시판 관리</button>
                        </div>
					</div>
				</div>
			</div>
		</article>
    </main>
    <footer id="pcSWFoot">
		<h2 class="screen_out">선물하기 서비스 정보</h2>
		<div class="pc_kfoot">
			<span class="gift_bi">
				SW 선물하기
			</span>
			<div class="gift_info">
				<h3 class="screen_out">사업자 정보</h3>
				<dl class="list_info">
					<dt class="screen_out">회사명 :&nbsp;</dt>
					<dd>(주)카카오</dd>
					<dt>대표이사 :&nbsp;</dt>
					<dd>홍은택</dd>
					<dt>주소 :&nbsp;</dt>
					<dd>제주특별자치도 제주시 첨단로 242</dd>
				</dl>
				<dl class="list_info">
					<dt>사업자등록번호 :&nbsp;</dt>
					<dd>120-81-47521</dd>
					<dt>통신판매업신고번호 :&nbsp;</dt>
					<dd>제2015 - 제주아라 - 0032호</dd>
					<dt>호스팅 사업자 :&nbsp;</dt>
					<dd>(주)카카오</dd>
				</dl>
				<dl class="list_info">
					<dt>구매안전서비스 :&nbsp;</dt>
					<dd><gc-link subwebview="신한은행구매안전서비스" data-tiara-layer="guarantee" cutiara="" _nghost-mjr-c20=""><!----><!----><!----><a _ngcontent-mjr-c20="" href="#none" class="link_foot">가입사실확인<!----></a><!----><!----><!----><!----><!----></gc-link></dd><dt>이메일 :&nbsp;</dt><dd><a target="_blank" class="link_email" href="mailto:cs.gift@kakaocorp.com">cs.gift@kakaocorp.com</a></dd><dt>고객센터 :&nbsp;</dt><dd>1544-2431 (통화료 발생 / 평일 09:00~18:00)&nbsp;&nbsp;톡상담하기 (평일 09:00~18:00)</dd>
				</dl>
				<small class="copyright_info">
					<a href="https://www.kakaocorp.com/" target="_blank" class="link_kakao">© kakao Corp.</a>
					 All rights reserved
				</small>
				<small class="desc_foot">(주)카카오에서 판매하는 상품 중에는 개별 판매자가 판매하는 상품이 포함되어 있습니다.<br>개별 판매자가 판매하는 상품에 대해 (주)카카오는 통신중개 판매업자로서 통신판매의 당사자가 아니며 상품의 주문, 배송 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.</small>
				<span class="mark_info"><img cuimg="" thumbnail="C138x40" width="138" height="40" src="https://img1.kakaocdn.net/thumb/C138x40@2x.fwebp.q82/?fname=https%3A%2F%2Fgift-s.kakaocdn.net%2Fdn%2Fgift%2Fimages%2Fm640%2Fimg_pcfamily.png" alt="가족 친화 우수기업" class="img_familymark"><img cuimg="" alt="위해상품차단시스템 운영매장" width="111" height="31" src="https://gift-s.kakaocdn.net/dn/gift/images/m640/img_systemmark_pc_230307.png" class="img_systemmark"></span>
			</div>
		</div>
    </footer>
</div>
</body>
</html>