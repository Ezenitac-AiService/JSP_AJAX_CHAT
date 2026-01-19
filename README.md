# 💬 AJ-Chat: Modernized AJAX Chat Application

![Java](https://img.shields.io/badge/Java-17-orange?style=for-the-badge&logo=openjdk)
![Tomcat](https://img.shields.io/badge/Tomcat-9.0-red?style=for-the-badge&logo=apache-tomcat)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?style=for-the-badge&logo=mysql)
![TailwindCSS](https://img.shields.io/badge/Tailwind_CSS-3.0-38B2AC?style=for-the-badge&logo=tailwind-css)
![Docker](https://img.shields.io/badge/Docker-Enabled-2496ED?style=for-the-badge&logo=docker)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

구식 JSP/XML 기반의 채팅 예제를 현대적인 **JSON API**와 **프리미엄 UI/UX**로 리팩토링한 교육용 프로젝트입니다. 

---

## 🚀 5분 퀵스타트 (Quick Start)

Docker만 설치되어 있다면, 1분 안에 모든 환경을 구축하고 채팅을 시작할 수 있습니다.

```bash
# 1. 저장소 클론
git clone https://github.com/your-repo/chat-ajax-modernized.git
cd chat-ajax-modernized

# 2. 통합 환경 기동 (Tomcat + MySQL)
docker-compose up -d
```

접속 주소: [http://localhost:8080](http://localhost:8080)

---

## ✨ 주요 리팩토링 포인트 (Key Features)

1.  **데이터 규격 현대화**: 기존 XML 기반 통신을 **JSON(Gson)** 방식으로 전면 교체하여 데이터 효율성을 높였습니다.
2.  **보안 강화**: `PreparedStatement`를 도입하여 SQL Injection 취약점을 원천 차단했습니다.
3.  **UI/UX 혁신**: `Tailwind CSS`를 활용하여 모던하고 반응형인 프리미엄 디자인을 적용했습니다.
4.  **인코딩 해결**: 전 구간(DB-Server-Browser) **UTF-8(utf8mb4)** 통합 설정을 통해 한글 깨짐 문제를 근본적으로 해결했습니다.
5.  **E2E 테스트 자동화**: `Playwright`를 이용해 실제 브라우저 환경에서의 멀티 유저 채팅 시나리오를 자동 검증합니다.

---

## 📂 프로젝트 구조 (Structure)

```text
.
├── Document/               # DB 스키마 및 초기 데이터 (chat.sql)
├── docs/                   # PRD 및 상세 설계 문서
├── scripts/                # 빌드 및 유틸리티 스크립트
├── src/main/java/          # 백엔드 자바 소스 (DBManager, DTO)
├── src/main/webapp/        # 프론트엔드 (JSP, JS, CSS, Libs)
├── tests/                  # Playwright E2E 테스트 스크립트
├── Dockerfile              # App 컨테이너 설정
└── docker-compose.yml      # 통합 인프라 설정
```

---

## 🛠️ 직접 빌드하기 (Manual Build)

Docker를 사용하지 않고 로컬 톰캣에 직접 배포하는 경우:

```bash
# Java 소스 컴파일
./scripts/build_java.sh

# 이후 생성된 build/classes 디렉토리 내용을 톰캣 WEB-INF/classes로 복사
```

---

## 📄 라이선스 (License)

이 프로젝트는 **MIT License**를 따릅니다. 교육용 목적으로 자유롭게 수정 및 배포가 가능합니다.

---

**Made with ❤️ by Antigravity IDE**
