#!/bin/sh

# 获取当前音量并格式化为三位数字
get_current_volume() {
    # 获取音量值和静音状态
    volume_line=$(wpctl get-volume @DEFAULT_SINK@)
    volume_percent=$(echo "$volume_line" | awk '{printf "%d", $2 * 100}')
    mute_state=$(wpctl inspect @DEFAULT_SINK@ | awk -F'"' '/"mute":/ {print $4}')

    # 处理静音状态（true/false → 1/0）
    if [ "$mute_state" = "true" ] || [ "$volume_percent" -eq 0 ]; then
        echo "000"
    else
        printf "%03d\n" "$volume_percent"
    fi
}

# 初始音量输出
get_current_volume

# 监听音量变化事件（精简过滤逻辑）
pw-mon @DEFAULT_SINK@ --no-colors | \
  stdbuf -oL grep 'prop_changed' | \
  while read -r _; do
    get_current_volume
  done