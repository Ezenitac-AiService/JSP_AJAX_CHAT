# PRD: AJAX 채팅 애플리케이션 리팩토링 (교육용)

## 1. 프로젝트 개요
- **목적**: 초급 개발자 훈련생(고졸 수준)을 위한 최신 트렌드 반영 및 기술적 완성도가 높은 교육용 채팅 애플리케이션 리팩토링.
- **주요 가치**: '동작하는 코드'에서 '좋은 코드'로의 발전 과정을 보여줌으로써 실무 역량 기초 강화.
- **핵심 기술 스택**: 
  - Backend: Java 17, Tomcat, JSP, MySQL
  - Frontend: Tailwind CSS, jQuery, AJAX (JSON 기반 통신)
  - Infrastructure: Docker (MySQL 임시 구성)

## 2. 주요 개선 사항 (Refactoring Points)

### 2.1 UI/UX 고도화 (Tailwind CSS 도입)
- **기존**: 기본 HTML Table 및 인라인 스타일링.
- **개선**: Tailwind CSS를 활용한 모던하고 반응형인 프리미엄 채팅 인터페이스 구축.
  - 다크 모드 지원 고려.
  - 카카오톡/텔레그램 스타일의 말풍선 레이아웃.
  - 사용자 친화적인 애니메이션 및 상호작용.

### 2.2 코드 안정성 및 보안 강화
- **SQL Injection 방지**: 기존 `Statement` 기반의 쿼리 실행 방식을 `PreparedStatement`로 전면 교체.
- **데이터 형식 변경**: 통신 데이터 형식을 구식인 `XML`에서 현대적인 `JSON`으로 변경.
- **리소스 관리**: `DBManager`의 커넥션 풀링(직접 구현 또는 라이브러리 활용 제안) 및 예외 처리 로직 강화.

### 2.3 개발 환경 현대화
- **Docker 기반 데이터베이스**: 로컬 설치 없이 `docker-compose.yml`을 통해 MySQL 8.0 환경을 즉시 구축.
- **코드 스타일**: Java 17의 최신 문법(텍스트 블록 등)을 활용하여 가독성 향상.

## 3. 사용자 스토리
1. **훈련생**: 잘 짜인 코드를 보며 SQL Injection이 왜 위험한지, 왜 JSON을 쓰는지, CSS 프레임워크가 왜 생산적인지 이해할 수 있다.
2. **강사**: Docker를 이용해 수강생들의 실습 환경을 통일하고, 리팩토링 전후를 비교하며 수준 높은 교육을 진행할 수 있다.

## 4. 핵심 기능 목록 (Functional Requirements)
- [ ] **참여하기 (Join)**: 닉네임 입력 및 세션 저장.
- [ ] **채팅창 (Chat)**: 
  - 메시지 실시간 수신 (AJAX Polling 기반 유지, JSON 처리).
  - 메시지 전송 (AJAX 전송, 성공 시 입력창 초기화).
  - 내 메시지와 상대방 메시지의 시각적 구분.
- [ ] **DB 관리**: `DBManager` 고도화 및 Docker MySQL 연동.

## 5. 비기능Requirements (Non-functional)
- **가독성**: 초급자를 위해 코드 내에 주석을 상세하게 작성.
- **성능**: 1초 단위 Polling 시 부하를 최소화하는 로직.
- **유지보수**: JSP 내 Java logic 최소화 (Controller/DAO 패턴 지향).

## 6. 인프라 설정
- `docker-compose.yml` 작성
- `Document/chat.sql` 자동 초기화 스크립트 포함
