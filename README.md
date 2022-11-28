# Dotfiles

## 使用

克隆本仓库：

```sh
cd ~
git clone https://github.com/ShwStone/Dotfiles
```

然后添加以下内容到你的 `~/.bashrc` （或其他的 `.*rc` ） ：

```sh
source ~/Dotflies/alias.sh
source ~/Dotfiles/function.sh
```

最后执行：

```sh
source ~/.bashrc
```

## run

包含了 C++ 的 run 命令，可以运行单个 cpp 文件。对于连续两次相同的文件， run 不会重复编译。

另外， run_re 可以在编译指令中加入 `-fsanitize=address,undefiend` 。
