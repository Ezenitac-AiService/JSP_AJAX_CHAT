<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅방 입장 | AJ-Chat</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <script src="jquery-3.7.1.js"></script>
    <style>
        body { font-family: 'Inter', 'Noto Sans KR', sans-serif; }
        .glass {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-indigo-500 via-purple-500 to-pink-500 h-screen flex items-center justify-center">
    <div class="glass p-10 rounded-3xl shadow-2xl w-full max-w-md transform transition-all hover:scale-[1.02]">
        <div class="text-center mb-10">
            <div class="inline-block p-4 bg-indigo-100 rounded-2xl mb-4">
                <svg class="w-8 h-8 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"></path>
                </svg>
            </div>
            <h1 class="text-3xl font-bold text-gray-800 mb-2">AJ-Chat</h1>
            <p class="text-gray-500">실시간 AJAX 채팅방에 참여해보세요</p>
        </div>

        <form id="join" name="join" method="post" action="chat.jsp" onsubmit="return DoJoin();" class="space-y-6">
            <div>
                <label for="nick" class="block text-sm font-semibold text-gray-600 mb-2">닉네임</label>
                <input type="text" id="nick" name="nick" 
                       class="w-full px-5 py-4 bg-gray-50 border border-gray-200 rounded-2xl focus:ring-4 focus:ring-indigo-100 focus:border-indigo-500 outline-none transition-all text-gray-800 placeholder-gray-400"
                       placeholder="사용할 닉네임을 입력하세요" autocomplete="off">
            </div>
            
            <button type="submit" 
                    class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-4 rounded-2xl shadow-lg shadow-indigo-200 transition-all active:transform active:scale-95 flex items-center justify-center gap-2">
                참여하기
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6"></path>
                </svg>
            </button>
        </form>

        <p class="mt-8 text-center text-xs text-gray-400 uppercase tracking-widest font-semibold">
            Educational Project Refactoring
        </p>
    </div>

    <script>
        $(document).ready(function() {
            $("#nick").focus();
        });
        
        function DoJoin() {
            const nick = $("#nick").val().trim();
            if (nick === "") {
                alert("참여를 위해 닉네임을 입력해 주세요.");
                $("#nick").focus();
                return false;
            }
            return true;
        }
    </script>
</body>
</html>