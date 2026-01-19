package ezen;

import java.time.LocalDateTime;

/**
 * ChatDTO: 채팅 메시지 정보를 담는 데이터 전송 객체
 * Java 17 스타일의 깔끔한 구조
 */
public class ChatDTO {
    private int cno;
    private String cdate; // JSP 연동을 위해 일단 String 유지 (또는 LocalDateTime)
    private String cname;
    private String cnote;

    public ChatDTO() {}

    public ChatDTO(int cno, String cdate, String cname, String cnote) {
        this.cno = cno;
        this.cdate = cdate;
        this.cname = cname;
        this.cnote = cnote;
    }

    // Getters and Setters
    public int getCno() { return cno; }
    public void setCno(int cno) { this.cno = cno; }

    public String getCdate() { return cdate; }
    public void setCdate(String cdate) { this.cdate = cdate; }

    public String getCname() { return cname; }
    public void setCname(String cname) { this.cname = cname; }

    public String getCnote() { return cnote; }
    public void setCnote(String cnote) { this.cnote = cnote; }
}
