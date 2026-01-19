FROM tomcat:9.0-jdk17-openjdk-slim

# 기존 ROOT 제거
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# 도커 빌드 시 context root를 ROOT로 고정 (또는 프로젝트명 chat_ajax로 설정 가능)
# 여기서는 ROOT로 설정하여 접속을 간편하게 함
WORKDIR /usr/local/tomcat/webapps/ROOT

# 1. 정적 파일 및 JSP 복사
COPY src/main/webapp/ ./

# 2. 컴파일된 클래스 파일 복사 (패키지 경로 ezen/...)
COPY build/classes/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

# 외부 라이브러리(Gson, MySQL Connector)는 이미 src/main/webapp/WEB-INF/lib에 포함되어 있음

EXPOSE 8080

CMD ["catalina.sh", "run", "-Dfile.encoding=UTF-8"]
