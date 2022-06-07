#!/bin/bash

vim +'CocInstall coc-clangd' +'CocInstall coc-sh' +'CocInstall coc-cmake' +'CocInstall coc-python' +'CocInstall coc-java' +'CocInstall coc-git'
vim main.c +"CocCommand clangd.install"
