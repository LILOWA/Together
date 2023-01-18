<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="/resources/js/paging/paging2.js"></script>

			<div >
				<table class="card_table" id="together_list">
					<thead>
						<tr>
							<th scope="col">제목 [지역]</th>
							<th scope="col">내용</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>

			<div id="PAGE_NAVI"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br />

		<form id="commonForm" name="commonForm"></form>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>> 
<script type="text/javascript" src="resources/js/main/search_together.js"></script>
	<!-- <script type="text/javascript">
	$(document).ready(function(){
		fn_selectBoardList(1);
			$("a[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});
	
	
		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/together/detail.paw' />");
			comSubmit.addParam("TO_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}

		function fn_selectBoardList(pageNo) {
			var comAjax = new ComAjax();

			comAjax.setUrl("<c:url value='/pagingBoard2.paw' />");
			comAjax.setCallback("fn_selectBoardListCallback");

			comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 10);

			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());

			comAjax.ajax();
		}
		

		function fn_selectBoardListCallback(data) {
			var total = data.TOTAL;
			var body = $("table>tbody");
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
				$.each(data.togetherSearchList,
								function(key, value) {
									str += "<tr>"+ // class='use_move' data-href='/board_detail.paw' onclick='move(this,'BC_IDX:"+value.BC_IDX+"')'
												"<td align='center'>"+ value.TO_IDX + "[ "+value.TO_LOC+"]</td>"+ 
												"<td class='title' align='center'>"+ 
													"<a href='#this' name='title'>"+ value.TO_TITLE+ "</a>"+ 
													"<input type='hidden' name='title' id='IDX' value=" + value.TO_IDX + ">"+ 
												"</td>" + 
												"<td align='center'>"+ value.TO_WRITER_ID + "</td>"+ 
												"<td align='center'>"+ value.TO_DATE + "</td>"+ 
											"</tr>";
								});
				body.append(str);
			}

				$("a[name='title']").on("click", function(e) { //제목 
					e.preventDefault();
					fn_openBoardDetail($(this));
				});
		}
	</script>	 -->
</html>