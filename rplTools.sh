#!/bin/bash
echo "Enter Filename"
read file
frontend/bin/absc -t ./examples/Rpl/$file.abs
frontend/bin/absc -e RABS.abs
gen/erl/run
