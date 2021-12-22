#!/bin/python

import os
import sys

home = os.environ['HOME']
user = os.environ['USER']

sys.path.append(os.path.abspath("{}/.s1n7ax/commons".format(home)))

# execute needs to be imported after adding the module to path
from execute import execute

execute([['wal', '-R']], False)

execute([['brave']], False)
execute([['imwheel', '-b', '45']], False)
# execute([['picom']], False)
# execute([['xcompmgr']], False)
execute([['kdeconnectd']], False)
execute([['xsetroot', '-name', ' {} '.format(user)]], False)
