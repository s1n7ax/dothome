#!/bin/python

import os
import sys

home = os.environ['HOME']
user = os.environ['USER']

sys.path.append(os.path.abspath("{}/.local/share/s1n7ax/commons".format(home)))

# execute needs to be imported after adding the module to path
from execute import execute

execute([['xsetroot', '-name', ' {} '.format(user)]], False)

execute([['st']], False)
execute([['st']], False)
execute([['firefox']], False)
execute([['chromium']], False)

execute([['imwheel', '-b', '45']], False)
execute([['setxkbmap', '-option', 'ctrl:nocaps']], False)
execute([['xset', 'r', 'rate', '180', '80']], False)
#  execute([['picom']], False)
execute([['xcompmgr']], False)
execute([['wal', '-R']], False)
execute([['dwm-status']], False)
execute([['sxhkd']], False)
execute([['/usr/lib/kdeconnectd']], True)
# execute([['polybar_launch.sh']], False)
# execute([['indicator-kdeconnect']], False)
