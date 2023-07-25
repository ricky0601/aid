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
	<link rel="stylesheet" href="../../web/css/detail.css">
</head>
<body>
<%
    String userId = (String) session.getAttribute("sMemberId");
%>
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
                        <a class="link_item" href="#">
                            <span class="txt_item">
                                <span class="txt_g"> 브랜드 </span>
                            </span>
                        </a>
                    </li>
                    <li>
                        <a class="link_item" href="/board/list">
                            <span class="txt_item">
                                <span class="txt_g"> 상품 후기 </span>
                            </span>
                        </a>
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
			<main id="gmContent">
                <form id="frm">
                <input id="txt_total" type="hidden" value="${product.pPrice}">
               	  <article id="gmArticle">
                	  <div class="cont_detail_info">
                	    <div class="detail_view">
                	      <div class="view_product">
                	        <div class="wrap_thumb_product">
                           	  <div class="thumb_product">
                           	  <img src="/img/${product.pPicture}" width="450" height="450"> </div>
                            </div>
                          	<div class="wrap_basic_info">
                           	  <div class="basic_info">
                           	    <div class="product_subject">
                                	<h2 class="tit_subject">
                                    	${product.pName}
                                    </h2>
                                    <div class="wrap_score">

                                    </div>
                                </div>
                           	    <div class="info_product">
                                	<span role="text" class="txt_total">
                                    	<%-- JSTL을 사용하여 숫자를 00,000 형식으로 변환 --%>
                                            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                                            <fmt:formatNumber value="${product.pPrice}" pattern="###,### 원" />
                                    </span>
                                </div>
                              </div>
                            </div>
                          </div>

                        </div>
                      	<div class="product_info">
                        	<ul role="tablist" class="list_tab">
                            	<li>
                                	<a  role="tab" class="link_tab" href="#none" aria-selected="true">
                                    	<span class="txt_tab">
                                        	상품설명
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a  role="tab" class="link_tab" href="#none" aria-selected="false">
                                        <span class="txt_tab">
                                            상품후기
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        	<div class="detail_info">
                       	    <img src="/img/${product.pDetail}" width="810" height="auto"> </div>

                        </div>

                    </div>
                   	<div tabindex="0" class="item_option" style>
                   	  <div class="wrap_option_layer">
                   	    <div class="option_layer board_on">
                   	      <div class="board_option">
                   	      	<div class="option_name_underbar">
                            	<p><span></span></p>
                            </div>
                          <div class="list_option">
            				<p>

            				  <br>
            				  </p>
                          </div>
                   	        <div class="wrap_basket">
                   	          <div class="scroll_basket">
                              	<div class="info_basket">
                              	  <div class="tit_item">
                                  	${product.pName}
                                  </div>
                               	  <div class="cont_item">
                                  	<div class="opt_amount">
                                    	<button class="btn_minus" type="button" onclick="minus()">
                                       	<img src="/img/211863_minus_round_icon.png" width="15" height="15"></button>
                                        <input type="tel" class="inp_count" id="inp_count" onchange="amount()" value="1">
                                        <button class="btn_plus" type="button" onclick="plus()">
                                       	<img src="/img/134224_add_plus_new_icon.png" width="16" height="15" ></button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                   	  <div class="wrap_buyresult">
                   	    <div class="wrap_total">
                       	  <div class="group_total">
                          	<strong class="tit_price">
                            	총금액
                            </strong>
                            <span class="txt_price" id="total_price">
                            	${product.pPrice} 원
                            </span>
                          </div>
                        </div>
                        <div class="gftbtn">
                       	  <div class="box_btn">
                          	<div class="item_btn item_dark">
                          	    <a href="/product/bill">
                            	    <button type="submit" class="btn_g">
                                	    구매하기
                                    </button>
                          	    </a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                	</article>
                	</form>
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
<!-- JQuery 3.X CDN 링크 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

    // 수량 감소 버튼 클릭 이벤트
    $('.btn_minus').on('click', function() {
        var countInput = $('#inp_count');
        var count = parseInt(countInput.val());
        if (count > 1) {
            countInput.val(count - 1);
            amount();
        }
    });

    // 수량 증가 버튼 클릭 이벤트
    $('.btn_plus').on('click', function() {
        var countInput = $('#inp_count');
        var count = parseInt(countInput.val());
        countInput.val(count + 1);
        amount();
    });

    // 수량 변경 이벤트
    $('#inp_count').on('change', function() {
        amount();
    });

    // 수량 변경에 따른 총금액 계산 함수
    function amount() {
        var countInput = $('#inp_count');
        var count = parseInt(countInput.val());
        var price = parseInt($('#pPrice').val());
        var totalPrice = count * price;
        $('#total_price').text(totalPrice.toLocaleString() + ' 원');
    }
});

</script>
</html>