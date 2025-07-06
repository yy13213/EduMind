@echo off
chcp 65001 >nul
title EduMind 一键部署工具
color 0A

echo.
echo     ██████╗ ██████╗ ██╗   ██╗███╗   ███╗██╗███╗   ██╗██████╗ 
echo     ██╔══██╗██╔══██╗██║   ██║████╗ ████║██║████╗  ██║██╔══██╗
echo     ██████╔╝██║  ██║██║   ██║██╔████╔██║██║██╔██╗ ██║██║  ██║
echo     ██╔══██╗██║  ██║██║   ██║██║╚██╔╝██║██║██║╚██╗██║██║  ██║
echo     ██████╔╝██████╔╝╚██████╔╝██║ ╚═╝ ██║██║██║ ╚████║██████╔╝
echo     ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝ 
echo.
echo     ========================================================
echo                    EduMind 私有化部署 - 一键部署工具
echo                        多模态大数据与生成式AI平台
echo     ========================================================
echo.

echo [1/6] 正在检查系统环境...
echo.

REM 检查管理员权限
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️ 建议以管理员身份运行此脚本
    echo.
)

REM 检查Docker
echo 🔍 检查Docker安装状态...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker未安装
    echo.
    echo 📥 正在打开Docker下载页面...
    start https://www.docker.com/products/docker-desktop
    echo.
    echo ⚠️ 请先安装Docker Desktop，然后重新运行此脚本
    pause
    exit /b 1
)
echo ✅ Docker已安装

REM 检查Docker Compose
echo 🔍 检查Docker Compose...
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker Compose未安装
    pause
    exit /b 1
)
echo ✅ Docker Compose已安装

echo.
echo [2/6] 正在检查网络和端口...
echo.

REM 检查网络连接
ping -n 1 www.baidu.com >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️ 网络连接可能有问题，但继续部署...
) else (
    echo ✅ 网络连接正常
)

REM 检查端口
echo 🔍 检查端口8501...
netstat -an | findstr ":8501" >nul 2>&1
if %errorlevel% equ 0 (
    echo ⚠️ 端口8501被占用，可能影响部署
    echo.
    choice /c YN /m "是否继续部署"
    if errorlevel 2 exit /b 1
) else (
    echo ✅ 端口8501可用
)

echo.
echo [3/6] 正在准备部署环境...
echo.

REM 创建目录
echo 📁 创建必要目录...
if not exist "data" mkdir data
if not exist "logs" mkdir logs
echo ✅ 目录创建完成

REM 环境变量配置
echo 🔧 配置环境变量...
if not exist ".env" (
    if exist "env.example" (
        copy env.example .env >nul
        echo ✅ 从模板创建.env文件
    ) else (
        echo # EduMind 配置文件 > .env
        echo OPENAI_API_KEY=your_openai_api_key_here >> .env
        echo STREAMLIT_SERVER_HEADLESS=true >> .env
        echo STREAMLIT_SERVER_PORT=8501 >> .env
        echo STREAMLIT_SERVER_ADDRESS=0.0.0.0 >> .env
        echo ✅ 创建基础.env配置
    )
    echo.
    echo ⚠️ 请稍后编辑.env文件，设置您的API密钥
    echo.
) else (
    echo ✅ .env文件已存在
)

echo.
echo [4/6] 正在下载Docker镜像...
echo.

echo 🐳 正在拉取EduMind镜像...
docker pull yy13213/edumind:latest
if %errorlevel% neq 0 (
    echo ⚠️ 镜像下载失败，将尝试本地构建...
    echo.
)

echo.
echo [5/6] 正在启动EduMind服务...
echo.

echo 🚀 启动Docker容器...
docker-compose up -d

if %errorlevel% equ 0 (
    echo ✅ 服务启动成功！
    
    echo.
    echo 🕐 等待服务完全启动...
    timeout /t 10 /nobreak >nul
    
    echo.
    echo [6/6] 正在验证部署...
    echo.
    
    docker-compose ps
    
    echo.
    echo ========================================================
    echo                    🎉 部署完成！
    echo ========================================================
    echo.
    echo 📱 访问地址: http://127.0.0.1:8501
    echo 📊 查看状态: docker-compose ps
    echo 📋 查看日志: docker-compose logs -f
    echo 🛑 停止服务: docker-compose down
    echo 🔄 重启服务: docker-compose restart
    echo.
    echo ========================================================
    echo.
    
    choice /c YN /m "是否现在打开浏览器访问EduMind"
    if not errorlevel 2 (
        echo 🌐 正在打开浏览器...
        start http://127.0.0.1:8501
    )
    
    echo.
    echo ✨ 感谢使用EduMind！
    echo 📧 技术支持: https://github.com/yy13213/EduMind
    echo.
    
) else (
    echo.
    echo ❌ 服务启动失败
    echo.
    echo 🔍 常见解决方案:
    echo   1. 检查Docker服务是否正常运行
    echo   2. 检查端口8501是否被占用
    echo   3. 查看详细日志: docker-compose logs
    echo   4. 重新构建: docker-compose build --no-cache
    echo.
    echo 📧 获取帮助: https://github.com/yy13213/EduMind/issues
    echo.
)

echo.
pause 