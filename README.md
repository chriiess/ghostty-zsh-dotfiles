# ghostty-zsh-dotfiles（手动 + 安全）

最小化的 Ghostty + Zsh 配置，聚焦提示符与终端交互体验。  
默认不提供自动安装脚本，避免误覆盖已有环境。

> 适用系统：macOS（命令基于 Homebrew 与 macOS 目录结构）。

## 文件说明

- `ghostty_config`：Ghostty 配置
- `zshrc`：Zsh 片段（补全 / 自动建议 / 语法高亮 / Starship）
- `starship.toml`：Starship 主题配置

## 本项目的补全优化

当前配置对 Zsh 自动补全做了较多增强，重点包括：

- 更宽松的匹配规则：支持大小写与 `._-` 分隔符的模糊匹配
- 更强的补全链路：`_complete + _match + _approximate` 组合
- 轻量容错：拼写误差可自动近似匹配（`max-errors 1`）
- 交互体验优化：补全菜单选择、补全缓存、颜色高亮
- 历史与补全协同：`ZSH_AUTOSUGGEST_STRATEGY=(history completion)`
- 右箭头智能接受建议：光标在行尾时可直接接受 autosuggestion

## 快速流程（建议顺序）

### 1) 安装依赖

```bash
brew install zsh-autosuggestions zsh-syntax-highlighting fzf starship
```

### 2) 配置 Ghostty（备份后覆盖）

```bash
mkdir -p ~/.config/ghostty
cp ~/.config/ghostty/config ~/.config/ghostty/config.bak.$(date +%Y%m%d-%H%M%S) 2>/dev/null || true
cp ghostty_config ~/.config/ghostty/config
```

### 3) 配置 Starship（两选一）

方式 A（推荐：显式指定仓库配置）：

```bash
echo 'export STARSHIP_CONFIG="$(pwd)/starship.toml"' >> ~/.zshrc
```

方式 B（使用默认路径）：

```bash
mkdir -p ~/.config
cp starship.toml ~/.config/starship.toml
```

### 4) 启用 Zsh 片段并重载

```bash
echo "source $(pwd)/zshrc" >> ~/.zshrc
source ~/.zshrc
```

## 备注

- 若使用方式 A，`STARSHIP_CONFIG` 需要在 `eval "$(starship init zsh)"` 前生效。
- `zshrc` 已做存在性判断：插件缺失时不会中断 shell 启动。
