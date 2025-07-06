#!/bin/bash

# EduMind Docker 启动脚本

echo "🚀 启动 EduMind Docker 容器..."

# 检查Docker是否安装
if ! command -v docker &> /dev/null; then
    echo "❌ Docker 未安装，请先安装 Docker"
    exit 1
fi

# 检查Docker Compose是否安装
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose 未安装，请先安装 Docker Compose"
    exit 1
fi

# 进入docker目录
cd "$(dirname "$0")"

# 创建必要的目录
mkdir -p ../data ../logs

# 检查并创建环境变量文件
if [ ! -f "../.env" ]; then
    echo "🔧 未找到 .env 文件，正在创建默认配置..."
    if [ -f "../env.example" ]; then
        cp ../env.example ../.env
        echo "✅ 已创建默认 .env 文件"
        echo "💡 如需配置 API 密钥，请编辑 .env 文件"
    else
        echo "⚠️ 未找到 env.example 文件，创建基础配置..."
        cat > ../.env << 'EOF'
# EduMind Docker 基础配置
STREAMLIT_SERVER_HEADLESS=true
STREAMLIT_SERVER_PORT=8501
STREAMLIT_SERVER_ADDRESS=0.0.0.0
APP_ENV=development
LOG_LEVEL=INFO
SECRET_KEY=edumind_default_secret_key
EOF
        echo "✅ 已创建基础 .env 文件"
    fi
else
    echo "✅ 找到现有 .env 文件"
fi

# 构建并启动容器
echo "🔨 构建 Docker 镜像..."
docker-compose build

echo "🌟 启动服务..."
docker-compose up -d

# 等待服务启动
echo "⏳ 等待服务启动..."
sleep 10

# 检查服务状态
if docker-compose ps | grep -q "Up"; then
    echo "✅ EduMind 启动成功！"
    echo "🌐 访问地址: http://127.0.0.1:8501"
    echo "📊 查看日志: docker-compose logs -f"
    echo "🛑 停止服务: docker-compose down"
    echo ""
    echo "💡 提示: 如需配置 OpenAI API 密钥，请编辑 .env 文件"
else
    echo "❌ 服务启动失败，请检查日志:"
    docker-compose logs
fi 