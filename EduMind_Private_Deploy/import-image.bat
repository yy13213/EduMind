@echo off
echo 正在导入EduMind私有化镜像...
echo.

if not exist "edumind-private.tar" (
    echo  找不到镜像文件 edumind-private.tar
    echo 请先解压 edumind-private.zip
    pause
    exit /b 1
)

echo 1. 导入Docker镜像
docker load -i edumind-private.tar

echo.
echo 2. 验证镜像
docker images | findstr "yy13213/edumind"

echo.
echo  镜像导入完成！
echo  现在可以运行: docker-compose up -d
echo.
pause
