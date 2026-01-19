/**
 * AJ-Chat JS (JSON & Tailwind CSS 지원)
 * 교육용 리팩토링 버전
 */

$(document).ready(function() {
    $("#btnSend").click(function(e) {
        e.preventDefault();
        SendMsg();
    });

    // 1.5초 간격으로 메시지 수신 (과도한 부하 방지)
    setInterval(function() {
        GetMsg();
    }, 1500);

    GetMsg();
    $("#msg").focus();
});

function SendMsg() {
    const msgInput = $("#msg");
    const msg = msgInput.val().trim();

    if (msg === "") {
        msgInput.focus();
        return false;
    }

    $.ajax({
        type: "POST",
        url: "sendmsg.jsp",
        data: { msg: msg },
        dataType: "json",
        success: function(response) {
            if (response.status === "success") {
                msgInput.val("");
                msgInput.focus();
                GetMsg();
            } else {
                console.error("발송 실패:", response.message);
            }
        },
        error: function(xhr, status, error) {
            console.error("통신 에러:", error);
        }
    });

    return false;
}

var last_cno = "0";
function GetMsg() {
    $.ajax({
        type: "GET",
        url: "getmsg.jsp",
        data: { cno: last_cno },
        dataType: "json",
        success: function(data) {
            if (data && data.length > 0) {
                data.forEach(function(item) {
                    renderMessage(item);
                    last_cno = item.cno;
                });
                scrollToBottom();
            }
        },
        error: function(xhr, status, error) {
            console.error("수신 에러:", error);
        }
    });
}

/**
 * 메시지 렌더링 (Tailwind CSS 기반 말풍선)
 */
function renderMessage(item) {
    const isMine = (item.cname === myNick);
    let html = '';

    if (isMine) {
        // 내 메시지 (우측, 보라색)
        html = `
            <div class="flex flex-col items-end space-y-1 animate-fadeInRight">
                <div class="flex items-end gap-2">
                    <span class="text-[10px] text-gray-400 mb-1">${formatTime(item.cdate)}</span>
                    <div class="bg-indigo-600 text-white px-4 py-2 rounded-2xl rounded-tr-none shadow-sm max-w-sm break-all">
                        ${escapeHtml(item.cnote)}
                    </div>
                </div>
            </div>
        `;
    } else {
        // 상대방 메시지 (좌측, 흰색)
        html = `
            <div class="flex flex-col items-start space-y-1 animate-fadeInLeft">
                <span class="text-xs font-semibold text-gray-500 ml-1">${item.cname}</span>
                <div class="flex items-end gap-2">
                    <div class="bg-white text-gray-800 px-4 py-2 rounded-2xl rounded-tl-none shadow-sm max-w-sm break-all">
                        ${escapeHtml(item.cnote)}
                    </div>
                    <span class="text-[10px] text-gray-400 mb-1">${formatTime(item.cdate)}</span>
                </div>
            </div>
        `;
    }

    $("#chatMsg").append(html);
}

function scrollToBottom() {
    const chatMsg = document.getElementById("chatMsg");
    chatMsg.scrollTo({
        top: chatMsg.scrollHeight,
        behavior: 'smooth'
    });
}

function escapeHtml(text) {
    return text
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}

function formatTime(dateStr) {
    // 2026-01-19 05:18:47 -> 05:18
    try {
        const parts = dateStr.split(" ");
        if (parts.length > 1) {
            const timeParts = parts[1].split(":");
            return timeParts[0] + ":" + timeParts[1];
        }
    } catch (e) {
        return "";
    }
    return dateStr;
}
