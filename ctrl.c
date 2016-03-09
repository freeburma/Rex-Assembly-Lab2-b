// ctrl.c for 201 exercise 4
//
// This file provides the function counter_ctrl.
// This function will invoke the counter function
// with the appropriate parameters. In this case
// it uses the lower 7 bits of the value passed as
// the count value, and the next most significant bit
// as the direction.

// Provide a function prototype for the counter function
void counter(int value, int direction);

void counter_ctrl(int switches)
{
  // Get the lowermost 7 bits of the switch setting
  int val = switches & 0x7f;
  // Use the uppermost switch as the direction indicator
  int dir = switches >> 7;

  // Invoke the counter function.
  counter(val, dir);
}
