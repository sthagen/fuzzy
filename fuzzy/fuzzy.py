# -*- coding: utf-8 -*-
"""Whatever this app does, is more for enabling tests."""
import os
import sys

DEBUG_VAR = 'FZ_DEBUG'
DEBUG = bool(os.getenv(DEBUG_VAR, ''))


def main(argv=None):
    """Drive the validator."""
    argv = argv if argv else sys.argv[1:]
    if not argv:
        print('ERROR arguments expected.', file=sys.stderr)
        return 2
