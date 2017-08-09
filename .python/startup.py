#!/usr/bin/env bash
# coding: utf8

"""Python interactive shell startup script"""

import imp
import os

PROMPT_MODULE_NAME = 'prompt'
PROMPT_MODULE_FILE_PATH = os.path.join(os.environ.get('HOME'), '.python/prompt.py')

if os.path.isfile(PROMPT_MODULE_FILE_PATH):
    imp.load_source(PROMPT_MODULE_NAME, PROMPT_MODULE_FILE_PATH).setup_prompts()
