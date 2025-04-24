#!/bin/bash

# 源目录
SRC_DIR="/opt/sdb/pt/downloads"

# 目标目录列表
declare -A TARGET_DIRS
TARGET_DIRS[1]="/opt/sdb/jellyfin/Shows"
TARGET_DIRS[2]="/opt/sdb/jellyfin/Movies"
TARGET_DIRS[3]="/opt/sdb/jellyfin/Music"

# 列出源目录中的文件夹，并按修改时间排序
readarray -t folders < <(find "$SRC_DIR" -maxdepth 1 -mindepth 1 -type d -printf "%T@ %p\n" | sort -n | cut -d' ' -f2-)
if [ ${#folders[@]} -eq 0 ]; then
    echo "源目录中没有可用的文件夹。"
    exit 1
fi

# 让用户选择文件夹
PS3=$'\n请输入对应的数字序号(1, 2, 3...): '
select folder in "${folders[@]}"; do
    if [ -n "$folder" ]; then
        echo "已选择: $folder"
        break
    else
        echo "请输入正确的数字序号(1, 2, 3...)："
    fi
done

# 让用户选择目标目录
echo "请选择目标目录："
for key in "${!TARGET_DIRS[@]}"; do
    echo "$key) ${TARGET_DIRS[$key]}"
done

read -p "输入目标目录的编号: " target_choice
TARGET_DIR=${TARGET_DIRS[$target_choice]}

if [ -z "$TARGET_DIR" ]; then
    echo "无效的选择。"
    exit 1
fi

echo "目标目录: $TARGET_DIR"

# 目标文件夹名默认使用源文件夹名称
default_target_name="$(basename "$folder")"
read -p "请输入目标文件夹名称 (默认: $default_target_name): " target_name
TARGET_NAME=${target_name:-$default_target_name}

# 硬链接文件夹到目标目录
TARGET_PATH="$TARGET_DIR/$TARGET_NAME"

if [ -e "$TARGET_PATH" ]; then
    echo "错误：目标目录中已存在相同名称的文件夹。"
    exit 1
fi

cp -lR "$folder" "$TARGET_PATH"

if [ $? -eq 0 ]; then
    echo "硬链接创建成功: $TARGET_PATH"
else
    echo "硬链接创建失败。"
    exit 1
fi

