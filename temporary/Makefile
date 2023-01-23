all : rplTool

file = makefile_venv
option = makefile_venv

rplTool :   @echo "* \t Welcome to RplTools \t *"   \
        @echo "***************************" \
        @echo "Press 1 for Simulation"  \
        @echo "Press 2 for Cost Analysis"   \
        @read option    \
        ifeq ($(option),"1")
            @echo "Please enter the filename:"   \
            @read file  \
            @frontend/bin/absc -t ./examples/$(file).rpl \
            @cp RABS.abs ABS.rpl \
            @frontend/bin/absc -e ABS.rpl \
            @gen/erl/run \
        else
            @echo "Please enter the filename:" \
            @read file \
            @frontend/bin/absc -c ./examples/$(file).rpl \
        endif
