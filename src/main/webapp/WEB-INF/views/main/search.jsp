<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/user-header.jspf"%>
<main class="layoutCenter">
	<section class="searchnotice">

		<!-- board list area -->
		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<colgroup>
						<col width="10%" />
						<col width="*" />
						<col width="15%" />
						<col width="20%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">글번호</th>
							<th scope="col">제목</th>
							<th scope="col">조회수</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
				<div id="PAGE_NAVI"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br /> <a
					href="#this" class="btn" id="write">글쓰기</a>
			</div>
		</div>
	</section>
<form id="commonForm" name="commonForm"></form>

	<script type="text/javascript">
	function fn_selectBoardList(pageNo){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/main0.paw' />");
		comAjax.setCallback("fn_selectBoardListCallback");
		comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
		comAjax.addParam("PAGE_ROW", 10);
		comAjax.addParam("IDX_FE", $("#IDX_FE").val());
		comAjax.ajax();
	}
	
	function fn_selectBoardListCallback(data){
		var total = data.TOTAL;
		var body = $("table>tbody");
		body.empty();
		if(total == 0){
			var str = "<tr>" + 
							"<td colspan='4'>조회된 결과가 없습니다.</td>" + 
						"</tr>";
			body.append(str);
		}
		else{
			var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_selectBoardList"
			};
			gfn_renderPaging(params);
			
			var str = "";
			$.each(data.list, function(key, value){
				str += "<tr>" + 
							"<td>" + value.BC_IDX + "</td>" + 
							"<td class='title'>" +
								"<a href='#this' name='BC_TITLE'>" + value.BC_TITLE + "</a>" +
								"<input type='hidden' name='title' id='BC_IDX' value=" + value.BC_IDX + ">" + 
							"</td>" +
							"<td>" + value.BC_MOD_DATE + "</td>" + 
							"<td>" + value.BC_WRITER_ID + "</td>" + 
						"</tr>";
			});
			body.append(str);
			
			$("a[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		}
	}
</script>	
</main>
</html>
