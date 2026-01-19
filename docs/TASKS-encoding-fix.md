# TASKS: 전계층 인코딩 통합 (UTF-8 Fix)

## 🛠️ EPIC-07: 인프라 및 DB 인코딩 강화
- [x] TASK-07-01: `docker-compose.yml` 수정 (MySQL 캐릭터셋 옵션 추가)
- [x] TASK-07-02: `Dockerfile` 수정 (JVM encoding 옵션 추가)
- [x] TASK-07-03: `Document/chat.sql` 인코딩 선언 추가 및 정제
- [x] TASK-07-04: 환경 재빌드 및 초기 데이터 한글 출력 검증

## 🧪 EPIC-08: 웹/애플리케이션 레이어 최종 점검
- [x] TASK-08-01: `DBManager.java` JDBC URL 파라미터 최적화
- [x] TASK-08-02: 모든 JSP 파일 상단 인코딩 선언 및 필터 로직 점검
- [x] TASK-08-03: Playwright를 이용한 "한글 메시지" E2E 테스트 추가 및 최종 통과
