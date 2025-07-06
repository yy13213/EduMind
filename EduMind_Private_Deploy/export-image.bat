@echo off
echo 正在导出EduMind私有化镜像...
echo.

echo 1. 导出Docker镜像
docker save yy13213/edumind:latest -o edumind-private.tar

echo.
echo 2. 压缩镜像文件
powershell -Command "Compress-Archive -Path 'edumind-private.tar' -DestinationPath 'edumind-private.zip' -Force"

echo.
echo 3. 清理临时文件
del edumind-private.tar

echo.
echo  镜像导出完成！
echo  文件: edumind-private.zip
echo  使用方法:
echo    1. 解压 edumind-private.zip
echo    2. 运行: docker load -i edumind-private.tar
echo    3. 运行: docker-compose up -d
echo.
pause
