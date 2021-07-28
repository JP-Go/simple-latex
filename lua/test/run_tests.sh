#!/usr/bin/bash

nvim --cmd "set rtp+=../" --headless +"packadd simple-latex" +"%luafile tests.lua" +"echo ''" +"qa!"
