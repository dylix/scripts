#!/bin/bash
cd  ~/.wine/drive_c/Program\ Files/Steam/
WINEDEBUG=-all wine ~/.wine/drive_c/Program\ Files/Steam/Steam.exe -fullscreen \
    -width 1280 -height 1024 -applaunch 240 -console -dxlevel90 \
    -heapsize 512000 +map_background none "$@"
