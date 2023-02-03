<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/css/common/photo.css" ></link>
<style>
	#stars { 
		display: inline-block; 
		font-size : 20px;
	}
	
	#wrap {
		width:70%;
		margin: 40px auto;
	}
	
	#re_contents {
		width:60%;
	}
	
	#place {
		padding:20px; 
		border-radius : 20px;
	}
	
 	#place {
 		width : 75%;
	    border: 1px solid;
	    border-color : #9ea7ad;
	    border-radius: 15px;
	  	box-sizing: border-box;
	    overflow: hidden;
	    box-shadow: 3px 3px 5px #d1d5d9; 
	    margin : auto;
	} 
	
	#star1{
		color : #db776c;
		font-size : 60px;
	}
	
	#star2{
		color : #d1d5d9;
	}
	
	div :not(#place) {…}
	
	table tbody tr,
	table tbody tr:last-of-type{ border: none; }
	
	
	table tr th, table tr td {
		padding : 0px 10px;
	}
	
	#writeDate{
		color : #d1d5d9;
	}
	
	#mainTd {
		width : 260px;
	}
	
	/* #re_contents {
		margin:auto;
	} */
	
	main img {
		border: 3px solid #f0b1aa;
	    box-sizing: border-box;
    	border-radius: 20px;
	}
</style>

<script type="text/javascript">
	function recheck() {
		return confirm("정말 삭제하시겠어요?");
	};		
</script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<div id="wrap" >	
	<div >
	
	<h1 class="txt_center">나의 리뷰</h1>
	<br><br>
	
		<div id="place">
			<table>
				<tbody>
					<tr>
						<td rowspan="5" id="mainTd">
							<img id="placePhoto" src="/resources/upload/${placePhoto.PH_STORED_FILE_NAME}"width="250px" src="/">
						</td>
					</tr>
					<tr>
						<td><h3>${review.PL_NAME}</h3>
						</td>
					</tr>
					<tr>
						<td>${review.PL_LOC}</td>
					</tr>
					<tr>
						<td>
							
							${fn:substring(review.PL_OPEN,0,2)}:${fn:substring(review.PL_OPEN,2,4)} -
							${fn:substring(review.PL_CLOSE,0,2)}:${fn:substring(review.PL_CLOSE,2,4)}
							&nbsp;
							<%-- (
							<c:if test="${review.PL_OFFDAY == 0}">일요일</c:if>
							<c:if test="${review.PL_OFFDAY == 1}">월요일</c:if>
							<c:if test="${review.PL_OFFDAY == 2}">화요일</c:if>
							<c:if test="${review.PL_OFFDAY == 3}">수요일</c:if>
							<c:if test="${review.PL_OFFDAY == 4}">목요일</c:if>
							<c:if test="${review.PL_OFFDAY == 5}">금요일</c:if>
							<c:if test="${review.PL_OFFDAY == 6}">토요일</c:if>휴무
							) --%> 
						</td>
					</tr>
					<tr>
						<td>
							<a class="use_move btn slim" href="/place/detail/${ }" >상세보기</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<br>
		
		<div id="place">
			<!-- 평점 -->
			<span id="star1" class="bold">${review.RE_STAR}</span>
			<span id="star2">/5점</span><br>
			<span class="color">
			    <c:forEach var="j" begin="1" end="${review.RE_STAR}">
	    			<i class="fa-solid fa-paw color" id="stars"></i>
				</c:forEach>
				<c:forEach var="j" begin="1" end="${5-review.RE_STAR}">
	    			<i class="fa-solid fa-paw subColor" id="stars"></i>
				</c:forEach>&nbsp;
			</span>
			
			<br><br><br>
			
			<!-- 후기 -->
			<div id="re_contents">
				${review.RE_CONTENTS}
			</div>	
			<br><br>
			
			<!-- 사진 -->
			<div id="img_upload" class="flex">	
				<c:forEach items="${photos}" var="i" varStatus="status">	
					<label>
						<img width="200px" src="/resources/upload/${i.PH_STORED_FILE_NAME}" id="photo">			
						&nbsp;&nbsp;
					</label>
				</c:forEach>
			</div>
			
			<br><br>
			
			
			<div id="writeDate" class="txt_right">
				최초작성 <fmt:formatDate value="${review.RE_REG_DATE}" pattern="yy.MM.dd" /><br>
				최종수정 <fmt:formatDate value="${review.RE_MOD_DATE}" pattern="yy.MM.dd" />
			</div>			
			
		</div>
		
		<br><br>
		
		<div class="txt_center">
			<a href="/review/updateForm.paw" class="use_move btn submit" 
			onclick="move(this, 're_idx:${review.RE_IDX}','ph_board_type:review')">수정</a>
			<table>
				<form action="/review/delete.paw" method="post">
					<input type="submit" class="btn" value="삭제" onClick="return recheck();">
					<input type="hidden" id="re_idx" name="re_idx" value="${review.RE_IDX}">
					<input type="hidden" id="ph_board_type" name="ph_board_type" value="review">
				</form>
			</table>
		</div>
		
		
		

	</div>	
	</div> 
</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>