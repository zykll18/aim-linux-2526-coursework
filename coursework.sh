#!/bin/bash
# AIM 2526 学年 Linux 基础 课后考核脚本

# 说明：
# 该脚本用于自动化完成 AIM 2526 课后考核的各项任务。
# 请确保在运行此脚本前，已阅读 README.md 文件中的相关说明。
# 测试方法：
# 赋予脚本执行权限
# 在终端，确保你正处在 aim-linux-2526-coursework 文件夹下，然后运行命令：bash ./test.sh

# ============================================================================
# 重要提醒：
# 1. 本次作业只考察以下 Linux 命令的使用：
#    - cd（目录切换）
#    - mkdir（创建目录）
#    - touch（创建文件）
#    - rm（删除文件/目录，注意区分文件和文件夹）
#    - grep（文本搜索）
#    - cat（查看文件内容）
#
# 2. 所有生成的文件和目录都应该在 ./generated 目录下创建。
#
# 3. 完成作业后，请运行 bash ./test.sh 进行测试。
#    测试通过后，不要修改任何文件，直接 commit 并 push 到 GitHub。
#    如果 CI 检测到 hash.txt 不匹配，请重新运行 test.sh 并直接提交。
# ============================================================================

# 任务 1: 创建目录结构
# 要求：在 ./generated 目录下继续创建以下目录结构：
#   workspace/
#   ├── scripts/
#   └── data/
# 提示：先进入 generated 目录，然后使用创建子目录，创建完成后回到上级目录

# 请在下方写下你的命令（删除下面的 echo 语句并替换为你的命令，下面每一题都同理）
echo "任务 1: 请完成创建目录结构的命令"


# 任务 2: 创建文件
# 要求：在 ./generated/workspace/scripts/ 目录下创建两个空文件：
#       hello.sh 和 utils.sh

# 请在下方写下你的命令
echo "任务 2: 请完成创建文件的命令"


# 任务 3: 创建文件内容
# 要求：在 ./generated/workspace/scripts/hello.sh 文件中写入以下内容（每一行开头无空格）：
#       #!/bin/bash
#       echo "Hello, Linux!"
# 提示：可以自行上网搜索如何一次性写入包含多行的文件

# 请在下方写下你的命令
echo "任务 3: 请完成创建文件内容的命令"


# 任务 4: 删除文件
# 要求：删除 ./generated/workspace/scripts/utils.sh 文件

# 请在下方写下你的命令
echo "任务 4: 请完成删除文件的命令"


# 任务 5: 使用 rm 删除目录
# 要求：删除 ./generated/workspace/data/ 目录

# 请在下方写下你的命令
echo "任务 5: 请完成删除目录的命令"


# 任务 6: 使用 cat 和 grep 创建和搜索文件
# 要求：
#   1. 在 ./generated/workspace/ 目录下创建一个名为 info.txt 的文件，内容为（每一行开头无空格）：
#      Linux is a powerful operating system.
#      Bash scripting is fun and useful.
#      Command line tools are essential for developers.
#   2. 使用 grep 搜索包含 "Linux" 的行，并将结果保存到 result.txt 文件中
# 提示：可以自行上网搜索如何一次性写入包含多行的文件

# 请在下方写下你的命令
echo "任务 6: 请完成创建文件和搜索的命令"


# ============================================================================
# 脚本结束
# ============================================================================
echo ""
echo "所有任务执行完毕！"
echo "请运行 bash ./test.sh 来测试你的脚本是否正确。"
echo ""
echo "⚠️ 重要提醒："
echo "测试通过后，请不要修改任何文件，直接 commit 并 push 到 GitHub。"
echo "如果 CI 检测到 hash.txt 不匹配，请重新运行 test.sh 并直接提交。"
