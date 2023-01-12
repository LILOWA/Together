<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍BTI</title>

<!-- 부트 스트랩보다 css가 더 우선적으로 작동할 수 있도록 css를 나중에 작성 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>

<link href="resources/css/mbti/style.css" rel="stylesheet">

<!--  
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
-->

</head>
<body class="container">

	<article class="result">
		<h2 id="mbti" class="text-center mt-5">MBTI</h2>
		<img id="mbtiImg" alt="mbtiImg" src="resources/image/mbti/ENFJ.jpg">
		<img id="explainImg" class="mt-3" alt="explainImg" src="resources/image/mbti/ENFJ0.JPG">
		
		<button type="button" class="btn btn-dark btn-lg mt-3" onclick="location.replace('/mbti.paw')">테스트 다시 하기</button>
		<button type="button" class="btn btn-dark btn-lg mt-1">테스트 결과 저장</button><br><br>
		
		<!-- 공유 버튼 --> 
		<h3 class="mt-5 text-center"">* 공유하기 *</h3><br>
		<div class="addthis_inline_share_toolbox_j6rc share"></div><br><br><br>
	</article>
	
		<input type="hidden" id="EI" value="0">
		<input type="hidden" id="NS" value="0">
		<input type="hidden" id="TF" value="0">
		<input type="hidden" id="JP" value="0">
		
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>


	<!-- Go to www.addthis.com/dashboard to customize your tools --> 
	<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-63ba760d20bdd2c9"></script>
	
	<script type="text/javascript">
	
		$("#mbti").html(result[mbti]["mbti"]);
		$("#mbtiImg").attr("src", result[mbti]["mbtiImg"]);
		$("#explainImg").attr("src", result[mbti]["explainImg"]);
		
		/* 테스트 결과 */
		var result = {
				"ENFJ" :  {"mbti":"ENFJ", "explainImg":"resources/image/mbti/ENFJ0.JPG", "mbtiImg":"resources/image/mbti/ENFJ.jpg"},
				"ENFP" :  {"mbti":"ENFP", "explainImg":"resources/image/mbti/ENFP0.JPG", "mbtiImg":"resources/image/mbti/ENFP.jpg"},
				"ENTJ" :  {"mbti":"ENTJ", "explainImg":"resources/image/mbti/ENTJ0.JPG", "mbtiImg":"resources/image/mbti/ENTJ.jpg"},
				"ENTP" :  {"mbti":"ENTP", "explainImg":"resources/image/mbti/ENTP0.JPG", "mbtiImg":"resources/image/mbti/ENTP.jpg"},
				"ESFJ" :  {"mbti":"ESFJ", "explainImg":"resources/image/mbti/ESFJ0.JPG", "mbtiImg":"resources/image/mbti/ESFJ.jpg"},
				"ESFP" :  {"mbti":"ESFP", "explainImg":"resources/image/mbti/ESFP0.JPG", "mbtiImg":"resources/image/mbti/ESFP.jpg"},
				"ESTJ" :  {"mbti":"ESTJ", "explainImg":"resources/image/mbti/ESTJ0.JPG", "mbtiImg":"resources/image/mbti/ESTJ.jpg"},
				"ESTP" :  {"mbti":"ESTP", "explainImg":"resources/image/mbti/ESTP0.JPG", "mbtiImg":"resources/image/mbti/ESTP.jpg"},
				"INFJ" :  {"mbti":"INFJ", "explainImg":"resources/image/mbti/INFJ0.JPG", "mbtiImg":"resources/image/mbti/INFJ.jpg"},
				"INFP" :  {"mbti":"INFP", "explainImg":"resources/image/mbti/INFP0.JPG", "mbtiImg":"resources/image/mbti/INFP.jpg"},
				"INTJ" :  {"mbti":"INTJ", "explainImg":"resources/image/mbti/INTJ0.JPG", "mbtiImg":"resources/image/mbti/INTJ.jpg"},
				"INTP" :  {"mbti":"INTP", "explainImg":"resources/image/mbti/INTP0.JPG", "mbtiImg":"resources/image/mbti/INTP.jpg"},
				"ISFJ" :  {"mbti":"ISFJ", "explainImg":"resources/image/mbti/ISFJ0.JPG", "mbtiImg":"resources/image/mbti/ISFJ.jpg"},
				"ISFP" :  {"mbti":"ISFP", "explainImg":"resources/image/mbti/ISFP0.JPG", "mbtiImg":"resources/image/mbti/ISFP.jpg"},
				"ISTJ" :  {"mbti":"ISTJ", "explainImg":"resources/image/mbti/ISTJ0.JPG", "mbtiImg":"resources/image/mbti/ISTJ.jpg"},
				"ISTP" :  {"mbti":"ISTP", "explainImg":"resources/image/mbti/ISTP0.JPG", "mbtiImg":"resources/image/mbti/ISTP.jpg"}
		
		}
		
	</script>

</body>
</html>