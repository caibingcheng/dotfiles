# 全局规则

## 语言偏好

请始终使用**中文**回复用户的消息。

## 术语处理

对于以下情况，保留英文原文，不做翻译：
- 专有名词（如 React、Vue、TypeScript、npm、git 等）
- 技术术语（如 API、SDK、CLI、HTTP、JSON 等）
- 变量名、函数名、命令行参数
- 包名、库名、框架名
- 文件路径和扩展名
- 错误信息和日志内容

示例：
- 正确：使用 `npm install` 安装依赖
- 错误：使用 `npm 安装` 安装依赖
- 正确：这个 API 返回 JSON 格式的数据
- 错误：这个接口返回 JSON 格式的数据

## 任务完成通知

- 在完成一个任务后，**必须**向用户发送一条消息，告知任务已完成，并提供相关信息（如修改的文件、提交的内容等）。
- 例如：“已完成修改，更新了 `src/App.js` 文件，提交了 commit `abc123`。”
- 如果涉及background tasks / subagents，你必须等待所有background tasks / subagents完成后，才能发送完成通知。
- 如果准备发送完成通知，此时需要检查是否有未完成的background tasks / subagents，如果发现还有未完成的background tasks / subagents，你必须告诉用户：“当前还有未完成的后台任务，正在等待它们完成后再发送最终结果。”
- 如果任务中，曾经有过background tasks / subagents，当任何时候你向用户发送一些结论性、提问性的内容时，你应该告诉用户当前是否还有未完成的background tasks / subagents。

## Git 工作流

**提交前检查清单**：
1. 确保所有后台任务（background tasks / subagents）已完成
2. 运行 `git status` 和 `git diff` 确认所有修改已暂存
3. 如果后台任务仍在修改文件，**不要提交**
4. 只提交自己修改的文件，或用户明确要求提交的文件

## 工作区域

当任何设计修改/删除的操作时，检查被修改/删除的路径是否在当前工作区(working directory or workspace folder)内，如果不在，则必须向用户请求确认，用户确认后才能继续执行。
请求示例：“正在修改 `/root/project/src/App.js`，这个文件不在当前工作区 `/demo/project` 内，请确认是否继续？”

## Skills

<IMPORTANT-SUPERPOWERS-SKILL-INVOCATION-GUIDELINES>
- DO NOT commit superpowers specs/plans to git, unless explicitly requested by the user.
</IMPORTANT-SUPERPOWERS-SKILL-INVOCATION-GUIDELINES>

## Question Asking

<IMPORTANT-QUESTION-ASKING-GUIDELINES>
When model provider is 'github-copilot', you should use 'question tool' to ask questions or requirements clarification, even for simple yes/no questions or choice questions. Do not ask questions directly to the user.
</IMPORTANT-QUESTION-ASKING-GUIDELINES>
