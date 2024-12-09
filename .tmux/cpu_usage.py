#!/usr/bin/env python

import psutil
import subprocess

cpu0 = ' '
cpu1 = '▁'
cpu2 = '▂'
cpu3 = '▃'
cpu4 = '▄'
cpu5 = '▅'
cpu6 = '▆'
cpu7 = '▇'
cpu8 = '█'

color0="#[fg=colour10]"
color1="#[fg=colour3]"
color2="#[fg=colour7]"
color3="#[fg=colour1]"
color4="#[fg=colour9]"

# print(color0 + cpu1, end='')
# print(color0 + cpu1, end='')
# print(color1 + cpu2, end='')
# print(color1 + cpu3, end='')
# print(color2 + cpu4, end='')
# print(color2 + cpu5, end='')
# print(color3 + cpu6, end='')
# print(color3 + cpu7, end='')
# print(color4 + cpu8, end='')

single_cpu=subprocess.run("ps x -o %cpu | tail -n+2 | sort | tail -n1", shell=True, stdout=subprocess.PIPE).stdout.decode('utf-8').strip().replace(',', '.')

if float(single_cpu) > 90:
    print(color4 + "● ", end='')

for percent in psutil.cpu_percent(interval=0.1, percpu=True):
    if percent < 10:
        print(cpu0, end='')
    elif percent < 20:
        print(color0 + cpu1, end='')
    elif percent < 30:
        print(color0 + cpu1, end='')
    elif percent < 40:
        print(color1 + cpu2, end='')
    elif percent < 50:
        print(color1 + cpu3, end='')
    elif percent < 60:
        print(color2 + cpu4, end='')
    elif percent < 70:
        print(color2 + cpu5, end='')
    elif percent < 80:
        print(color3 + cpu6, end='')
    elif percent < 90:
        print(color3 + cpu7, end='')
    else:
        print(color4 + cpu8, end='')
