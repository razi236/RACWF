#!/bin/bash
echo "****************************************"
echo "*          Welcome to RACWF            *"
echo "****************************************"
echo "Press 1 for aquiring when all the resources are available"
echo "Press 2 for aquiring when 70% of the resources are available"
echo "Press 3 for aquiring when 50% of the resources are available"
echo "Press 4 for aquiring efficient resources"
read option
if [[ "$OSTYPE" == "darwin"* ]]; then
    {
    if [ $option = "1" ]
    then
    {
        [ -f rescue_sim1.csv ] && rm rescue_sim1.csv
        echo PoliceRescueR,PoliceReportT,PoliceReportR,PoliceRushT,PoliceRushR,ECCMakeEmgPlanT,ECCMakeEmgPlanR,EODR,EODRushT,EODRushR,EODReportT,EODReportR,FBR,FBRushT,FBRushR,FBReportT,FBReportR,FBT,HosR >> rescue_sim1.csv

        c=1
        frontend/bin/absc -e ./examples/r1.rpl
        while [ $c -le 100 ]
        do
            gen/erl/run >> rescue_sim1.csv
            (( c++ ))
        done
    }
    elif [ $option = "2" ]
    then
    {
      [ -f rescue_sim1_a.csv ] && rm rescue_sim1_a.csv
      echo GrossT1,GrossR1,GrossT2,Grossr2,GrossT3,GrossR3,PT,PR,ET1,ER1,ET2,ER2,ET3,ER3,SecT1,SecR1,SecT2,SecR2,SecT3,SecR3,StT1,StR1,StT2,StR2,StT3,StR3,AT,AR,AT,AR,AT,AR,TT >> rescue_sim1_a.csv
      c=1
      frontend/bin/absc -e ./examples/r1a.rpl
      while [ $c -le 100 ]
      do
          gen/erl/run >> rescue_sim1_a.csv
          (( c++ ))
      done
    }
    elif [ $option = "3" ]
    then
    {
      [ -f rescue_sim1_b.csv ] && rm rescue_sim1_b.csv
      echo GrossT1,GrossR1,GrossT2,Grossr2,GrossT3,GrossR3,PT,PR,ET1,ER1,ET2,ER2,ET3,ER3,SecT1,SecR1,SecT2,SecR2,SecT3,SecR3,StT1,StR1,StT2,StR2,StT3,StR3,AT,AR,AT,AR,AT,AR,TT >> rescue_sim1_b.csv
      c=1
      frontend/bin/absc -e ./examples/r1b.rpl
      while [ $c -le 100 ]
      do
          gen/erl/run >> rescue_sim1_b.csv
          (( c++ ))
      done
    }
    # shellcheck disable=SC1073
    elif [ $option = "4" ]
    then
    {
        [ -f rescue_sim2.csv ] && rm rescue_sim2.csv
        echo PoliceRescueR,PoliceReportT,PoliceReportR,PoliceRushT,PoliceRushR,ECCMakeEmgPlanT,ECCMakeEmgPlanR,EODR,EODRushT,EODRushR,EODReportT,EODReportR,FBR,FBRushT,FBRushR,FBReportT,FBReportR,FBT,HosR >> rescue_sim2.csv
        c=1
        frontend/bin/absc -e ./examples/r2a.rpl
        while [ $c -le 100 ]
        do
            gen/erl/run >> rescue_sim2.csv
            (( c++ ))
        done
    }
    # shellcheck disable=SC1131

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
