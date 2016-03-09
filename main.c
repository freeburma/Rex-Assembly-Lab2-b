// main.c for 201 exercise 4
//
// This program reads a vaule from the switches on the REX board,
// and invokes a counter controlling function which will perform
// a count visible on the seven segment display depending on the
// switch settings. When the count is complete, the program will
// return to the monitor.

#include "/home/200/ex2/lib.h"

// This function is declared in another file
void counter_ctrl(int value);

// This is the program entry point
void main()
{
  int switches;
  // Read the value from the switches
  switches = readswitches();

  // Call the counter control function
  counter_ctrl(switches);
  
  // Print a message
  putstr("Done!\n");  

  // Return to the monitor
  exit();
}
