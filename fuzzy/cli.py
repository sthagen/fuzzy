#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""Just some fuzzy application asking for tests."""
import sys

import fuzzy.fuzzy as fz


def main(argv=None):
    """Process the job."""
    argv = sys.argv[1:] if argv is None else argv
    fz.main(argv)
