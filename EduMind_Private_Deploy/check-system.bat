@echo off
echo ========================================
echo    EduMind 私有化部署验证工具
echo ========================================
echo.

echo 1. 检查Docker服务状态...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo  Docker未安装或未启动
    pause
    exit /b 1
)
echo  Docker服务正常

echo.
echo 2. 检查Docker Compose...
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo  Docker Compose未安装
    pause
    exit /b 1
)
echo  Docker Compose正常

echo.
echo 3. 检查端口8501是否可用...
netstat -an | findstr ":8501" >nul 2>&1
if %errorlevel% equ 0 (
    echo  端口8501可能被占用
    echo 请检查并关闭占用端口的程序
) else (
    echo  端口8501可用
)

echo.
echo 4. 检查镜像是否存在...
docker images | findstr "yy13213/edumind" >nul 2>&1
if %errorlevel% neq 0 (
    echo  镜像不存在，首次运行会自动下载
) else (
    echo  镜像已存在
)

echo.
echo 5. 创建必要目录...
if not exist "data" mkdir data
if not exist "logs" mkdir logs
echo  目录创建完成

echo.
echo ========================================
echo    系统检查完成！
echo ========================================
echo.
echo 现在可以运行以下命令启动服务：
echo   docker-compose up -d
echo.
echo 或者直接运行启动脚本：
echo   start.bat
echo.
pause
