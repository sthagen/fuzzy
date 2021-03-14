#! /usr/bin/env python
# -*- coding: utf-8 -*-
# pylint: disable=line-too-long
"""Just some fuzzy application asking for tests."""
import os
import sys

import fuzzy.fuzzy as fz


# pylint: disable=expression-not-assigned
def main(argv=None):
    """Process the job."""
    argv = sys.argv[1:] if argv is None else argv
    fz.main(argv)
