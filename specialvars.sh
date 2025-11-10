#!/bin/bash
echo "All vars passed : $@"
echo "No.of vars passed : $#"
echo "script name : $0"
echo "Preset working dir : $PWD"
echo "Home dir of current user: $HOME"
echo "which user is running this script : $USER"
echo "Process ID of current script : $$"
sleep 60 &
echo "Process ID of last command in background: $!"
