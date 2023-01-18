<html  lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/common-head.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/css/common/layout.css"/>
<script src="/resources/js/paging/paging.js"></script>

<div>
	<table>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<!-- <th scope="col">조회수</th> -->
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody class="place">

		</tbody>
	</table>
</div>


<div id="PAGE_NAVI"></div>
<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
<br />

<form id="commonForm" name="commonForm"></form>
<script type="text/javascript">
$(document).ready(function(){
	fn_selectBoardList(1);
		$("a[name='title']").on("click", function(e){ //제목 
			e.preventDefault();
			fn_openBoardDetail($(this));
		});
	});


	function fn_selectBoardList(pageNo) {
		var comAjax = new ComAjax();

		comAjax.setUrl("<c:url value='/pagingBoard3.paw' />");
		comAjax.setCallback("fn_selectBoardListCallback");

		comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
		comAjax.addParam("PAGE_ROW", 10);

		comAjax.addParam("keyword", $('#keyword').val());
		comAjax.addParam("searchType", $('#searchType').val());

		comAjax.ajax();
	}
	
	function fn_selectBoardListCallback(data) {
		var total = data.TOTAL;
		var body = $(".place");
		body.empty();
		
		if (total == 0) {
			var str = "<tr align='center'>" + "<td colspan='4'>조회된 결과가 없습니다.</td>"
					+ "</tr>";
			body.append(str);

		} else {
			var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_selectBoardList"
			};
			gfn_renderPaging(params);

			var str = "";
			$.each(data.boardSearchList,
							function(key, value) {
								str += "<tr>"+ 
											"<td align='center'>"+ value.PL_IDX + "</td>"+ 
											"<td class='title'>"+ 
												"<a href='#this' name='title'>"+ value.PL_NAME+ "</a>"+ 
												"<input type='hidden' name='title' id='IDX' value=" + value.PL_IDX + ">"+ 
											"</td>" + 
											/* "<td align='center'>"+ value.BC_WRITER_ID + "</td>"+  */
											"<td align='center'>"+ value.PL_MOD_DATE + "</td>"+ 
										"</tr>";
							});
			body.append(str);
		}

			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
			
			function fn_openBoardDetail(obj) {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/board/detail.paw' />");
				comSubmit.addParam("PL_IDX", obj.parent().find("#IDX").val());
				comSubmit.submit();
			}
	}
</script>
</html>
<!-- <script type="text/javascript" src="resources/js/main/search_board.js"></script> -->