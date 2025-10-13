#!/bin/sh

# 选择获取音量的后端：优先 wpctl，其次 pactl
if command -v wpctl >/dev/null 2>&1; then
  VOL_BACKEND="wpctl"
elif command -v pactl >/dev/null 2>&1; then
  VOL_BACKEND="pactl"
else
  echo "000"
  exit 0
fi

get_current_volume() {
  if [ "$VOL_BACKEND" = "wpctl" ]; then
    # wpctl: 默认输出设备
    out="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null || true)"
    if printf "%s" "$out" | grep -q "MUTED"; then
      echo "000"
      return
    fi
    # 提取第二列的小数并转为百分比
    vol=$(printf "%s" "$out" | awk '{printf "%.0f\n", $2*100}')
    : "${vol:=0}"
    printf "%03d\n" "$vol"
  else
    # pactl 分支（与原脚本兼容）
    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '/Volume:/{gsub(/[% ]/,"",$2); print $2; exit}')
    mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
    if [ "$mute" = "yes" ]; then
      echo "000"
    else
      : "${volume:=0}"
      printf "%03d\n" "$volume"
    fi
  fi
}

# 输出初始音量
get_current_volume

# 事件订阅：若有 pactl 用它（PipeWire 的 pulse 兼容层会发事件）；否则轮询
if command -v pactl >/dev/null 2>&1; then
  pactl subscribe | while read -r line; do
    if echo "$line" | grep -q "sink"; then
      get_current_volume
    fi
  done
else
  # 没有 pactl 时，wpctl 无原生日志订阅，这里采用轮询
  while sleep 1; do
    get_current_volume
  done
fi