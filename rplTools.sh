#!/bin/bash
echo "***************************"
echo "*   Welcome to RplTools   *"
echo "***************************"
echo "Press 1 for Simulation"
echo "Press 2 for Cost Analysis"
read option
if [ $option = "1" ]
then
{
  echo "Please enter the filename:"
  read file
  frontend/bin/absc -t ./examples/Rpl/$file.abs
  frontend/bin/absc -e RABS.abs
  gen/erl/run
}
else
{
  echo "Please enter the filename:"
  read file
  frontend/bin/absc -c ./examples/Rpl/$file.abs
}
fi
