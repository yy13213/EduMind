# EduMind - 多模态大数据与生成式模型赋能高校学生全周期成长管理平台

<div align="center">
  <img src="WechatIMG52.jpg" alt="EduMind Logo" width="300"/>
  
  [![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/)
  [![Streamlit](https://img.shields.io/badge/Streamlit-1.43.2-red.svg)](https://streamlit.io/)
  [![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
  [![Status](https://img.shields.io/badge/Status-Active-brightgreen.svg)]()
</div>

## 📖 项目简介

EduMind是一个基于多模态大数据与生成式AI模型的高校学生全周期成长管理平台。该平台通过整合学生的学业数据、行为数据、心理数据等多维度信息，为高校提供智能化的学生管理和个性化成长指导服务。

## ✨ 核心功能

### 🎓 学业发展模块
- **学生学业分析**: 基于课程成绩、考勤记录、作业提交等数据进行学业表现分析
- **综合学业评估**: 多维度学业数据整合分析，提供个性化学习建议
- **降级预警系统**: 智能识别学业风险学生，提前预警并制定干预措施

### 🧠 心理特质模块
- **AI心理咨询**: 基于DeepSeek等大模型的智能心理咨询服务
- **心理问卷系统**: 包含SCL-90、MBTI、抑郁焦虑量表等专业心理测评工具
- **谈话记录分析**: 通过NLP技术分析学生谈话内容，识别心理状态
- **异常记录管理**: 记录和跟踪学生心理异常情况，及时干预

### 🏃 行为规律模块
- **校园行为数据**: 分析学生在校园内的行为模式和规律
- **行为规律分析**: 通过大数据分析学生的生活作息、消费习惯等
- **学生画像构建**: 基于多维度数据构建个性化学生画像

### 🌐 社交网络模块
- **线上活跃度分析**: 分析学生在线社交活动和网络行为
- **社交关系网络**: 构建学生社交关系图谱，识别社交孤立风险
- **总体活跃度监控**: 监控整体学生群体的线上活跃度趋势

### 📈 发展潜能模块
- **生涯规划助手**: AI驱动的个性化职业规划建议
- **职业规划测评**: 专业的职业倾向和能力评估工具
- **发展潜力分析**: 基于学生综合表现预测发展潜力

### 🔐 安全管理模块
- **宿舍安全监控**: 宿舍安全状况实时监控和预警
- **风险评估系统**: 多维度安全风险评估和预防

## 🚀 技术栈

- **前端框架**: Streamlit
- **数据处理**: Pandas, NumPy
- **数据可视化**: Plotly, Matplotlib, Seaborn
- **机器学习**: Scikit-learn
- **自然语言处理**: WordCloud, 文本分析
- **AI模型**: OpenAI API, DeepSeek API
- **文档处理**: python-docx, pdf2image
- **其他工具**: Faker (数据生成), Streamlit-extras (UI增强)

## 📦 安装指南

### 环境要求
- Python 3.8+
- pip 包管理器

### 安装步骤

1. **克隆项目**
```bash
git clone https://github.com/yy13213/EduMind.git
cd EduMind
```

2. **创建虚拟环境**
```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
# 或
venv\Scripts\activate  # Windows
```

3. **安装依赖**
```bash
pip install -r requirement.txt
```

4. **配置API密钥**
   - 在项目中配置OpenAI API密钥
   - 在项目中配置DeepSeek API密钥

5. **运行应用**
```bash
streamlit run app.py
```

## 🎯 使用指南

### 启动应用
运行以下命令启动EduMind平台：
```bash
streamlit run app.py
```

### 主要功能使用

1. **学业分析**: 
   - 进入"学业发展"模块
   - 选择具体学生或班级进行分析
   - 查看学业表现报告和预警信息

2. **心理评估**:
   - 进入"心理特质"模块
   - 选择相应的心理测评工具
   - 完成测评并查看分析结果

3. **行为分析**:
   - 进入"行为规律"模块
   - 查看学生行为数据和规律分析
   - 生成个性化学生画像

4. **AI咨询**:
   - 使用内置的AI心理咨询功能
   - 获取个性化的成长建议和规划

## 📊 数据结构

项目使用以下主要数据结构：

- **学生基础信息**: 姓名、学号、专业、年级等
- **学业数据**: 成绩、考勤、作业、图书借阅等
- **行为数据**: 校园活动、消费记录、作息规律等
- **心理数据**: 测评结果、咨询记录、情绪状态等
- **社交数据**: 线上活动、社交关系、参与度等

## 🔧 配置说明

### API配置
在相应的模块中配置以下API密钥：
- OpenAI API Key
- DeepSeek API Key

### 字体配置
项目使用仿宋_GB2312字体，确保字体文件`仿宋_GB2312.ttf`在项目根目录。

## 📈 功能特色

- **多模态数据融合**: 整合学业、行为、心理等多维度数据
- **AI智能分析**: 基于大模型的智能分析和建议
- **实时监控预警**: 实时监控学生状态，及时预警风险
- **个性化服务**: 为每个学生提供个性化的成长方案
- **可视化展示**: 丰富的图表和可视化展示
- **用户友好界面**: 基于Streamlit的现代化Web界面

## 🤝 贡献指南

欢迎贡献代码和提出改进建议！

1. Fork 项目
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 创建 Pull Request

## 📝 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 👥 团队

- **项目维护者**: [yy13213](https://github.com/yy13213)

## 📞 联系我们

如有问题或建议，请通过以下方式联系：

- GitHub Issues: [https://github.com/yy13213/EduMind/issues](https://github.com/yy13213/EduMind/issues)
- Email: [联系邮箱]

## 🎉 致谢

感谢所有为EduMind项目贡献代码和想法的开发者们！

---

<div align="center">
  <p>Made with ❤️ by EduMind Team</p>
  <p>© 2024 EduMind. All rights reserved.</p>
</div> 