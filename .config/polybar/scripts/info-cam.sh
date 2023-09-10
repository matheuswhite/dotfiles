#!/bin/bash

if lsof /dev/video0 >/dev/null 2>&1; then
   camera=""
fi

echo "$camera"
