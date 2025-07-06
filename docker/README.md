# EduMind Docker 部署指南

## 📋 前置要求

- Docker
- Docker Compose

## 🚀 快速启动

### 1. 配置环境变量

```bash
# 复制环境变量模板
cp ../env.example ../.env

# 编辑 .env 文件，配置API密钥
# 至少需要配置：
# OPENAI_API_KEY=your_openai_api_key
# DEEPSEEK_API_KEY=your_deepseek_api_key
```

### 2. 启动服务

**Windows 用户：**
```bash
# 双击运行或在命令行执行
start.bat
```

**Linux/Mac 用户：**
```bash
# 给脚本执行权限
chmod +x start.sh
# 运行启动脚本
./start.sh
```

**手动启动：**
```bash
# 进入docker目录
cd docker

# 构建并启动
docker-compose up -d

# 查看日志
docker-compose logs -f

# 停止服务
docker-compose down
```

### 3. 访问应用

打开浏览器访问: **http://localhost:8501**

## 🔧 Docker 常用命令

```bash
# 查看运行状态
docker-compose ps

# 查看实时日志
docker-compose logs -f

# 重启服务
docker-compose restart

# 停止服务
docker-compose down

# 完全清理（包括数据卷）
docker-compose down -v

# 重新构建镜像
docker-compose build --no-cache

# 进入容器
docker-compose exec edumind bash
```

## 📁 目录结构

```
docker/
├── Dockerfile              # Docker镜像构建文件
├── docker-compose.yml      # Docker Compose配置
├── .dockerignore           # Docker忽略文件
├── start.sh               # Linux/Mac启动脚本
├── start.bat              # Windows启动脚本
└── README.md              # 本文档
```

## 🌐 端口配置

- **应用端口**: 8501
- **访问地址**: http://localhost:8501

## 📊 数据持久化

- **数据目录**: `../data` → `/app/data`
- **日志目录**: `../logs` → `/app/logs`

## 🔍 故障排除

### 1. 端口被占用
```bash
# 查看端口占用
netstat -an | grep 8501

# 修改端口（在docker-compose.yml中）
ports:
  - "8502:8501"  # 改为8502端口
```

### 2. 镜像构建失败
```bash
# 清理Docker缓存
docker system prune -a

# 重新构建
docker-compose build --no-cache
```

### 3. 服务启动失败
```bash
# 查看详细日志
docker-compose logs

# 检查容器状态
docker-compose ps
```

## 🛡️ 安全建议

1. **不要在生产环境中使用默认配置**
2. **及时更新API密钥**
3. **定期备份数据目录**
4. **监控容器资源使用情况**

## 📈 性能优化

1. **调整内存限制**：
```yaml
services:
  edumind:
    deploy:
      resources:
        limits:
          memory: 2G
        reservations:
          memory: 1G
```

2. **使用多阶段构建**：
```dockerfile
# 在Dockerfile中添加多阶段构建
FROM python:3.9-slim as builder
# ... 构建阶段

FROM python:3.9-slim as runtime
# ... 运行阶段
``` 