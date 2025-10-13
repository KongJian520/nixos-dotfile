#!/bin/sh

# 检查参数是否提供
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {up|down|mute}"
    exit 1
fi

if [ "$1" == "up" ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+
    # echo "Volume increased by 1%."
elif [ "$1" == "down" ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-
    # echo "Volume decreased by 1%."
elif [ "$1" == "mute" ]; then
    # 使用 wpctl 切换静音状态
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    # echo "Audio muted/unmuted."
else
    echo "Error: Invalid argument. Use 'up', 'down', or 'mute'."
    exit 1
fi
