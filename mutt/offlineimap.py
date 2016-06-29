#!/usr/bin/python

import subprocess
import os
from os.path import expanduser

def mailpasswd(acct, domain="fastmail"):
    acct = os.path.basename(acct + "_" + domain)
    path = "%s/.%s.gpg" % (expanduser("~"), acct)
    args = ["gpg", "--quiet", "--for-your-eyes-only", "--no-tty", "-d", path]
    try:
        return subprocess.check_output(args).strip()
    except subprocess.CalledProcessError:
        return ""
