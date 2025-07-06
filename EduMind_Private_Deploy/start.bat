@echo off
chcp 65001 >nul
echo 🚀 启动 EduMind Docker 容器...

REM 检查Docker是否安装
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker 未安装，请先安装 Docker Desktop
    pause
    exit /b 1
)

REM 检查Docker Compose是否可用
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker Compose 未安装，请先安装 Docker Compose
    pause
    exit /b 1
)

REM 进入docker目录
cd /d %~dp0

REM 创建必要的目录
if not exist "..\data" mkdir ..\data
if not exist "..\logs" mkdir ..\logs

REM 检查并创建环境变量文件
if not exist "..\.env" (
    echo 🔧 未找到 .env 文件，正在创建默认配置...
    if exist "..\env.example" (
        copy "..\env.example" "..\.env" >nul
        echo ✅ 已创建默认 .env 文件
        echo 💡 如需配置 API 密钥，请编辑 .env 文件
    ) else (
        echo ⚠️ 未找到 env.example 文件，创建基础配置...
        (
            echo # EduMind Docker 基础配置
            echo STREAMLIT_SERVER_HEADLESS=true
            echo STREAMLIT_SERVER_PORT=8501
            echo STREAMLIT_SERVER_ADDRESS=0.0.0.0
            echo APP_ENV=development
            echo LOG_LEVEL=INFO
            echo SECRET_KEY=edumind_default_secret_key
        ) > "..\.env"
        echo ✅ 已创建基础 .env 文件
    )
) else (
    echo ✅ 找到现有 .env 文件
)

REM 构建并启动容器
echo 🔨 构建 Docker 镜像...
docker-compose build

echo 🌟 启动服务...
docker-compose up -d

REM 等待服务启动
echo ⏳ 等待服务启动...
timeout /t 10 /nobreak >nul

REM 检查服务状态
docker-compose ps | findstr "Up" >nul
if %errorlevel% equ 0 (
    echo ✅ EduMind 启动成功！
    echo 🌐 访问地址: http://127.0.0.1:8501
    echo 📊 查看日志: docker-compose logs -f
    echo 🛑 停止服务: docker-compose down
    echo.
    echo 💡 提示: 如需配置 OpenAI API 密钥，请编辑 .env 文件
) else (
    echo ❌ 服务启动失败，请检查日志:
    docker-compose logs
)

pause 