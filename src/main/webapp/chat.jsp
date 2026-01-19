<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String nick = request.getParameter("nick");
    if (nick == null) {
        %>
        <script>
            alert("닉네임을 지정한 후 채팅방에 참여하세요!!");
            document.location = "join.jsp";
        </script>
        <%
        return;
    }
    session.setAttribute("nick", nick);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AJ-Chat | <%= nick %> 님</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <script src="jquery-3.7.1.js"></script>
    <script type="text/javascript">
        var myNick = "<%= nick %>";
    </script> 
    <script src="chat.js" charset="utf-8"></script>
    <style>
        body { font-family: 'Inter', 'Noto Sans KR', sans-serif; }
        .chat-container { height: calc(100vh - 180px); }
        .scrollbar-hide::-webkit-scrollbar { display: none; }
        @keyframes fadeInRight {
            from { opacity: 0; transform: translateX(10px); }
            to { opacity: 1; transform: translateX(0); }
        }
        @keyframes fadeInLeft {
            from { opacity: 0; transform: translateX(-10px); }
            to { opacity: 1; transform: translateX(0); }
        }
        .animate-fadeInRight { animation: fadeInRight 0.3s ease-out; }
        .animate-fadeInLeft { animation: fadeInLeft 0.3s ease-out; }
    </style>
</head>
<body class="bg-gray-100 h-screen flex flex-col">
    <!-- Header -->
    <header class="bg-white border-b border-gray-200 px-6 py-4 flex items-center justify-between sticky top-0 z-10 shadow-sm">
        <div class="flex items-center gap-3">
            <div class="w-10 h-10 bg-indigo-600 rounded-full flex items-center justify-center text-white font-bold">
                <%= nick.substring(0, Math.min(nick.length(), 1)).toUpperCase() %>
            </div>
            <div>
                <h2 class="font-bold text-gray-800"><%= nick %></h2>
                <span class="text-xs text-green-500 flex items-center gap-1">
                    <span class="w-2 h-2 bg-green-500 rounded-full animate-pulse"></span>
                    Online
                </span>
            </div>
        </div>
        <button onclick="location.href='join.jsp'" class="text-gray-400 hover:text-red-500 transition-colors">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
            </svg>
        </button>
    </header>

    <!-- Chat Messages -->
    <main id="chatMsg" class="flex-1 overflow-y-auto p-6 space-y-4 chat-container scrollbar-hide">
        <div class="flex justify-center">
            <span class="bg-gray-200 text-gray-500 text-xs px-3 py-1 rounded-full uppercase tracking-tighter">채팅방에 참여하였습니다</span>
        </div>
    </main>

    <!-- Bottom Bar -->
    <footer class="bg-white border-t border-gray-200 p-4 pb-8 md:pb-4">
        <form id="chat" name="chat" method="post" action="#" onsubmit="return SendMsg();" class="max-w-4xl mx-auto flex gap-3">
            <div class="relative flex-1">
                <input type="text" id="msg" name="msg" 
                       class="w-full pl-4 pr-12 py-3 bg-gray-50 border border-gray-200 rounded-2xl focus:ring-4 focus:ring-indigo-100 focus:border-indigo-500 outline-none transition-all text-gray-800"
                       placeholder="메시지를 입력하세요..." autocomplete="off">
                <div class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-300">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                </div>
            </div>
            <button type="submit" id="btnSend"
                    class="bg-indigo-600 hover:bg-indigo-700 text-white p-3 rounded-2xl shadow-lg shadow-indigo-100 transition-all active:transform active:scale-95">
                <svg class="w-6 h-6 transform rotate-90" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M2.01 21L23 12L2.01 3L2 10L17 12L2 14L2.01 21Z"></path>
                </svg>
            </button>
        </form>
    </footer>
</body>
</html>