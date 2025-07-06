# EduMind Docker 部署指南

本目录包含EduMind应用的Docker配置文件，支持一键部署。

## 📁 文件说明

- `Dockerfile` - Docker镜像构建文件
- `docker-compose.yml` - Docker Compose服务编排文件
- `.dockerignore` - Docker构建忽略文件
- `start.sh` - Linux/Mac启动脚本
- `start.bat` - Windows启动脚本
- `README.md` - 本说明文档

## 🚀 快速开始

### 1. 准备工作

确保已安装Docker和Docker Compose：

```bash
# 检查Docker版本
docker --version
docker-compose --version
```

### 2. 启动服务

#### 快速启动

```bash
cd docker
docker-compose up -d
```

### 3. 访问应用

服务启动后，打开浏览器访问：
- **本地访问**: http://127.0.0.1:8501

## 📊 服务管理

### 查看服务状态
```bash
docker-compose ps
```

### 查看实时日志
```bash
docker-compose logs -f
```

### 停止服务
```bash
docker-compose down
```

### 重启服务
```bash
docker-compose restart
```

### 重建镜像（代码更新后）
```bash
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

## 🔧 配置说明

### 端口配置
- **应用端口**: 8501
- **访问地址**: 127.0.0.1:8501（仅本地访问）

### 数据持久化
- `./data` - 应用数据目录
- `./logs` - 应用日志目录

### 环境变量
- `STREAMLIT_SERVER_HEADLESS=true` - 无头模式运行
- `STREAMLIT_SERVER_PORT=8501` - 服务端口
- `STREAMLIT_SERVER_ADDRESS=0.0.0.0` - 监听地址

## 🛠️ 故障排除

### 常见问题

1. **端口占用**
   ```bash
   netstat -ano | findstr :8501  # Windows
   lsof -i :8501                 # Linux/Mac
   ```

2. **容器无法启动**
   ```bash
   docker-compose logs edumind
   ```

3. **权限问题**
   ```bash
   # Linux/Mac
   sudo chown -R $USER:$USER ./data ./logs
   ```

4. **重新构建**
   ```bash
   docker-compose down
   docker-compose build --no-cache
   docker-compose up -d
   ```

### 健康检查

容器包含健康检查机制：
- 检查间隔：30秒
- 超时时间：10秒
- 重试次数：3次
- 启动等待：40秒

## 📝 注意事项

1. **本地访问**: 应用绑定到127.0.0.1，只能本地访问
2. **数据备份**: 定期备份data和logs目录
3. **性能监控**: 通过`docker stats`监控资源使用
4. **日志管理**: 定期清理日志文件避免磁盘占满

## 🆘 技术支持

如遇问题，请检查：
1. Docker服务是否正常运行
2. 端口8501是否被占用
3. 磁盘空间是否充足
4. 查看容器日志获取详细错误信息 