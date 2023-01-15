/* ===================== 앞/뒤로가기 감시 함수 ===================== */
let form;
window.onpageshow = function(event){
	form = document.querySelector("form#search");//제출 시 사용할 폼
	if(form == null) form = document.querySelector("form#common");

	if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
		//만약 a태그를 이용한 폼 제출 후 앞/뒤로 가기 시
		let lastC = $(form).children("input");//남아있는 a태그를 이용한 추가 전달 값
		if(lastC.length > 0){ lastC.remove(); }//추가 전달값이 있으면 제거
	}
}

/* ===================== DOM 로딩 완료 시 실행 함수 ===================== */
/*$(document).ready(function() {
	//폼 제출 함수의 대상인 use_move 클래스의 a 태그 클릭 시 href 작동 중지
	$(".use_move").on("click", function(e){ e.preventDefault(); });

	move_nav();//네비게이션 모바일, 탭 화면에서 이동 함수 호출
	set_paging();//페이징 세팅 함수
	set_toggle_ellip();//테이블 펼쳐보기 세팅 함수
});*/

/* ===================== 널값 여부 체크 함수 ===================== */
//널값 여부 체크 함수. null, "NaN", "undefined", ""
function isNull(str) {
	if (str == null) return true;
	if (str == "NaN") return true;
	if (str.valueOf() == "undefined") return true;
	var chkStr = new String(str);
	if (chkStr.valueOf() == "undefined") return true;
	if (chkStr == null) return true;
	if (chkStr.toString().length == 0 ) return true;
	return false;
}

/* ===================== 스크롤 이동 함수 ===================== */
//최상단으로 스크롤 이동 함수
function go_top(){ window.scrollTo(0,0); }

/* ===================== 클래스 추가 함수 ===================== */
//스크롤 시 클래스 on 추가 함수
function scroll_toggle_on(target){
	/* body에 onscroll 속성으로 지정해야 하며 target으로 넘긴 대상에게 클래스를 추가한다 */
	target = document.querySelector(target);
	if(target == null) return;
	if (window.scrollY > 0) { target.classList.add("on"); } else { target.classList.remove("on"); }
}
//클릭 시 클래스 on 추가 함수
function click_toggle_on(target){
	target = document.querySelector(target);
	if(target == null) return;
	target.classList.toggle("on");
}
//클릭 시 클래스 show 추가 함수
function click_toggle_show(target){
	target = document.querySelector(target);
	if(target == null) return;
	target.classList.toggle("show");
}

/* ===================== 폼 제출 함수 ===================== */
/* 태그 클릭 시 form 제출로 바꿔서 이동시키는 함수.
	태그 필수 세팅
	클래스 명: use_move
	href: form을 제출할 링크(a태그가 아니라면 data-href)
	onclick: move(this, 'name:value')
		여러개일 경우 move(this, 'name:value', 'name:value', ....)
*/
function move(target, ...param){
	if(form == null) return console.log("제출할 폼이 없습니다");
	let tag = "";
	let _to = target.href;
	if(isNull(_to)) _to = target.dataset.href;
	form.action = _to;//폼의 제출처 바꾸기

	//input 처리. 전달받은 param을 :를 기준으로 잘라 앞은 name으로, 뒤는 value로 세팅
	for(let i=0; i<param.length; i++){
		tag += "<input type='hidden' name='"+param[i].split(":")[0]+"' value='"+param[i].split(":")[1]+"'>";
	}
	form.innerHTML = form.innerHTML + tag;
	form.submit();
}

/* ===================== 페이징 이동 및 세팅 함수 ===================== */
/*function set_paging(){
	let p = $(".paging");
	if(isNull(p[0])){ return false; }//페이징이 없으면 함수 종료
	p.children().on("click", function(){//페이징의 자식 요소를 클릭하면
		form.action = location.pathname;//폼을 제출할 링크는 현재 페이지와 동일하게 변경
		//폼에 현재 페이지 번호 값을 클릭한 자식 요소의 내용으로 변경
		form.querySelector("input[name='currentPageNo']").value = this.innerHTML;
		form.submit();//폼 제출
	});
}*/

/* ===================== 테이블 펼쳐보기 세팅 함수 ===================== */
function set_toggle_ellip(){
	let e = $(".toggle_ellip");
	if(isNull(e[0])){ return false; }//테이블 펼쳐보기 없으면 함수 종료
	e.on("click", function(){ $(this).toggleClass("show"); });
}

/* ===================== 네비게이션 모바일, 탭 화면에서 이동 함수 ===================== */
function move_nav(){
	let nav = document.querySelector("nav");
	//헤더에 있는 nav태그의 클래스와 동일한 클래스
	if(nav != null && window.innerWidth <= 1200){
		let target_li = document.querySelector("header .sub_pages ."+nav.classList.value);
		if(target_li != null){
			target_li.parentElement.insertBefore(nav, target_li);//nav 내용을 헤더에 삽입
			return true;
		}
	}
	return false;
}









/*function gfn_isNull(str) {
	if (str == null) return true;
	if (str == "NaN") return true;
	if (new String(str).valueOf() == "undefined") return true;    
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;    
    if (chkStr.toString().length == 0 ) return true;   
    return false; 
}*/

function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	
	if(this.formId == "commonForm"){
		$("#commonForm")[0].reset();
		$("#commonForm").empty();
	}
	
	this.setUrl = function setUrl(url){
		this.url = url;
	};
	
	this.addParam = function addParam(key, value){
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
	};
	
	this.submit = function submit(){
		var frm = $("#"+this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();	
	};
}

var gfv_ajaxCallback = "";
function ComAjax(opt_formId){
	this.url = "";		
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.param = "";
	
	if(this.formId == "commonForm"){
		$("#commonForm")[0].reset();
		$("#commonForm").empty();
	}
	
	this.setUrl = function setUrl(url){
		this.url = url;
	};
	
	this.setCallback = function setCallback(callBack){
		fv_ajaxCallback = callBack;
	};

	this.addParam = function addParam(key,value){ 
		this.param = this.param + "&" + key + "=" + value; 
	};
	
	this.ajax = function ajax(){
		if(this.formId != "commonForm"){
			this.param += "&" + $("#" + this.formId).serialize();
		}
		$.ajax({
			url : this.url,    
			type : "POST",   
			data : this.param,
			async : false, 
			success : function(data, status) {
				if(typeof(fv_ajaxCallback) == "function"){
					fv_ajaxCallback(data);
				}
				else {
					eval(fv_ajaxCallback + "(data);");
				}
			}
		});
	};
}

/*
divId : 페이징 태그가 그려질 div
pageIndx : 현재 페이지 위치가 저장될 input 태그 id
recordCount : 페이지당 레코드 수
totalCount : 전체 조회 건수 
eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름
*/
var gfv_pageIndex = null;
var gfv_eventName = null;
function gfn_renderPaging(params){
	var divId = params.divId; //페이징이 그려질 div id
	gfv_pageIndex = params.pageIndex; //현재 위치가 저장될 input 태그
	var totalCount = params.totalCount; //전체 조회 건수
	var currentIndex = $("#"+params.pageIndex).val(); //현재 위치
	if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) == true){
		currentIndex = 1;
	}
	
	var recordCount = params.recordCount; //페이지당 레코드 수
	if(gfn_isNull(recordCount) == true){
		recordCount = 20;
	}
	var totalIndexCount = Math.ceil(totalCount / recordCount); // 전체 인덱스 수
	gfv_eventName = params.eventName;
	
	$("#"+divId).empty();
	var preStr = "";
	var postStr = "";
	var str = "";
	
	var first = (parseInt((currentIndex-1) / 10) * 10) + 1;
	var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10)) ? totalIndexCount%10 : 10;
	var prev = (parseInt((currentIndex-1)/10)*10) - 9 > 0 ? (parseInt((currentIndex-1)/10)*10) - 9 : 1; 
	var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;
	
	if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨앞, 앞 태그 작성
		preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>" +
				"<a href='#this' class='pad_5' onclick='_movePage("+prev+")'>[<]</a>";
	}
	else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨앞 태그 작성
		preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>";
	}
	
	if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨뒤, 뒤 태그 작성
		postStr += "<a href='#this' class='pad_5' onclick='_movePage("+next+")'>[>]</a>" +
					"<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
	}
	else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨뒤 태그 작성
		postStr += "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
	}
	
	for(var i=first; i<(first+last); i++){
		if(i != currentIndex){
			str += "<a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a>";
		}
		else{
			str += "<strong><a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a></strong>";
		}
	}
	$("#"+divId).append(preStr + str + postStr);
}

function _movePage(value){
	$("#"+gfv_pageIndex).val(value);
	if(typeof(gfv_eventName) == "function"){
		gfv_eventName(value);
	}
	else {
		eval(gfv_eventName + "(value);");
	}
}