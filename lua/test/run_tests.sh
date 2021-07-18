#!/usr/bin/bash

nvim --headless +"%luafile tests.lua" +"echo ''" +"qa!"
