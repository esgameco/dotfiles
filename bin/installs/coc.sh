#!/bin/bash

vim +'silent :CocInstall coc-clangd' +qall
vim +'silent :CocCommand clangd.install' +qall
vim +'silent :CocInstall coc-sh' +qall
vim +'silent :CocInstall coc-cmake' +qall
vim +'silent :CocInstall coc-python' +qall
vim +'silent :CocInstall coc-java' +qall
vim +'silent :CocInstall coc-git' +qall
