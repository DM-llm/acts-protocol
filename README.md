# ACTS 协议

> **Agent Context Tree Standard**  
> A feature-first context protocol for AI Agents  
> 一个以功能为中心的 AI Agent 上下文管理标准

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-1.0-blue.svg)](https://github.com/yourusername/acts-protocol)

**⚡ 一分钟激活**：复制 `SYS_PROMPT.md` → 粘贴到 AI 设置 → 开始编码

---

## 什么是 ACTS？

ACTS（Agent Context Tree Standard）是一个以功能为中心的 AI Agent 上下文管理标准，帮助 AI 助手理解项目结构、遵循团队规范、维护长期知识。

**核心理念**：
- 🌳 **Tree Structure**：功能内聚的树状组织
- 🎯 **Feature-First**：按功能而非时间组织文档
- 🧠 **Long-term Memory**：结构化的知识积累
- 🤖 **Agent-Friendly**：为 AI Agent 优化的协议

### 问题

在使用 AI 助手进行软件开发时：
- 🤔 AI 不理解你的项目规范
- 📚 知识在对话间丢失
- 🔄 上下文切换很痛苦
- 🎯 AI 生成的代码不符合你的架构
- 👥 团队成员重复相同的解释

### 解决方案

ACTS 提供：
- 📋 **标准化协议**让 AI 理解你的项目
- 🧠 **长期记忆**通过结构化文档
- 🎯 **任务聚焦工作流**清晰的上下文
- 📚 **知识积累**（经验教训、工作日志、架构文档）
- 🤝 **团队协作**共享规范

---

## ⚡ 快速开始（一分钟激活）

### 方式 1：使用初始化脚本（推荐）

**适用于**：任何项目

```bash
# 1. 克隆 ACTS 协议仓库
git clone https://github.com/yourusername/acts-protocol.git

# 2. 进入你的项目目录
cd your-project

# 3. 运行初始化脚本
bash /path/to/acts-protocol/scripts/init.sh
```

**脚本会自动**：
- 创建 `context/` 目录结构
- 从 templates/ 复制所有配置文件到你的项目
- 创建初始的 `current-task.md` 和索引文件

**跨平台支持**：
- Windows：使用 Git Bash（Git for Windows 自带）
- macOS/Linux：原生支持

### 方式 2：手动复制（灵活）

```bash
# 1. 复制核心配置文件
cp acts-protocol/templates/AGENTS.md your-project/
cp acts-protocol/templates/SYS_PROMPT.md your-project/

# 2. 创建 context 目录
mkdir -p your-project/context/{docs,steering,reviews}

# 3. 复制 context 模板
cp -r acts-protocol/templates/context/* your-project/context/

# 4. 创建模块目录
mkdir -p your-project/context/docs/{前端,后端,AI层,全栈,lessons}
```

### 方式 3：配置 AI 助手

**复制系统提示词**（适用于 Cursor、Windsurf、ChatGPT）：

1. 打开 `templates/SYS_PROMPT.md`
2. 全选复制（Ctrl+A, Ctrl+C）
3. 粘贴到 AI 设置：
   - **Cursor**: Settings → General → Rules for AI
   - **Windsurf**: Settings → AI Rules
   - **ChatGPT**: Settings → Custom Instructions

**Claude 原生支持**：

Claude Desktop 会自动读取项目根目录的 `AGENTS.md`，无需额外配置。

---

## 核心概念

### 1. 配置 vs 数据

```
根目录（配置）
├── AGENTS.md          # 协议定义（AI 首先读取）
├── CLAUDE.md          # Claude 专用设置
└── context/           # 数据（项目的记忆）
    ├── current-task.md
    ├── docs/
    ├── work-logs/
    └── lessons/
```

**为什么在根目录？**
- AI 工具默认扫描根目录
- 清晰分离：配置（根目录）vs 数据（context/）
- 直观：用户立即看到 AGENTS.md

### 2. 两层规则系统

```
L1: 项目规则（AGENTS.md）
    ↓
L2: 模块规则（context/steering/）
```

### 3. 文档类型

| 类型 | 位置 | 用途 | 保留 |
|------|------|------|------|
| **任务中心** | `context/current-task.md` | 追踪 1-3 个当前任务 | 频繁更新 |
| **文档** | `context/docs/{模块}/{功能}/` | 架构、API 文档 | 长期 |
| **工作日志** | `context/docs/{模块}/{功能}/work-logs/` | 实现记录（功能内聚） | 永久 |
| **经验教训** | `context/docs/lessons/` | 需要避免的错误（全局共享） | 永久 |

**功能内聚原则**：
- 工作日志放在功能文件夹里，和功能文档在一起
- 方便查找：看某个功能时，所有相关内容都在一起
- 自然沉淀：从 work-logs 提炼到功能文档更直观
- 跨模块任务：放在 `docs/全栈/work-logs/`

**Work Log 命名规范**：
- 格式：`YYYY-MM-DD-{TYPE}-{DESCRIPTION}.md`
- 类型：
  - `impl` - 新功能开发或改进
  - `fix` - Bug 修复（最重要的反面教材）
  - `pr` - PR 评审反馈（团队强制规范）
  - `refactor` - 代码重构（功能不变）
- 示例：
  - `2026-02-01-impl-user-login.md`
  - `2026-02-02-fix-token-timeout.md`
  - `2026-02-03-pr-review-security.md`
  - `2026-02-04-refactor-split-service.md`

### 4. Lessons 写保护 🚫

**关键规则**：AI 不能自动创建 lessons。

Lessons 只在以下情况创建：
1. 用户明确说"把这个记下来"
2. AI 询问"是否应该记录？"并得到用户确认

**为什么？**只有人类知道什么是真正痛苦的。AI 可能会将琐碎问题记录为"lessons"，污染你的知识库。

---

## 特性

### ✅ 架构优先方法
- 编码前考虑整体设计
- 评估对现有模块的影响
- 遵循既定模式

### ✅ 解释一切
- 为什么这样做？
- 有哪些替代方案？
- 可能出什么问题？

### ✅ 搜索后行动
- 检查现有文档
- 从过去的错误中学习
- 不要重新发明轮子

### ✅ 智能上下文加载
- 懒加载（只加载需要的）
- 智能搜索（时间加权 + 关键词匹配）
- 避免重复

### ✅ 长期知识
- 工作日志：完整实现历史（功能内聚）
- 经验教训：精选洞察（全局共享，用户控制）
- 文档：架构和设计决策

**功能内聚的优势**：
- 查看功能时，文档和历史都在一起
- 从工作日志沉淀到文档更自然
- 减少目录跳转，提高效率

---

## 项目结构

### 最小设置

```
your-project/
├── AGENTS.md              # 必需：协议定义（AI 原生读取）
├── SYS_PROMPT.md          # 可选：通用系统提示词（复制粘贴用）
├── context/
│   ├── current-task.md    # 必需：当前焦点
│   └── docs/
│       ├── INDEX.md       # 必需：文档索引
│       ├── lessons/       # 推荐：全局经验教训
│       └── 前端/          # 示例：功能模块
│           └── 某功能/
│               ├── 01-架构.md
│               └── work-logs/  # 推荐：功能的工作日志
└── src/                   # 你的代码
```

### 完整设置

```
your-project/
├── AGENTS.md              # 协议定义（AI 原生读取）
├── CLAUDE.md              # Claude 专用设置（可选）
├── SYS_PROMPT.md          # 通用系统提示词（复制粘贴用）
├── context/
│   ├── current-task.md    # 任务中心
│   ├── steering/          # 项目特定规则
│   │   ├── project.md
│   │   ├── debugging.md
│   │   ├── language.md
│   │   └── pr-docs.md
│   ├── docs/              # 技术文档（按功能聚合）
│   │   ├── INDEX.md
│   │   ├── lessons/       # 全局经验教训
│   │   ├── 前端/
│   │   │   ├── INDEX.md
│   │   │   ├── 用户认证/
│   │   │   │   ├── 01-架构设计.md
│   │   │   │   └── work-logs/
│   │   │   │       └── 2026-01-26-登录流程优化.md
│   │   │   └── 数据展示/
│   │   │       ├── 01-表格组件.md
│   │   │       └── work-logs/
│   │   ├── 后端/
│   │   ├── AI层/
│   │   └── 全栈/          # 跨模块内容
│   │       ├── INDEX.md
│   │       ├── API集成/
│   │       │   ├── 01-接口设计.md
│   │       │   └── work-logs/
│   │       │       └── 2026-01-29-第三方API对接.md
│   │       ├── 数据流转/
│   │       │   ├── 01-完整链路.md
│   │       │   └── work-logs/
│   │       └── 系统架构/
│   │           └── work-logs/
└── src/                   # 你的代码
```

---

## 示例

查看 `examples/` 文件夹中的完整示例：
- **React 项目**：使用 TypeScript、Next.js 的前端
- **Go 项目**：使用微服务的后端
- **Python 项目**：使用 FastAPI 的 AI/ML

每个示例包含：
- 配置好的 `AGENTS.md`
- 示例 `context/` 结构
- 真实的工作日志和经验教训

---

## 文档

`docs/` 中的详细文档：
- [01-核心理念](docs/01-核心理念.md) - 设计哲学
- [02-快速开始](docs/02-快速开始.md) - 5 分钟设置
- [03-规则体系](docs/03-规则体系.md) - 两层规则
- [04-文档组织](docs/04-文档组织.md) - 文件结构
- [05-最佳实践](docs/05-最佳实践.md) - 技巧和窍门
- [06-进阶配置](docs/06-进阶配置.md) - 自定义

---

## 使用场景

### 个人开发者
- 跨会话维护上下文
- 建立个人知识库
- 通过 AI 提高代码质量

### 小团队（2-10 人）
- 共享规范和标准
- 更快地让新成员上手
- 积累团队知识

### 长期项目
- 保留架构决策
- 从过去的错误中学习
- 长期保持一致性

---

## 支持的 AI 助手

- ✅ **Claude**（Anthropic）- 通过 CLAUDE.md 完全支持
- ✅ **Cursor** - 与 .cursorrules 或 AGENTS.md 配合使用
- ✅ **GitHub Copilot** - 基本支持
- ✅ **ChatGPT** - 手动上下文加载
- ✅ **Windsurf** - 完全支持

---

## 贡献

我们欢迎贡献！查看 [CONTRIBUTING.md](CONTRIBUTING.md) 了解指南。

### 贡献领域
- 额外的语言模板
- 更多示例项目
- 文档改进
- 工具集成

---

## 路线图

### v1.0（当前）
- ✅ 核心协议定义
- ✅ 基本模板
- ✅ 文档

### v1.1（计划中）
- [ ] 初始化 CLI 工具
- [ ] VS Code 扩展
- [ ] 更多示例（Vue、Rust 等）

### v2.0（未来）
- [ ] 团队协作功能
- [ ] 可视化仪表板
- [ ] 分析和洞察

---

## 常见问题

### 问：我需要使用所有功能吗？
**答**：不需要。从 `AGENTS.md` 和 `context/current-task.md` 开始。根据需要添加更多。

### 问：我可以自定义结构吗？
**答**：可以。ACTS 是一个协议，不是一个僵化的框架。根据你的需求调整它。

### 问：这适用于我的技术栈吗？
**答**：是的。ACTS 与语言无关。它关于组织，而不是技术。

### 问：这与 .cursorrules 有什么不同？
**答**：ACTS 更全面。它包括：
- 长期知识（work-logs、lessons）
- 任务管理（current-task.md）
- 结构化文档（docs/）
- 团队协作功能

### 问：我可以用于非编码项目吗？
**答**：可以。ACTS 适用于任何受益于 AI 辅助和知识管理的项目。

---

## 许可证

MIT 许可证 - 详见 [LICENSE](LICENSE) 文件。

---

## 致谢

灵感来源于：
- 软件工程最佳实践
- 知识管理系统
- AI 辅助开发工作流

特别感谢社区的反馈和贡献。

---

## 联系方式

- **GitHub**：[yourusername/acts-protocol](https://github.com/yourusername/acts-protocol)
- **问题**：[报告 bug 或请求功能](https://github.com/yourusername/acts-protocol/issues)
- **讨论**：[加入对话](https://github.com/yourusername/acts-protocol/discussions)

---

**由开发者为开发者用 ❤️ 制作**
