# EduMind 私有化部署指南

##  私有化部署说明

本部署包使用预构建的Docker镜像，包含完整的EduMind应用，但不暴露源代码。

##  快速部署

### 方法1：使用启动脚本

**Windows用户：**
`cmd
start.bat
`

**Linux/Mac用户：**
`ash
chmod +x start.sh
./start.sh
`

### 方法2：手动部署

`ash
# 创建数据目录
mkdir -p data logs

# 启动服务
docker-compose up -d

# 查看状态
docker-compose ps
`

##  访问应用

部署成功后，访问：http://127.0.0.1:8501

##  服务管理

`ash
# 查看日志
docker-compose logs -f

# 停止服务
docker-compose down

# 重启服务
docker-compose restart
`

##  配置说明

- **端口**: 127.0.0.1:8501 (仅本地访问)
- **数据持久化**: ./data 目录
- **日志**: ./logs 目录
- **镜像**: yy13213/edumind:latest

##  注意事项

1. 确保Docker和Docker Compose已安装
2. 确保8501端口未被占用
3. 首次运行会自动下载镜像
4. 数据和日志会保存在本地目录

##  故障排除

如果遇到问题：
1. 检查Docker服务是否运行
2. 检查端口是否被占用
3. 查看容器日志：docker-compose logs
4. 重新构建：docker-compose build --no-cache

---
*EduMind 私有化部署版本 - 保护您的代码隐私*
