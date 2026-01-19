# PRD: 프로젝트 정제 및 GitHub 배포 최적화

## 1. 개요
- **목적**: 프로젝트를 GitHub에 배포하기 위해 형상관리 대상을 정제하고, 교육용 미적 요소를 갖춘 문서(README)와 라이선스를 구축하여 완성도 높은 오픈소스 형태를 갖춤.
- **주요 전략**: "Clone & Run"이 가능한 수준의 자동화가 포함된 가이드 제공.

## 2. 상세 요구사항 (User Feedback 반영)

### 2.1 형상관리 (Git)
- `.gitignore` 구축:
  - Java 빌드 부산물 (`build/`, `.class`)
  - Node.js 종속성 (`node_modules/`)
  - 에이전트 부산물 (`.agent/`, `tests/failure_*.png`)
  - OS 전용 파일 (`.DS_Store`)
  - 시스템 로그 및 임시 파일

### 2.2 문서화 (Documentation)
- `README.md` 고도화:
  - 프리미엄 테크 뱃지 (Java 17, Tomcat 9, MySQL 8, Playwright, Tailwind CSS)
  - 프로젝트 소개 및 주요 리팩토링 포인트
  - **Docker 기반 5분 퀵스타트** 가이드 (매우 중요)
  - 폴더 구조 설명
- `LICENSE` 파일 도입: MIT License 기반의 교육용 라이선스 명시.

### 2.3 개발자 경험 (DX) 및 자동화
- `build.sh` (or `compile.sh`) 작성: `javac` 명령어를 자동화하여 교육생이 직접 컴파일할 때의 실수를 방지.
- Docker 빌드 과정 최적화 연계.

## 3. 수용 기준 (Acceptance Criteria)
1. 새로운 클론 환경에서 `docker-compose up`만으로 앱이 완벽히 구동됨(한글 포함).
2. `git status` 시 소스코드 본연의 파일 외에 쓰레기 파일이 없음.
3. `README.md`가 전문가 수준의 시각적 디자인과 구조를 가짐.

## 4. 우선순위
- **우선순위**: P1 (릴리즈 준비 단계)
