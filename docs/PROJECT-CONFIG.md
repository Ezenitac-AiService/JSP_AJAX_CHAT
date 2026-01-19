# PROJECT CONFIG: AJAX 채팅 리팩토링 교육용

## 1. 개발 환경 (Development Environment)
- **Runtime**: Java 17
- **Web Container**: Tomcat 9.x
- **Database**: MySQL 8.0 (Docker)
- **Frontend**: jQuery 3.7.1, Tailwind CSS (via CDN)

## 2. 데이터베이스 설정 (Database Config)
- **Host**: `localhost:3306` (Docker 마운트)
- **Database**: `chatdb`
- **Username**: `root`
- **Password**: `ezen`
- **Tables**:
  - `chat`: 채팅 메시지 저장 테이블

## 3. 리팩토링 원칙 (Refactoring Principles)
- **SQL**: `PreparedStatement` 필수 사용 (SQL Injection 방지)
- **통신**: `JSON` 형식 통일 (XML 지양)
- **디자인**: `Tailwind CSS` 유틸리티 기반 모던 UI
- **구조**: JSP 내 Java 로직 분리 (DTO/Manager 패턴)

## 4. 빌드 및 실행 명령어 (Build & Run Commands)
- **DB 시작**: `docker-compose up -d`
- **DB 중지**: `docker-compose down`
- **컴파일**: `javac -d build/classes -cp "WEB-INF/lib/*:." src/main/java/ezen/*.java` (예시)
