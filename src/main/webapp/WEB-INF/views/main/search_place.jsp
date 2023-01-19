<html  lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/common-head.jspf" %>
<script src="/resources/js/paging/paging2.js"></script>

		<div >
			<table class="card_table" id="place_list">
				<thead>
					<tr>
						<th scope="col">제목 [지역]</th>
						<th scope="col">내용</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody class="place">

				</tbody>
			</table>
		</div>

		<div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br />

	<form id="commonForm" name="commonForm"></form>
<script type="text/javascript">
$(document).ready(function(){
	fn_selectPlaceList2(1);
		$("a[name='title']").on("click", function(e){ //제목 
			e.preventDefault();
			fn_openPlaceDetail2($(this));
		});
	});

	function fn_selectPlaceList2(pageNo) {
		var comAjax = new ComAjax();

		comAjax.setUrl("<c:url value='/pagingPlace.paw' />");
		comAjax.setCallback("fn_selectPlaceListCallback2");

		comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
		comAjax.addParam("PAGE_ROW", 10);

		comAjax.addParam("keyword", $('#keyword').val());
		comAjax.addParam("searchType", $('#searchType').val());

		comAjax.ajax();
	}
	

	function fn_selectPlaceListCallback2(data) {
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
				eventName : "fn_selectPlaceList2"
			};
			gfn_renderPaging(params);

			var str = "";
			$.each(data.placeSearchList,
							function(key, value) {
								str += "<tr>"+ 
											"<td align='center'>"+ value.PL_IDX + "</td>"+ 
											"<td class='title' align='center'>"+ 
												"<a href='#this' name='title'>"+ value.PL_NAME+ "</a>"+ 
												"<input type='hidden' name='title' id='IDX' value=" + value.PL_IDX + ">"+ 
											"</td>" + 
											/* "<td align='center'>"+ value.BC_WRITER_ID + "</td>"+  */
											"<td align='center'>"+ value.PL_MOD_DATE + "</td>"+ 
										"</tr>";
							});
			body.append(str);
		}

			$("table[id='place_list']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_openPlaceDetail($(this));
			});
			
			function fn_openPlaceDetail(obj) {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/place/detail.paw' />");
				comSubmit.addParam("PL_IDX", obj.parent().find("#IDX").val());
				comSubmit.submit();
			}
	}
</script>
</html>
