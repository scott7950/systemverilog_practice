//SystemVerilog         C(input)                    C(output)
//byte                  char                        char*
//shortint              short int                   short int*
//int                   int                         int*
//longint               long long int               long int*
//shortreal             float                       float*
//real                  double                      double*
//string                const char*                 char**
//string[N]             const char**                char**
//bit                   svBit or unsigned           char  svBit* or unsigned char*
//logic, reg            svLogic or unsigned char    svLogic* or unsigned char*
//bit[N:0]              const svBitVec Val*         svBitVecVal*
//reg[N:0] logic[N:0]   const svLogicVecVal*        svLogicVecVal*
//unsized array[]       const svOpenArrayHandle     svOpenArrayHandle
//chandle               const void*                 void*
program test;

import "DPI-C" context function void helloFromCpp(string);
export "DPI-C" function helloFromSV;

import "DPI-C" context task helloTaskFromCpp(string);
export "DPI-C" task helloTaskFromSV;

import "DPI-C" function chandle initMemory(int);
import "DPI-C" function void writeMemory(chandle memoryHandle, int address, int data);
import "DPI-C" function int readMemory(chandle memoryHandle, int address);
import "DPI-C" function void freeMemory(chandle memoryHandle);

chandle memoryHandle;
int data;

initial begin
    helloFromCpp("Called from SV");

    $display("time before calling helloTaskFromCpp ", $time);
    helloTaskFromCpp("Called from SV");
    $display("time after calling helloTaskFromCpp ", $time);

    memoryHandle = initMemory(100);
    writeMemory(memoryHandle, 12, 32'h5A5A5A5A);
    data = readMemory(memoryHandle, 12);
    $display("%h", data);
    freeMemory(memoryHandle);

    $finish();
end

function void helloFromSV(string str);
    $display("[SV] Hello from SV %s", str);
endfunction

task helloTaskFromSV(input string str);
    $display("[SV] Hello from SV Task %s", str);
    #10;
endtask

endprogram

