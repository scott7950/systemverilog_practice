SRC_DIR = ../sv_dpi
QUESTASIM_INC = /home/tools/questasim/questasim/include

run:
	if [ ! -d work ]; then vlib work; fi
	vlog -novopt $(SRC_DIR)/dpi_sv.sv 
	g++ -fPIC -g -W -shared -I$(QUESTASIM_INC) -lstdc++ $(SRC_DIR)/dpi_c.cpp -o dpi_c.so
	vsim -c -novopt -do $(SRC_DIR)/do.tcl -sv_lib dpi_c work.test

clean:
	rm -rf *

.PHONY: run clean

