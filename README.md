# aim-linux-2526-coursework

AIM 2526 学年 Linux 基础 课后考核

---

## 写在前面：Bash/Sh 脚本介绍

我们之前已经在课堂上讲解了如何在 Linux 终端中使用 Bash 命令行。现在，我们将介绍 Bash 脚本的基础知识。

### 什么是 Bash 脚本？

Bash (Bourne Again SHell) 是 Linux 系统中最常用的命令行解释器，包括我们在上周末的课上介绍的 Ubuntu 22.04 版本的 Linux，它也是使用 Bash 作为系统默认的命令行解释器，用于执行命令和脚本。Shell 脚本（通常以 `.sh` 为扩展名）是一种编程语言，可以自动化重复任务、系统管理等。

我们可以将一系列 Bash 命令写入一个文本文件中，然后通过执行该文件来运行这些命令。

比如，以下是一个简单的 Bash 脚本示例：

```bash
#!/bin/bash
# 上方的一行指定了脚本的解释器，Bash
# 下面开始是一个简单的 Bash 脚本

# 列出当前目录下的文件和目录
ls -l

# 输出 "Hello, World!"
echo "Hello, World!"
```

当我们将上述代码保存为 `example.sh` 并赋予执行权限后，可以通过运行 `./example.sh` 来执行脚本。
你也可以直接将脚本文件的内容全部复制出来并粘贴到终端中执行，这两个操作是等效的。

### 基本结构

- 脚本文件以 `#!/bin/bash` 开头，告诉系统使用 Bash 执行。
- 注释以 `#` 开头。
- 示例脚本：

  ```bash
  #!/bin/bash
  echo "Hello, World!"
  ```

### 运行脚本

- 赋予执行权限：`chmod +x script.sh`
- 执行：`./script.sh`

> 更多细节可以上网查找相关教程。

## 你的任务

1. 和上次的 Python 作业一样，在本仓库的 GitHub 页面上点击 `Use this template` 以该仓库为模板创建一个新的仓库，命名为 `aim-linux-2526-coursework` (如果命名错误，你将需要在下面的命令中替换更多内容，后果自负)。
2. 首先打开虚拟机，然后使用 VSCode 内置的 ssh 功能连接到你的 Linux 虚拟机。
3. 使用 VSCode 的内置终端，创建并 cd 到 `~/Documents/GitHub` 目录下。
4. 执行 `git clone` 命令将本仓库克隆到你的虚拟机中。如果显示没有找到 git 命令，请使用 apt 来安装 git。

   ```bash
   git clone https://github.com/你的GitHub用户名/aim-linux-2526-coursework.git
   ```

5. 使用 `code` 命令打开克隆下来的仓库目录作为 VSCode 的工作目录：

   ```bash
   code aim-linux-2526-coursework
   ```

6. 你会看到一个名为 `coursework.sh` 的文件，使用 VSCode 打开它并完成里面的任务。你可以参考文件的注释部分，了解具体要求以及本地测试的方法。
7. 完成后，使用 Git 提交并推送你的修改（这一次不需要切换分支，直接主分支一条龙即可）。关注你仓库的 Actions 页面，确保所有检查都通过。如果有检查未通过，请根据提示修改你的脚本，直到所有检查都通过为止。
8. 如果所有检查都通过，你就可以按照提示，和上次的流程相同，提交我们本次的作业了。

**文件说明：**

- `coursework.sh`：任务说明文件，你需要在此文件中填写命令
- `test.sh`：测试脚本，用于验证作业完成情况。禁止修改此文件内容，否则 CI 会报错。

**重要提醒：**

⚠️ **测试通过后，请直接 commit 并 push，不要修改任何文件！**

如果 CI 检测到 `hash.txt` 不匹配，请重新运行 `bash ./test.sh` 并直接提交，不要做任何修改。
