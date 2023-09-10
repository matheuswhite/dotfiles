#!/bin/bash
sudo pacman -S $(cat pkglist.lst | cut -d' ' -f1)
