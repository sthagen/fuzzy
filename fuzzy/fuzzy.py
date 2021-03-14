# -*- coding: utf-8 -*-
# pylint: disable=expression-not-assigned,line-too-long
"""Whatever this app does, is more for enabling tests."""
import os
import pathlib
import pymc3
import subprocess
import sys

DEBUG_VAR = "FZ_DEBUG"
DEBUG = os.getenv(DEBUG_VAR)


def main(argv=None):
    """Drive the validator."""
    argv = argv if argv else sys.argv[1:]
    if not argv:
        print("ERROR arguments expected.", file=sys.stderr)
        return 2
