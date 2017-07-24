#!/usr/bin/env python
# coding=UTF-8

import math
import platform
import subprocess

if platform.system() == 'Darwin':
    p = subprocess.Popen(['ioreg', '-rc', 'AppleSmartBattery'],
                         stdout=subprocess.PIPE)
    output = p.communicate()[0]

    o_max = [l for l in output.splitlines() if 'MaxCapacity' in l][0]
    o_cur = [l for l in output.splitlines() if 'CurrentCapacity' in l][0]

    b_max = float(o_max.rpartition('=')[-1].strip())
    b_cur = float(o_cur.rpartition('=')[-1].strip())

    charge = b_cur / b_max
    charge_threshold = int(math.ceil(10 * charge))

    color_green = '#[fg=green]'
    color_red = '#[fg=red]'
    color_reset = '#[default]'

    total_slots, slots = 10, []
    filled = int(math.ceil(charge_threshold * (total_slots / 10.0))) * u'▸'
    empty = (total_slots - len(filled)) * u'▹'

    out = (color_green + filled + color_red + empty + color_reset)
    out = out.encode('utf-8')
    print(out)
