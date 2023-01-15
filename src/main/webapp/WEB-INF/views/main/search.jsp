<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
<main class="layoutCenter">
	<body>
		<section class="notice">
			<div class="page-title">
				<div class="container">
						<center>
						<a href="/board_list.paw"> 
						<img src="/resources/image/board_comm_mongmong.PNG">
						</a>
		                </center>
				</div>
			</div>
			<!-- board seach area -->
			<div id="board-search">
				<div class="container">
					<br>
					<div class="search-window">
						<form action="">
							<div class="search-wrap">
								<label for="search" class="blind">멍멍왈왈 내용 검색</label> <input
									id="search" type="search" name="" placeholder="검색어를 입력해주세요."
									value=""> <a class="btn submit" href="#">검색</a>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- board list area -->
			<div id="board-list">
				<div class="container">
					<table class="board-table">
						<thead>
							<tr>
								<th >글번호</th>
								<th >제목</th>
								<th >조회수</th>
								<th>작성자</th>
								<th >작성일</th>

							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(list) > 0}">
									<c:forEach items="${list }" var="row">

										<tr align="center" class="use_move" data-href="board_detail.paw"
											onclick="move(this,'BC_IDX:${row.BC_IDX}')">
											<td>${row.BC_IDX }</td>
											<td>${row.BC_TITLE }</td>
											<td>${row.BC_READHIT }</td>
											<td>${row.BC_WRITER_ID }</td>
											<td>${row.BC_MOD_DATE }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4">조회된 결과가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<br> 
			<a href="board_writeForm.paw" class="btn submit" style="float: right">글쓰기</a>
		</section>
	</body>
</main>
</html>
