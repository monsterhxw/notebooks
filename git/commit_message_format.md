# Git Commit Guidelines

* [Commit Message Format](#commits)
* [Revert](#revert)
* [Type](#type)
* [Scope](#scope)
* [Subject](#subject)
* [Body](#body)
* [Footer](#footer)

### <a name="commits"></a> Commit Message Format

每个提交信息（**commit message**）包含标头（**header**），正文（**body**），页脚（**footer**）。

- 标题具有特殊的格式，它包括类型（**type**），范围（**scope**）和主题（**subject**）

```bash
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

标头是必需的，标头的范围（**scope**）是可选的。

提交消息（**commit message**）的任何一行都不能超过100个字符，这样是为了能在 **GitHub** 以及各种 **Git** 工具中更容易阅读消息。

### <a name="revert"></a>Revert

如果提交恢复先前的提交，它应该以 `revert: ` 开头，然后是恢复的提交的标头。

在正文中它应该说：`This reverts commit <hash>`。

其中 **hash** 是被还原的提交的 **SHA**。

### <a name="type"></a>Type

类型必须是以下之一：

- **feat** ：一个新功能（**A new feature**）
- **fix** ：缺陷修复（**A bug fix**）
- **docs** ：文档只能修改（**Documentation only changes**）
- **style** ：修改不能影响代码的含义（空格，格式，缺少分号等等）
- **refactor** ：重构代码时，代码更改既不修复缺陷（bug）也不添加功能（feature）
- **perf** ：代码更改可以提高性能
- **test** ：添加缺失或者修正现有的测试
- **chore** ：对更改构建过程（ **build process**）或辅助工具（**auxiliary tools**）和库 libraries（如文档生成）

### <a name="scope"></a>Scope

范围可以指定提交更改（**commit change**）位置的任何内容。

例如：

- `$location`

- `$browser`

- `$compile`

- `$rootScope`

- `ngHref`

- `ngClick`

- `ngView`

- etc...

当修改会影响多个范围的时候，您可以使用 `*`

### <a name="subject"></a>Subject

subject 包含对变更的简洁描述：

- 使用命令式，现在时态：`"change"`  而非 `“changed”` 或 `“changes”`
- 不要把第一个字母大写
- 在最后不需要加点 `.`

### <a name="body"></a>Body

就像在 `subject` 中一样

使用命令式，现在时态："change"`  而非 `“changed”` 或 `“changes”`

body 应该包括更改的动机，并将其与之前的行为进行对比。

### <a name="footer"></a>Footer

`footer` 应包含关于  **Breaking Changes** 的任何信息，也是 [引用此提交关闭的GitHub问题](https://help.github.com/articles/closing-issues-via-commit-messages/) 的地方。

**Breaking Changes **应以 `BREAKING CHANGE: `开头：

- 带有一个或两个换行符
- 然后将其余的提交消息（**commit message**）用于此目的。

### Example

```bash
fix(components/tables): change table attribute typo

修改了 xxx 的属性名称拼写错误.
为了解决兼容在接下来的几个版本会依旧保持久的错误写法可用,但会提示警告.
预计 3 个月后彻底移除拼写错误的版本.

closes [issue #275]( http://xxx/xxx/issues/275)
```