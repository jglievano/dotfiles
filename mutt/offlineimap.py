#!/usr/bin/python

import subprocess
import os
from os.path import expanduser

def mailpasswd(acct):
    acct = os.path.basename(acct)
    path = "%s/.%s.gpg" % (expanduser("~"), acct)
    print "%s" % path
    args = ["gpg", "--quiet", "--for-your-eyes-only", "--no-tty", "-d", path]
    try:
        return subprocess.check_output(args).strip()
    except subprocess.CalledProcessError:
        return ""
