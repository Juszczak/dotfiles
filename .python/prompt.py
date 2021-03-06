#!/usr/bin/env python
# coding: utf8

"""Set up Python interactive shell prompt"""

import sys

ESC = "["
END_ESC = "m"
FG_COLOR = "38;5;252"
BG_COLOR = "48;5;238"
FG_RESET = "0"
BG_RESET = "49"
PS1 = ">>"
PS2 = '  '

def escape(string):
    return "%s%s%s" % (ESC, string, END_ESC)

def set_fg():
    return escape(FG_COLOR)

def set_bg():
    return escape(BG_COLOR)

def reset_fg():
    return escape(FG_RESET)

def reset_bg():
    return escape(BG_RESET)

def wrap(string):
    return "%s%s%s%s %s%s " % (set_bg(), set_fg(), set_bg(), string, reset_bg(), reset_fg())

def gen_ps(prompt_string):
    return "%s" % (wrap(prompt_string))

def setup_prompts():
    sys.ps1 = gen_ps(PS1)
    sys.ps2 = gen_ps(PS2)
