#!/bin/bash
echo "****************************************"
echo "*          Welcome to RplTools         *"
echo "****************************************"
echo "Press 1 for Simulation"
echo "Press 2 for Cost Analysis"
echo "Press 3 for RPL to ABS translation"
read option
if [ $option = "1" ]
then
{
  echo "Please enter the filename:"
  read file
  frontend/bin/absc -s ./examples/$file
  cp RABS.abs ABS.rpl
  frontend/bin/absc -e ABS.rpl
  gen/erl/run
}
# shellcheck disable=SC1073
elif [ $option = "2" ]
then
{
  echo "Please enter the filename:"
  read file
  frontend/bin/absc -c ./examples/$file
}
# shellcheck disable=SC1131
elif [ $option = "3" ]
then
{
  echo "Please enter the filename:"
  read file
  frontend/bin/absc -t ./examples/$file
}
else
{
    echo "Wrong selection"

}

fi
