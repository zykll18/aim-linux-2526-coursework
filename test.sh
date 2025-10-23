#!/bin/bash

# 清理 generated 目录（保留 .gitkeep）
find generated -mindepth 1 -not -name .gitkeep -delete

# 运行 coursework.sh 脚本（答案脚本）
bash ./coursework.sh

echo ""
echo "=========================================="
echo "开始测试你的作业..."
echo "=========================================="
echo ""

# 测试计数器
TOTAL_TESTS=0
PASSED_TESTS=0

# 测试函数
test_check() {
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    if [ $1 -eq 0 ]; then
        echo "✓ 测试 $TOTAL_TESTS: $2 - 通过"
        PASSED_TESTS=$((PASSED_TESTS + 1))
        return 0
    else
        echo "✗ 测试 $TOTAL_TESTS: $2 - 失败"
        return 1
    fi
}

# 任务 1: 检查目录结构
echo "测试任务 1: 目录结构..."
[ -d "generated/workspace" ] && [ -d "generated/workspace/scripts" ]
test_check $? "目录结构创建（workspace和scripts）"

# 任务 2: 检查文件创建
echo "测试任务 2: 文件创建..."
[ -f "generated/workspace/scripts/hello.sh" ]
test_check $? "hello.sh 文件创建"

# 任务 3: 检查文件内容
echo "测试任务 3: 文件内容..."
if [ -f "generated/workspace/scripts/hello.sh" ]; then
    grep -q "Hello, Linux!" "generated/workspace/scripts/hello.sh"
    test_check $? "hello.sh 文件内容正确"
else
    test_check 1 "hello.sh 文件存在"
fi

# 任务 4: 检查文件删除
echo "测试任务 4: 文件删除..."
[ ! -f "generated/workspace/scripts/utils.sh" ]
test_check $? "utils.sh 文件已被删除"

# 任务 5: 检查目录删除
echo "测试任务 5: 目录删除..."
[ ! -d "generated/workspace/data" ]
test_check $? "data 目录已被删除"

# 任务 6: 检查文件创建和搜索
echo "测试任务 6: 文件创建和搜索..."
if [ -f "generated/workspace/info.txt" ] && [ -f "generated/workspace/result.txt" ]; then
    grep -q "Linux is a powerful operating system" "generated/workspace/info.txt" && \
    grep -q "Bash scripting is fun and useful" "generated/workspace/info.txt" && \
    grep -q "Command line tools are essential for developers" "generated/workspace/info.txt" && \
    grep -q "Linux" "generated/workspace/result.txt"
    test_check $? "info.txt 内容和 result.txt 搜索结果"
else
    test_check 1 "info.txt 和 result.txt 文件存在"
fi

if command -v sha256sum >/dev/null 2>&1; then
    HASH_CMD="sha256sum"
    elif command -v shasum >/dev/null 2>&1; then
    HASH_CMD="shasum -a 256"
else
    exit 1
fi

# 计算 generated 目录中所有文件的哈希（按文件名排序以保证一致性，排除hash.txt）
GENERATED_FILES=$(find generated -type f -not -name ".gitkeep" -not -name "hash.txt" | sort)
GENERATED_HASH=""
for file in $GENERATED_FILES; do
    file_hash=$($HASH_CMD "$file" | cut -d' ' -f1)
    GENERATED_HASH="${GENERATED_HASH}${file_hash}"
done
GENERATED_HASH=$($HASH_CMD <<< "$GENERATED_HASH" | cut -d' ' -f1)
COURSEWORK_HASH=$($HASH_CMD coursework.sh | cut -d' ' -f1)
COMBINED_HASH="${GENERATED_HASH}+${COURSEWORK_HASH}"
FINAL_HASH=$($HASH_CMD <<< "$COMBINED_HASH" | cut -d' ' -f1)

echo "$FINAL_HASH" > "generated/hash.txt"

# 输出测试结果
echo ""
echo "=========================================="
echo "测试完成！"
echo "通过: $PASSED_TESTS / $TOTAL_TESTS"
echo "=========================================="

if [ $PASSED_TESTS -eq $TOTAL_TESTS ]; then
    echo ""
    echo "🎉 恭喜！所有测试都通过了！"
    echo ""
    echo "你可以在 ./generated 目录下查看生成的文件和目录。"
    echo ""
    echo "⚠️ 重要提醒："
    echo "现在请直接 commit 并 push 到 GitHub，不要修改任何文件！"
    echo "如果 CI 检测到 hash.txt 不匹配，请重新运行 test.sh 并直接提交。"
    echo ""
    echo "祝你好运！"
    exit 0
else
    echo ""
    echo "❌ 还有测试未通过，请检查你的 coursework.sh 脚本。"
    echo ""
    echo "你可以在 ./generated 目录下查看生成的文件和目录，对比测试要求。"
    exit 1
fi
