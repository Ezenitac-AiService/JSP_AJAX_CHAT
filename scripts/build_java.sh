#!/bin/bash

# 프로젝트 루트 디렉토리 설정
PROJECT_ROOT=$(pwd)
SRC_DIR="$PROJECT_ROOT/src/main/java"
LIB_DIR="$PROJECT_ROOT/src/main/webapp/WEB-INF/lib"
BUILD_DIR="$PROJECT_ROOT/build/classes"

echo "🚀 Java 컴파일을 시작합니다..."

# 빌드 디렉토리 생성
mkdir -p "$BUILD_DIR"

# 컴파일 실행 (Java 17 타겟)
javac -d "$BUILD_DIR" \
      -cp "$LIB_DIR/*:$BUILD_DIR:." \
      --release 17 \
      "$SRC_DIR"/ezen/*.java

if [ $? -eq 0 ]; then
    echo "✅ 컴파일 성공: $BUILD_DIR"
else
    echo "❌ 컴파일 실패!"
    exit 1
fi
