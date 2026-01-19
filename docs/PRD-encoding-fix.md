# PRD: 전계층 UTF-8 인코딩 통합 및 한글 깨짐 해결

## 1. 개요
- **목적**: DB, 서버(JVM), 웹 페이지, AJAX 통신 전 구간에서 인코딩 설정을 UTF-8로 통일하여 한글 깨짐 현상(Mojibake)을 원천적으로 해결함.
- **배경**: 현재 기존 DB 데이터(홍길동 등)가 브라우저에서 비정상적으로 표시되고 있음.

## 2. 해결 방안 (Technical Specification)

### 2.1 Database (MySQL)
- MySQL 서버 기동 시 `utf8mb4` 캐릭터 셋 사용 강제.
- `docker-compose.yml` 리소스에 `--character-set-server=utf8mb4` 옵션 추가.
- `chat.sql` 초기화 스크립트에 `SET NAMES utf8mb4` 명시.

### 2.2 Application Server (Tomcat/JVM)
- JVM 옵션에 `-Dfile.encoding=UTF-8` 추가하여 문자열 처리 규격 통일.
- `Dockerfile`의 `CMD` 명령어 수정.

### 2.3 Layer (JDBC & JSP)
- `DBManager.java`의 JDBC URL 파라미터 확인 및 강화.
- JSP 파일들의 `encoding` 선언 및 `request.setCharacterEncoding("UTF-8")` 누락 여부 최종 점검.

## 3. 수용 기준 (Acceptance Criteria)
1. `docker-compose up` 재실행 후 초기 데이터(홍길동)가 멀쩡하게 표시됨.
2. 사용자가 브라우저에서 한글 메시지를 전송했을 때 깨짐 없이 서버에 도달하고 전파됨.
3. Chrome DevTools Network 탭에서 응답 헤더의 `Content-Type`이 `charset=UTF-8`임을 보장.

## 4. 일정 및 우선순위
- **우선순위**: P0 (최우선 해결 과제)
