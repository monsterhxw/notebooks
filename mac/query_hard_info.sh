#!/bin/sh

#查看 Mac 的硬件信息

echo "CPU 型号:"

sysctl -n machdep.cpu.brand_string

echo "CPU 核心数量:"

sysctl -n machdep.cpu.core_count

echo "CPU 线程数:"

sysctl -n machdep.cpu.thread_count

echo "其它信息:"

system_profiler SPDisplaysDataType SPMemoryDataType SPStorageDataType | grep 'Graphics/Displays:\|Chipset Model:\|VRAM (Total):\|Resolution:\|Memory Slots:\|Size:\|Speed:\|Storage:\|Media Name:\|Medium Type:'

