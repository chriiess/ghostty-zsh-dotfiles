# ghostty-zsh-dotfiles（手动 + 安全）

一个最小化、可迁移的 Ghostty + Zsh 配置，主要聚焦命令提示与终端交互体验。

默认不提供自动安装脚本，以避免误覆盖用户已有配置。

## 仓库文件说明

- `ghostty_config`：我的 Ghostty 终端配置
- `zshrc`：Zsh 片段（补全 / 自动建议 / 语法高亮 / Starship）

## 1）Ghostty 配置（手动复制）

建议先备份当前配置，再替换：

```bash
mkdir -p ~/.config/ghostty
cp ~/.config/ghostty/config ~/.config/ghostty/config.bak.$(date +%Y%m%d-%H%M%S) 2>/dev/null || true
cp ghostty_config ~/.config/ghostty/config
```

## 2）安装可选依赖（推荐先执行）

按需安装（缺哪个装哪个）：

```bash
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install fzf
brew install starship
```

## 3）Zsh 配置（推荐追加一行 source）

先进入仓库目录，再执行下面命令（会自动用当前目录绝对路径追加到 `~/.zshrc`）：

```bash
echo "source $(pwd)/zshrc" >> ~/.zshrc
```

然后重新加载：

```bash
source ~/.zshrc
```

## 说明

- 本仓库刻意采用“手动优先”，以降低配置覆盖风险。
- `zshrc` 已做存在性判断：即使部分插件未安装，也不会因为 `source` 失败而中断 shell 启动。
