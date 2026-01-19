# TASKS: E2E 테스트 및 도커화

## 🏗️ EPIC-05: 도커 기반 통합 환경 구축
- [x] TASK-05-01: `Dockerfile` 작성 (Tomcat 9 기반, JSP 컨텐츠 및 라이브러리 복사)
- [x] TASK-05-02: `docker-compose.yml` 고도화 (app 서비스 추가 및 DB 의존성 설정)
- [x] TASK-05-03: 통합 환경 빌드 및 구동 테스트 (`curl`로 접속 확인)

## 🧪 EPIC-06: Playwright E2E 테스트 구현 및 실행
- [x] TASK-06-01: Playwright 환경 설정 (`playwright.config.ts` 등 필요 파일 생성)
- [x] TASK-06-02: 시나리오 C(다중 사용자 채팅) 테스트 스크립트 작성
- [x] TASK-06-03: 테스트 실행 및 실제 브라우저 동작 검증 (Chrome DevTools 활용)
- [x] TASK-06-04: 최종 테스트 결과 보고서(`docs/E2E_TEST_REPORT.md`) 생성
