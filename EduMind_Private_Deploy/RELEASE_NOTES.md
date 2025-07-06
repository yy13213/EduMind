# 🚀 EduMind Docker镜像发布说明

## 📦 发布信息

- **版本**: v1.0.0
- **发布日期**: 2025-07-07
- **镜像名称**: yy13213/edumind:latest
- **镜像大小**: 1.13GB (压缩后 357MB)

## 🎯 镜像特性

### 核心功能
- **多模态数据处理**: 支持文本、图像、语音等多种数据类型
- **生成式AI集成**: 内置OpenAI API支持，提供智能对话和内容生成
- **学生成长管理**: 完整的学生全周期成长管理系统
- **数据可视化**: 丰富的图表和可视化组件
- **报告生成**: 自动化报告生成和导出功能

### 技术栈
- **Python 3.9**: 稳定的运行环境
- **Streamlit 1.46.1**: 现代化Web应用框架
- **科学计算包**: NumPy, Pandas, Matplotlib, Seaborn
- **AI/ML包**: OpenAI, Faker等智能处理工具
- **可视化组件**: Plotly, PyEcharts, WordCloud等
- **文档处理**: PDF, Word, Excel处理能力

## 📋 系统要求

- **操作系统**: Windows 10/11, Linux, macOS
- **Docker**: 20.10.0 或更高版本
- **内存**: 至少 2GB 可用内存
- **存储**: 至少 2GB 可用磁盘空间
- **网络**: 首次运行需要网络连接（用于API调用）

## 🚀 快速开始

### 方法1：在线拉取（推荐）
```bash
# 拉取镜像
docker pull yy13213/edumind:latest

# 运行容器
docker run -d -p 127.0.0.1:8501:8501 --name edumind yy13213/edumind:latest

# 访问应用
# 打开浏览器访问: http://127.0.0.1:8501
```

### 方法2：离线镜像部署
```bash
# 下载 edumind-private.zip (357MB)
# 解压得到 edumind-private.tar

# 导入镜像
docker load -i edumind-private.tar

# 运行容器
docker run -d -p 127.0.0.1:8501:8501 --name edumind yy13213/edumind:latest
```

### 方法3：使用Docker Compose
```bash
# 下载配置文件
# 运行服务
docker-compose up -d
```

## 🔧 配置说明

### 环境变量
- `OPENAI_API_KEY`: OpenAI API密钥（必需）
- `STREAMLIT_SERVER_PORT`: 服务端口（默认8501）
- `STREAMLIT_SERVER_ADDRESS`: 绑定地址（默认0.0.0.0）

### 数据持久化
- `/app/data`: 数据存储目录
- `/app/logs`: 日志文件目录
- `/app/uploads`: 文件上传目录

## 🛠️ 部署工具

本发布包含以下部署工具：

1. **一键部署.bat**: Windows系统一键部署工具
2. **start-windows.bat**: Windows启动脚本
3. **start.sh**: Linux/Mac启动脚本
4. **import-image.bat**: 镜像导入工具
5. **check-system.bat**: 系统环境检查工具

## 📊 性能特性

- **启动时间**: 通常在30秒内完成启动
- **内存使用**: 运行时占用约1-2GB内存
- **并发支持**: 支持多用户同时访问
- **响应速度**: 页面加载时间<2秒

## 🔒 安全特性

- **本地绑定**: 默认仅绑定127.0.0.1，不暴露到公网
- **数据隔离**: 容器化运行，数据隔离安全
- **API安全**: 支持API密钥认证
- **日志记录**: 完整的操作日志记录

## 🚨 已知问题

1. **首次启动**: 首次启动可能需要较长时间下载依赖
2. **内存需求**: 建议至少2GB可用内存
3. **网络需求**: AI功能需要网络连接

## 📞 技术支持

- **项目主页**: https://github.com/yy13213/EduMind
- **问题反馈**: https://github.com/yy13213/EduMind/issues
- **使用文档**: 查看项目README.md

## 📋 更新日志

### v1.0.0 (2025-07-07)
- 🎉 首次发布Docker镜像
- ✨ 完整的学生成长管理系统
- 🔧 多模态数据处理能力
- 🤖 生成式AI集成
- 📊 丰富的数据可视化
- 🛠️ 完善的部署工具集
- 📚 详细的使用文档

---

**🎉 感谢使用EduMind！**

如有问题或建议，欢迎通过GitHub Issues联系我们。 