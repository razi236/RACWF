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
  start=`date +%s`
  frontend/bin/absc -s ./examples/$file
  cp RABS.abs ABS.rpl
  frontend/bin/absc -e ABS.rpl
  gen/erl/run
  end=`date +%s`
  echo Execution time was `expr $end - $start` seconds.
}
# shellcheck disable=SC1073
elif [ $option = "2" ]
then
{
  echo "Please enter the filename:"
  read file
  start=`date +%s`
  frontend/bin/absc -c ./examples/$file
  end=`date +%s`
    echo Execution time was `expr $end - $start` seconds.
  grep -o '\bmax\b' CostEquations.txt | wc -l
}
# shellcheck disable=SC1131
elif [ $option = "3" ]
then
{
  echo "Please enter the filename:"
  read file
  start=`date +%s`
  frontend/bin/absc -t ./examples/$file
  end=`date +%s`
  echo Execution time was `expr $end - $start` seconds.
}
else
{
    echo "Wrong selection"

}

fi
