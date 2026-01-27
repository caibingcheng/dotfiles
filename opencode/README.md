# OpenCode Configuration

这个目录包含 OpenCode 和 Oh-My-OpenCode 的配置文件。

## 文件说明

- `oh-my-opencode.json` - Oh-My-OpenCode 的主配置文件，定义了各种 AI 代理和分类的模型配置
- `opencode.json` - OpenCode 的基础配置，包含插件列表和 provider 设置
- `package.json` - 依赖配置

## 使用方法

将这些配置文件复制到 `~/.config/opencode/` 目录：

```bash
cp opencode/*.json ~/.config/opencode/
```

然后在 `~/.config/opencode/` 目录中安装依赖：

```bash
cd ~/.config/opencode
bun install  # 或 npm install
```

## 注意事项

- 配置文件中不包含任何敏感信息（如 API keys）
- provider 配置需要单独设置
- 某些插件可能需要额外的认证配置
