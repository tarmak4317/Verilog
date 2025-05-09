4 bit Processor in Verilog
*portin to write values
*portout to display outputs
Opcodes:
*0000 - add
*0001 - subtract
*0010 - multiply
*0011 - divide
*0100 - read
*0101 - write
*0110 - read portin value
*0111 - write Y to portout
*1000 - load Y1 with Y (similar to A and B in 8051)
*1001 - jump to instruction
*1010 - jump to instruction if carry
*1011 - jump to instruction if no carry

rw to 0 to read, 1 to write
