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
  frontend/bin/absc -t ./examples/$file.rpl
  cp RABS.abs ABS.rpl
  frontend/bin/absc -e ABS.rpl
  gen/erl/run
}
else
{
  echo "Please enter the filename:"
  read file
  frontend/bin/absc -c ./examples/$file.rpl
}
fi
