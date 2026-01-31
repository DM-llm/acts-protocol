# ACTS 协议模板

> 快速开始使用 ACTS 协议的模板文件和示例

---

## 📦 包含内容

### 核心配置文件（示例）
- `AGENTS.md` - 完整的协议定义（复制到项目根目录）
- `CLAUDE.md` - Claude 专用配置（可选）
- `SYS_PROMPT.md` - 通用系统提示词（复制粘贴到 AI 设置）

### Context 目录结构
```
context/
├── current-task.md          # 任务中心模板
├── steering/                # 项目特定规则
│   ├── project.md
│   ├── debugging.md
│   ├── language.md
│   └── pr-docs.md
└── docs/
    └── INDEX.md             # 文档索引模板
```

---

## 🚀 快速开始

### 方式 1：使用初始化脚本（推荐）

```bash
# 1. 克隆 ACTS 协议仓库
git clone https://github.com/yourusername/acts-protocol.git

# 2. 进入你的项目目录
cd your-project

# 3. 运行初始化脚本
bash /path/to/acts-protocol/scripts/init.sh
```

脚本会自动：
- 创建 `context/` 目录结构
- 从 templates/ 复制所有配置文件
- 创建初始的 `current-task.md` 和索引文件

### 方式 2：手动复制

```bash
# 1. 复制核心配置
cp acts-protocol/templates/AGENTS.md your-project/
cp acts-protocol/templates/SYS_PROMPT.md your-project/

# 2. 创建 context 目录
mkdir -p your-project/context/{docs,steering,reviews}

# 3. 复制模板文件
cp -r acts-protocol/templates/context/* your-project/context/

# 4. 创建模块目录
mkdir -p your-project/context/docs/{前端,后端,AI层,全栈,lessons}
```

---

## ⚙️ 配置步骤

### 1. 编辑项目信息

编辑 `context/steering/project.md`：
- 填写项目名称和描述
- 填写技术栈
- 填写目录结构
- 填写团队成员

### 2. 配置调试信息

编辑 `context/steering/debugging.md`：
- 填写服务启动命令
- 填写端口信息
- 填写常见问题和解决方案

### 3. 设置语言偏好

编辑 `context/steering/language.md`：
- 选择主要语言（中文/English）
- 设置代码注释语言
- 设置文档语言

### 4. 配置 PR 规范

编辑 `context/steering/pr-docs.md`：
- 根据团队习惯调整 PR 模板
- 添加团队特定的检查项

---

## 📝 开始使用

### 1. 告诉 AI

在 AI 对话中说：
> "我已经设置好 ACTS 协议，请阅读 AGENTS.md 和 context/current-task.md 开始工作。"

### 2. 创建第一个任务

编辑 `context/current-task.md`，添加你的第一个任务。

### 3. 创建功能文档

当开始新功能时：
```bash
# 创建功能目录
mkdir -p context/docs/前端/用户认证

# 创建架构文档
touch context/docs/前端/用户认证/01-架构设计.md

# 创建 work-logs 目录
mkdir -p context/docs/前端/用户认证/work-logs
```

### 4. 更新索引

在 `context/docs/INDEX.md` 中添加新功能的索引。

---

## 📚 模板说明

### AGENTS.md
- **用途**：AI 协议定义，AI 首先读取的文件
- **位置**：必须在项目根目录
- **修改**：可以根据项目需求调整规则

### current-task.md
- **用途**：追踪 1-3 个当前任务
- **更新频率**：频繁（开始/完成任务时）
- **保持简洁**：只保留当前任务，详细内容用指针

### INDEX.md
- **用途**：文档索引，快速定位
- **更新时机**：新增功能时
- **保持同步**：确保索引和实际文档一致

### steering/*.md
- **用途**：项目特定规则
- **修改**：根据项目实际情况填写
- **保持更新**：项目变化时及时更新

---

## 🎯 最佳实践

### 目录组织
- 按功能组织，不按时间
- work-logs 放在功能文件夹里
- lessons 放在全局，跨模块复用

### 文档编写
- 保持简洁，使用指针引用
- 及时更新索引
- 永久保留 work-logs 和 lessons

### 团队协作
- 统一使用 ACTS 协议
- 定期 Review 文档结构
- 分享经验教训

---

## 🔧 自定义

### 添加新模块

1. 创建模块目录：
```bash
mkdir -p context/docs/新模块
```

2. 创建模块索引：
```bash
touch context/docs/新模块/INDEX.md
```

3. 更新总索引：
编辑 `context/docs/INDEX.md`，添加新模块

### 调整规则

根据团队需求，可以修改：
- `AGENTS.md` 中的核心原则
- `steering/` 中的项目规则
- 文档组织结构

---

## 📖 更多资源

- [完整文档](../docs/)
- [示例项目](../examples/)
- [STRUCTURE.md](../STRUCTURE.md) - 详细的目录结构说明
- [README.md](../README.md) - 项目介绍

---

## 💡 提示

- 初始化后，先配置 `steering/` 中的文件
- 开始第一个任务前，先熟悉文档结构
- 遇到问题，查看 `STRUCTURE.md` 了解完整结构
- 使用 SYS_PROMPT.md 快速激活 AI 协议
