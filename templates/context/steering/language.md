# 语言偏好

> 项目的语言使用规范

---

## 📝 文档语言

**主要语言**：中文 / English

**使用场景**：
- 项目文档：中文
- 代码注释：中文 / English
- Git 提交信息：中文 / English
- PR 描述：中文

---

## 💬 AI 对话语言

**默认语言**：中文

**规则**：
- AI 回复使用中文
- 技术术语可保留英文（如 React、API、Database）
- 代码示例中的注释使用中文

---

## 🔤 代码规范

### 命名规范

**变量和函数**：
- 使用英文命名
- 采用 camelCase
- 名称要有意义，避免缩写

```typescript
// ✅ 好的命名
const userName = 'John';
function getUserData() {}

// ❌ 不好的命名
const un = 'John';
function getData() {}
```

**组件和类**：
- 使用英文命名
- 采用 PascalCase

```typescript
// ✅ 好的命名
class DataModel {}
const DataCard = () => {};

// ❌ 不好的命名
class datamodel {}
const data_card = () => {};
```

**常量**：
- 使用英文命名
- 采用 UPPER_SNAKE_CASE

```typescript
// ✅ 好的命名
const MAX_RETRY_COUNT = 3;
const API_BASE_URL = 'https://api.example.com';
```

### 注释规范

**单行注释**：
```typescript
// 获取数据
const data = await fetchData();
```

**多行注释**：
```typescript
/**
 * 数据处理函数
 * @param input 输入参数
 * @param options 配置选项
 * @returns 处理结果
 */
function processData(input: string, options: Options) {}
```

---

## 📚 文档编写

### 技术文档

**标题**：中文  
**正文**：中文  
**代码示例**：英文命名 + 中文注释

```markdown
# 核心模块

## 架构设计

系统采用模块化设计...

## 代码示例

\`\`\`typescript
// 处理数据
function processData(data: string) {
  // 解析数据
  const parsed = parse(data);
  return parsed;
}
\`\`\`
```

### Work Logs

**标题**：中文  
**内容**：中文  
**代码片段**：英文命名 + 中文注释

---

## 📌 注意事项

- 保持一致性：团队统一使用相同的语言规范
- 技术术语：常见技术术语保留英文（如框架名、库名、API 等）
- 混合使用：文档可以中英文混合，但要保持可读性
