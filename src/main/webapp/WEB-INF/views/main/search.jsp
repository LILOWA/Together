<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<main class="layoutCenter">
	<div class="container2">
		<div align="center">
			<form action="/search.paw" method="POST">
				<fieldset>
					<select name="searchType" id="searchType">
						<option value="all">-----</option>
						<option value="t"
							<c:out value="${searchType eq 't'?'selected':''}"/>>제목</option>
						<option value="w"
							<c:out value="${searchType eq 'w'?'selected':''}"/>>작성자</option>
					</select> 
					<input type="text" class="txt" placeholder="Search" name="keyword" id="keyword" value="${keyword}" />&nbsp; 
					<input type="submit" value="검색" class="btn"  onClick="onSearch()" />
				</fieldset>
			</form>
		</div>
		<br>
		
		<div>
			<div class="tab_radio">
				<input type="radio" id="tab_a" name="tab" value="a" checked> <label for="tab_a">게시판</label> 
				<input type="radio" id="tab_b" name="tab" value="b"> 		 <label for="tab_b">함께해요</label> 
				<input type="radio" id="tab_b" name="tab" value="b"> 		 <label for="tab_b">시설</label>
			</div>
			<br>
			<div>
			<jsp:include page="search_together.jsp" ></jsp:include>
			</div>
			<div>
			<jsp:include page="search_board.jsp" ></jsp:include>
			</div>
			</div></div></main>
