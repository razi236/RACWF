#!/bin/bash
echo "****************************************"
echo "*          Welcome to RACWF            *"
echo "****************************************"
echo "Press 1 for one to one resource mapping"
echo "Press 2 to optimize the throughput and meed deadline"
echo "Press 3 to optimize the resource cost"
read option
if [[ "$OSTYPE" == "darwin"* ]]; then
    {
    if [ $option = "1" ]
    then
    {
        [ -f sim1.csv ] && rm sim1.csv
        echo GrossT1,GrossR1,GrossT2,Grossr2,GrossT3,GrossR3,PT,PR,ET1,ER1,ET2,ER2,ET3,ER3,SecT1,SecR1,SecT2,SecR2,SecT3,SecR3,StT1,StR1,StT2,StR2,StT3,StR3,AT,AR,AT,AR,AT,AR,TT >> sim1.csv

        c=1
        while [ $c -le 100 ]
        do
            frontend/bin/absc -e ./examples/p1.rpl
            gen/erl/run >> sim1.csv
            (( c++ ))
        done
    }
    # shellcheck disable=SC1073
    elif [ $option = "2" ]
    then
    {
        [ -f simulation.csv ] && rm simulation.csv
        echo GrossT1,GrossR1,GrossT2,Grossr2,GrossT3,GrossR3,PT,PR,ET1,ER1,ET2,ER2,ET3,ER3,SecT1,SecR1,SecT2,SecR2,SecT3,SecR3,StT1,StR1,StT2,StR2,StT3,StR3,AT,AR,AT,AR,AT,AR,TT >> simulation.csv
        c=1
        while [ $c -le 100 ]
        do
            frontend/bin/absc -e ./examples/p2a.rpl
            gen/erl/run >> simulation.csv
            (( c++ ))
        done
    }
    # shellcheck disable=SC1131
    elif [ $option = "3" ]
    then
    {
      start=`echo $(($(gdate +%s%N)/1000000))`
      frontend/bin/absc -e ./examples/p3a.rpl
      gen/erl/run
      end=`echo $(($(gdate +%s%N)/1000000))`
      echo Execution time was `expr $end - $start` mili seconds.
    }
    else
    {
        echo "Wrong selection"

    }
    fi
    }
else
    {
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
        frontend/bin/absc -s ./examples/$file
        cp RABS.abs ABS.rpl
        frontend/bin/absc -e ABS.rpl
        gen/erl/run
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
        #start=`echo $($(date +%s))`
        start=`date +%s`
        frontend/bin/absc -s ./examples/$file
        cp RABS.abs ABS.rpl
        frontend/bin/absc -e ABS.rpl
        gen/erl/run
        end=`date +%s`
        echo Execution time was `expr $end - $start` seconds.
    }
    else
    {
        echo "Wrong selection"

    }
    fi
    }
fi
