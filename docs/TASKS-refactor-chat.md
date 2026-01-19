# TASKS: AJAX 채팅 애플리케이션 리팩토링

## 📋 개요
이 문서는 JSP/AJAX 채팅 프로젝트의 교육용 리팩토링을 위한 상세 작업 목록입니다.

## 🏗️ EPIC-01: 인프라 및 환경 설정
> Docker를 활용한 데이터베이스 환경 구성 및 Java 17 개발 환경 최적화

- [x] TASK-01-01: `docker-compose.yml` 파일 작성 (MySQL 8.0 기반)
  - `Document/chat.sql`을 초기화용 볼륨으로 마운트
  - Root 비밀번호: `ezen`, DB명: `chatdb` 설정
- [x] TASK-01-02: 프로젝트 설정 파일(`docs/PROJECT-CONFIG.md`) 생성 및 Java 17/Tomcat 9(또는 10) 사양 명시
- [x] TASK-01-03: Docker 컨테이너 구동 및 `DBManager` 연결 테스트 코드 작성

## 🗄️ EPIC-02: 데이터 소스 및 DB 로직 개선
> SQL Injection 방지 및 코드 가독성을 위한 JDBC 클래스 현대화

- [x] TASK-02-01: `DBManager.java` 리팩토링
  - `PreparedStatement` 기반의 `RunSQL`, `OpenQuery` 메서드 추가
  - Java 17의 `try-with-resources` 문법 적용
- [x] TASK-02-02: `ChatDTO.java` 데이터 객체(POJO) 생성
  - 훈련생들이 객체 지향 프로그래밍 기초를 익힐 수 있도록 설계
- [x] TASK-02-03: JSON 처를 위한 라이브러리(Gson) 추가 및 JSP 연동 준비

## 🎨 EPIC-03: 프론트엔드 UI 리뉴얼
> Tailwind CSS를 활용한 모던하고 세련된 사용자 인터페이스 시각화

- [x] TASK-03-01: 기본 레이아웃 및 Tailwind CSS CDN 도입 (또는 CLI 설정 제안)
- [x] TASK-03-02: `join.jsp` 리뉴얼
  - 깔끔한 카드 스타일의 닉네임 입력 폼 디자인
- [x] TASK-03-03: `chat.jsp` 리뉴얼
  - 카카오톡 스타일의 좌/우 말풍선 UI 적용
  - 하단 고정형 메시지 입력창 및 자동 스크롤 기능

## 🔗 EPIC-04: API 및 AJAX 로직 고도화
> XML에서 JSON으로의 통신 규격 변경 및 프론트엔드 스크립트 최적화

- [ ] TASK-04-01: `sendmsg.jsp` 리팩토링
  - 세션 체크 강화 및 `PreparedStatement` 적용
- [ ] TASK-04-02: `getmsg.jsp` 리팩토링
  - XML 태그 생성 로직 제거 -> `Gson`을 활용한 JSON 응답 처리
- [ ] TASK-04-03: `chat.js` 고도화
  - XML 파싱 코드 제거 및 JSON 오브젝트 처리 로직 구현
  - 메시지 수신 시 스크롤 최하단 이동 애니메이션 추가
