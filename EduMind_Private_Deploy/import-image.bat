@echo off
chcp 65001 >nul
echo 正在导入EduMind私有化镜像...
echo.

REM 检查是否有zip文件
if exist "edumind-private.zip" (
    echo 🔍 发现压缩镜像文件 edumind-private.zip
    echo 📦 正在解压镜像文件...
    powershell -Command "Expand-Archive -Path 'edumind-private.zip' -DestinationPath '.' -Force"
    if %errorlevel% neq 0 (
        echo ❌ 解压失败
        pause
        exit /b 1
    )
    echo ✅ 解压完成
    echo.
)

REM 检查tar文件
if not exist "edumind-private.tar" (
    echo ❌ 找不到镜像文件 edumind-private.tar
    echo.
    echo 💡 请确保以下文件之一存在：
    echo    - edumind-private.zip (推荐)
    echo    - edumind-private.tar
    echo.
    pause
    exit /b 1
)

echo 🐳 正在导入Docker镜像...
docker load -i edumind-private.tar

if %errorlevel% neq 0 (
    echo ❌ 镜像导入失败
    echo 请检查Docker服务状态
    pause
    exit /b 1
)

echo.
echo 🔍 验证镜像导入...
docker images | findstr "yy13213/edumind"

if %errorlevel% neq 0 (
    echo ❌ 镜像验证失败
    pause
    exit /b 1
)

echo.
echo ✅ 镜像导入完成！
echo.
echo 📊 镜像信息：
docker images yy13213/edumind:latest

echo.
echo 🚀 接下来可以：
echo   1. 运行一键部署: 一键部署.bat
echo   2. 使用Docker Compose: docker-compose up -d
echo   3. 手动运行容器: docker run -d -p 127.0.0.1:8501:8501 yy13213/edumind:latest
echo.

REM 询问是否清理临时文件
choice /c YN /m "是否删除临时文件 edumind-private.tar"
if not errorlevel 2 (
    del edumind-private.tar
    echo ✅ 临时文件已清理
)

echo.
pause
