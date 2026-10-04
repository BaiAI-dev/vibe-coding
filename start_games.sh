#!/usr/bin/env bash
cd "$(dirname "$0")"

# 启动两个独立端口的游戏服务器
python3 -m http.server 8000 >/tmp/snake_server.log 2>&1 &
PID_SNAKE=$!
python3 -m http.server 8001 >/tmp/shooter_server.log 2>&1 &
PID_SHOOTER=$!

trap 'kill $PID_SNAKE $PID_SHOOTER 2>/dev/null' INT TERM EXIT

echo "======================================"
echo "  两个游戏已用独立端口启动"
echo ""
echo "  贪吃蛇:       http://localhost:8000/index.html"
echo "  3D小镇射击:   http://localhost:8001/gta_demo.html"
echo ""
echo "  按 Ctrl+C 同时停止两个游戏"
echo "======================================"

wait
