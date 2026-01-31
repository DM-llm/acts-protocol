#!/bin/bash

# ACTS 协议初始化脚本
# 用法：bash /path/to/acts-protocol/scripts/init.sh

set -e

echo "🚀 开始初始化 ACTS 协议..."
echo ""

# 检查是否在项目根目录
if [ ! -d ".git" ]; then
    echo "⚠️  警告：当前目录不是 Git 仓库根目录"
    read -p "是否继续？(y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# 获取脚本所在目录的父目录（acts-protocol 根目录）
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ACTS_ROOT="$(dirname "$SCRIPT_DIR")"
TEMPLATES_DIR="$ACTS_ROOT/templates"

# 检查 templates 目录是否存在
if [ ! -d "$TEMPLATES_DIR" ]; then
    echo "❌ 错误：找不到 templates 目录"
    echo "请确保从 acts-protocol 仓库运行此脚本"
    exit 1
fi

# 创建基本目录结构
echo "📁 创建目录结构..."
mkdir -p context/{docs,steering,reviews}
mkdir -p context/docs/{前端,后端,AI层,全栈,lessons}
echo "✅ 目录结构创建完成"

# 复制配置文件
echo ""
echo "📄 复制配置文件..."

# 复制 AGENTS.md
if [ -f "AGENTS.md" ]; then
    echo "⚠️  AGENTS.md 已存在，跳过"
else
    cp "$TEMPLATES_DIR/AGENTS.md" AGENTS.md
    echo "✅ 复制 AGENTS.md"
fi

# 复制 SYS_PROMPT.md（可选）
if [ -f "SYS_PROMPT.md" ]; then
    echo "⚠️  SYS_PROMPT.md 已存在，跳过"
else
    cp "$TEMPLATES_DIR/SYS_PROMPT.md" SYS_PROMPT.md
    echo "✅ 复制 SYS_PROMPT.md"
fi

# 复制 CLAUDE.md（可选）
if [ -f "CLAUDE.md" ]; then
    echo "⚠️  CLAUDE.md 已存在，跳过"
else
    cp "$TEMPLATES_DIR/CLAUDE.md" CLAUDE.md
    echo "✅ 复制 CLAUDE.md"
fi

# 复制 context 模板文件
echo ""
echo "📄 复制 context 模板文件..."

# 复制 current-task.md
if [ -f "context/current-task.md" ]; then
    echo "⚠️  context/current-task.md 已存在，跳过"
else
    cp "$TEMPLATES_DIR/context/current-task.md" context/current-task.md
    echo "✅ 复制 context/current-task.md"
fi

# 复制 INDEX.md
if [ -f "context/docs/INDEX.md" ]; then
    echo "⚠️  context/docs/INDEX.md 已存在，跳过"
else
    cp "$TEMPLATES_DIR/context/docs/INDEX.md" context/docs/INDEX.md
    echo "✅ 复制 context/docs/INDEX.md"
fi

# 复制 steering 文件
for file in project.md debugging.md language.md pr-docs.md; do
    if [ -f "context/steering/$file" ]; then
        echo "⚠️  context/steering/$file 已存在，跳过"
    else
        cp "$TEMPLATES_DIR/context/steering/$file" "context/steering/$file"
        echo "✅ 复制 context/steering/$file"
    fi
done

# 创建 .gitignore（如果不存在）
if [ -f ".gitignore" ]; then
    echo ""
    echo "⚠️  .gitignore 已存在，跳过"
else
    echo ""
    echo "📄 创建 .gitignore..."
    cat > .gitignore << 'EOF'
# ACTS 协议相关
# 如果不想提交某些 context 文件，可以在这里添加

# 示例：
# context/current-task.md
EOF
    echo "✅ 创建 .gitignore"
fi

echo ""
echo "=" * 50
echo "✅ ACTS 协议初始化完成！"
echo "=" * 50
echo ""
echo "📝 下一步："
echo "1. 编辑 context/steering/project.md 填写项目信息"
echo "2. 编辑 context/steering/debugging.md 填写调试信息"
echo "3. 复制 SYS_PROMPT.md 到 AI 设置（如果使用 Cursor/Windsurf）"
echo "4. 告诉 AI：'我已经设置好 ACTS 协议，开始工作吧！'"
echo ""
echo "📚 更多信息："
echo "- 查看 AGENTS.md 了解完整协议"
echo "- 查看 acts-protocol/STRUCTURE.md 了解目录结构"
echo "- 查看 acts-protocol/README.md 了解使用指南"
echo ""
