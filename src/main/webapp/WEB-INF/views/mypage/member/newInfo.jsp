<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.tailwindcss.com?plugins=forms"></script>
<script>
    tailwind.config = {
        important: true,
    }
</script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<!--아이디 찾기에 성공했을 시 아이디를 보여준다.-->
<main class="layoutCenter">
    <div class="flex min-h-full items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="w-full max-w-md space-y-8">
            <div>
                <img class="mx-auto h-12 w-auto" src="/resources/image/logo.png" alt="투개더">
                <h2 class="mt-6 text-center text-3xl font-bold tracking-tight text-[#f0b1aa]">회원정보 수정이 완료되었습니다.</h2>
            </div>
            <div>
                <button type="submit" onclick="location.href='/mypage/myInfo.paw'" class="group relative flex w-full justify-center rounded-md border border-transparent bg-[#f0b1aa] py-2 px-4 text-sm font-medium text-white hover:bg-[#f08080] focus:outline-none focus:ring-2 focus:ring-[#f08080] focus:ring-offset-2">
                    마이페이지로 돌아가기
                </button>
            </div>
        </div>
    </div>
</main><!-- //main 종료 -->

<!-- 풋터. 모든 페이지에 삽입! -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>