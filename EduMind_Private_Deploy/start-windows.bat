@echo off
chcp 65001 >nul
echo ========================================
echo    EduMind 私有化部署启动工具
echo ========================================
echo.

echo 正在检查系统环境...
echo.

REM 检查Docker是否安装
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker未安装或未启动
    echo 请先安装Docker Desktop: https://www.docker.com/products/docker-desktop
    pause
    exit /b 1
)
echo ✅ Docker已安装

REM 检查Docker Compose是否安装
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker Compose未安装
    pause
    exit /b 1
)
echo ✅ Docker Compose已安装

echo.
echo 正在检查端口8501是否可用...
netstat -an | findstr ":8501" >nul 2>&1
if %errorlevel% equ 0 (
    echo ⚠️ 端口8501可能被占用
    echo 如果启动失败，请关闭占用端口的程序
    echo.
)

echo 正在创建必要目录...
if not exist "data" mkdir data
if not exist "logs" mkdir logs
echo ✅ 目录创建完成

echo.
echo 正在检查环境变量配置...
if not exist ".env" (
    if exist "env.example" (
        echo 正在创建.env文件...
        copy env.example .env >nul
        echo ✅ .env文件创建完成
    ) else (
        echo 创建基础.env配置...
        echo OPENAI_API_KEY=your_openai_api_key_here > .env
        echo STREAMLIT_SERVER_HEADLESS=true >> .env
        echo STREAMLIT_SERVER_PORT=8501 >> .env
        echo STREAMLIT_SERVER_ADDRESS=0.0.0.0 >> .env
        echo ✅ 基础.env配置创建完成
    )
    echo.
    echo ⚠️ 请编辑.env文件，设置您的API密钥等配置
    echo.
)

echo ========================================
echo    开始启动EduMind服务
echo ========================================
echo.

echo 正在启动Docker容器...
docker-compose up -d

if %errorlevel% equ 0 (
    echo.
    echo ✅ EduMind服务启动成功！
    echo.
    echo 🌐 访问地址: http://127.0.0.1:8501
    echo 📊 查看状态: docker-compose ps
    echo 📋 查看日志: docker-compose logs -f
    echo 🛑 停止服务: docker-compose down
    echo.
    
    echo 正在检查服务状态...
    timeout /t 5 /nobreak >nul
    docker-compose ps
    
    echo.
    echo 🎉 部署完成！请在浏览器中访问 http://127.0.0.1:8501
    echo.
    
    REM 询问是否打开浏览器
    set /p open_browser="是否现在打开浏览器? (y/n): "
    if /i "%open_browser%"=="y" (
        start http://127.0.0.1:8501
    )
) else (
    echo.
    echo ❌ 服务启动失败
    echo 请检查Docker服务状态和端口占用情况
    echo 查看详细日志: docker-compose logs
    echo.
)

echo.
pause 