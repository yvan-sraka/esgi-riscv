#include <stdint.h>
// We ask the compiler to * not optimize * the
// memory access with `volatile`.
// In embedded or kernel it is sometimes essential.
// The rest of the time it's counterproductive. ;)
// `static` indicates the variable is local to the file.
static volatile int32_t num0 = 124;
static volatile int32_t num1 = 256;
static volatile int32_t result_g = 0;

void main(void) {
   // Note that your language hides the use of pointers here,
   // in reality we are manipulating memory here
   // (especially if no optimization takes place).
   result_g = num0 + num1;
   printf("% d", result_g);
}