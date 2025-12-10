This worksheet contains several NASM assembly programs that run using a 32-bit GCC driver and a Makefile.
These tasks teach basic x86 concepts such as registers (EAX, EBX, ECX, EDX), integer input, loops, arrays, and simple validation.

All programs use:

NASM (Netwide Assembler)

asm_io.asm / asm_io.inc → read_int, print_int, print_string

driver.c → calls asm_main

Makefile → builds all tasks automatically

 How to Build and Run Everything
Build all tasks
make

Clean all object files / executables
make clean

Run a specific task
./task1
./task1_2
./task2_1
./task2_2
./task2_3



-----------------------------------------
Task 1 – Add Two Numbers
-----------------------------------------
Goal

Read two integers from the user, add them, and print the result.

How it works is 

read_int is used to read user input goes into EAX

First number stored in EBX

Second number stored in ECX

EAX = EBX + ECX

Result printed using print_int

Run
./task1

Example Output
Enter a number: 5
Enter a number: 7
12


-----------------------------------------
Task 1.2 – Add Three Numbers
-----------------------------------------
Goal

Read three integers, add them, and print the total.

How it works

First input → EBX

Second input → ECX

Third input → EDX

EAX = EBX + ECX + EDX

print the sum

Run
./task1_2

Example Output
Enter first number: 2
Enter second number: 3
Enter third number: 4
The sum is: 9



-----------------------------------------
Task 2.1 – Welcome Message Loop (50–99)
-----------------------------------------
Goal

Ask the user for a number between 50 and 99.
If valid → print "Welcome, Eiman!" that many times.
If not → print an error message.

How it works

Input stored in ECX

Compare ECX with 50 and 99

If out of range  print error

Otherwise use ECX as loop counter

Loop prints the message and decrements ECX until zero decrements means decrease by 1 

Run
./task2_1

Example (valid)
How many times? 55
Welcome, Eiman!
... repeated 55 times

Example (invalid)
How many times? 44
Error: number is too small.


-----------------------------------------
Task 2.2 – Array Sum (1..100)
-----------------------------------------
Goal

Fill an array with numbers 1 to 100, sum them, and print the total (5050).

How it works

Reserves space for 100 integers in .data

Uses a loop:

Fills each element with its index number

Add each value into EAX

Final sum printed

Registers

ECX - loop index (1 to 100)

EDI - array pointer

EAX - running total

Run
./task2_2

Example Output
Sum of numbers 1..100 is: 5050




-----------------------------------------
Task 2.3 – Sum 1..N (User Input)
-----------------------------------------
Goal

Ask the user for N (1–100).
If valid → compute the sum from 1 to N.
If invalid → print error.

How it works

Input → ECX

Range check (CMP with 1 and 100) cmp is compare 

Loop:

Add ECX to EAX

Decrement ECX where ECX acts as a counter that decreases with each pass until it reaches zero

Prints result

Run
./task2_3

Example (valid)
Enter N (1–100): 10
Sum of numbers 1..N is: 55

Example (invalid)
Enter N (1–100): 120
Invalid number.



![screenshot](images/Screenshot%202025-12-04%20231451.png)
