
   Sample coverage.e file
   ----------------------
   This file provides a basic example of coverage collection for the calc1 
   testbench.

<'

extend instruction_s {

   event instruction_complete;

   cover instruction_complete is {
      item cmd_in;
      //item resp;
      //item din1: uint (bits:32) = din1[31:0];
      item port;
      //cross cmd_in, resp;
      //cross cmd_in, port;

      item din1 using ranges = {
      	   range([0], "", 1, 1);
	   range([1], "", 1, 1);
	   range([2 .. 4294967295], "General Case", UNDEF, 1);
       };
      item din2 using ranges = {
      	   range([0], "", 1, 1);
	   range([1], "", 1, 1);
	   range([2 .. 4294967295], "General Case", UNDEF, 1);
       };
       cross cmd_in, din1, din2, port;

   };

}; // extend instruction_s

extend driver_u {

   collect_response(ins : instruction_s) @clk is also {

      emit ins.instruction_complete;

   };

}; // extend driver_u

'>

