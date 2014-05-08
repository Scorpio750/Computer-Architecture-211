# Computer Architecture 211
## Abhisek Bhattacharjee
## Spring 2014

---
---

## Table of Contents

1. [C Programming](#anchor1)
2. [Number Representation](#anchor2)
3. [Assembly Programming](#anchor3)
4. [Digital Logic](#anchor4)
	1. [Combinational Logic](#anchor4.1)
	2. [Sequential Logic](#anchor4.2)
5. [Caches](#anchor5)
6. [Final Review](#anchor6)

---
---

###1/30/14

## [C Programing](id:anchor1)

### Anatomy of a C Program

	#include <stdio.h>
	#include <stdlib.h>
	
	char cMessage[] ="Hello\n";
	
	/* Execution will start here */
	int main (int argc, char **argv) //** is pointer
	{
		int i, count;
		
		count = atoi(argv[1]); //atoi = ask type to integer
		for (i = 0; i <count; i++) {
			printf("Hellow %dn", i);
			}
	}

#### Comments

- same as Java 'inline code'
- cannot nest comments

#### Variable Declarations

- Names for data items
- Strong-type
	- Amount of data storage varies on the system
	- this can fux with memory allocation
- C has no garbage collector
	- Frees up CPU and runtime
	- Good for latency-critical programs
- can be local or global

#### Basic Data Types

- **char, int, float, double**
- Modifiers
	- short, long: control size/range of numbers
	- signed, unsigned: include negative numbers or not
	
#### Operators

- && || ==
- Returns 1 for TRUE or 0 for FALSE

#### Bit Operators (Operators that mess with binary values)

1. ~ = complement
2. & = bit AND
3. | = bit OR
4. ^ = bit XOR ($$$\oplus $$$) 
	- ~0101 = 1010
	- 0101 & 1010 = 0000
	- 0101 | 1010 = 1111

---

- Entropy is important in designing circuits/hardware

#### Control Statements

- Conditional
	- if-else
	- switch
- Iteration (loops)
	- while
	- for
	- do while
- Specialized "go-to"
	- break
	- continue
- If-else statements are evaluated until it finds a nonzero expression and executes that statement
- For switch statements, the compiler evaluates the expression; the results must be integer
- Continues executing until "break" or "continue"

#### Loops

- while, do-while, and for

---
### Recitation $$$\text{with }\mathbb{Poppy!}$$$

#### TA Information

- Brian Poppy

- Office Hours: M 2-3pm Hill 357

- cereal.rutgers.edu

- Hill 248-252

- Linux/Mac: ssh java.cs.rutgers.edu (or any other machine)

#### First Project

- Read through a text file, and keep track of of frequency of word occurrences

#### Shell Commands

- ssh \<machine name> : remotely access other machines
- mkdir \<dirname>
- cd \<dirname>
- nano: text editor
- rm <filename> : delete file
	- rm -r <dirname>: delete directory
- . : current dir
- .. : previous dir
- gcc : compile C program
- gcc -o <output file> <C file>: compile and specify output file
- exit
- man :manual
	- man <function>
	- man <section #> <function>

#### Pointers

- Identify where in memory you have your whatever
	
		char *argv[]
		
---
### 2/4/14

#### Functions

- Similar to Java methods
- Components:
	- Name
	- Return Type
		- *void* if no return value
	- Parameters
		- **pass-by-value**
	- Body
		- Statements to be executed
		- return forces exits from function and resumes execution at statement immediately after function call
		
#### Function Calls

- Function call as part of an expression
		
		x + Factorial(y)
		
- Function call as statement

		Factorial(y);

#### Function Prototypes

- Can declare functions without specifying implementation
- int Factorial(int)
	- ^Can specify parameter names but don't have to
	- This is called a *function signature*
- Declarations allow function to be "used" w/o having the implementation until link time

#### I/O

Variety of I/O functions in C Standard Library

	#include <stdio.oh>
	
	printf("%d\n", counter);
	
- First string contains characters to print and formatting directives for variables
- %d is for decimal ints, %l for doubles

		scanf("%d", &startPoint);
		
	- String contains formatting directives for parsing input
	- Call says to read a decimal integer and assign it to the variable startPoint
	
#### Memory

- C's memory model matches the underlying (virtual) memory system
	- Array of addressable bytes
- Variables are simply names for contiguous sequences of bytes
	- \# of bytes given by var type
- Compiler translates names to addresses
	- Typically maps to smallest address
	- Compiler and OS in tandem decide how these processes are handled
	
#### Pointers

- A pointer is just an address
- Can have variables of type pointer
	- Hold addresses as values
	- Used for indirection
- When declaring a pointer variable, need to declare the type of the data item the pointer will point to

		int *p; /* p will point to an int data item */
- Pointer operators
	- De-reference: *
		- *p gives the value stored at the address pointed to by p
		- Printing p will give you the *value* stored at the **address** stored in P.
	- Address: &
		- &v gives the address of the variable
		
##### Pointer Example

	int i;
	int *ptr;

	i = 4; \\store value 4 into memory loc. ass. w/ ptr
	ptr = &i; \* store addr of i into memory loc. ass. w/ ptr *\
	*ptr = *ptr + 1; \* read contents of memory at addr. stored in ptr and store result into memory at the addr. stored in ptr *\
	
	i = 5 [4300] <--- ptr = 4300 [4304]
	
- if you didn't de-reference ptr and increment it, you would increment the value stored in ptr by the # of bytes needed to allocate memory for it.

		ptr = ptr + 1;
		
		ptr = 4304 [4304]
		
---
### 2/6/14

### Recitation

- Makefile - automatically make executables

File: makeFile
		
		all: 
		hello.o: hello.c
			gcc -ansi -pedantic -Wall -c
		
		hello: hello.o
			gcc -o hello hello.o
			
		clean:
			rm -f hello
- Memory Model
	- Two types: static vs. dynamic
		- Stack vs. Heap
		- Activation record is the dynamic memory associated with the heap
	- Automatic space
		- int A[100]
			- allocated when method is called, freed when released
	- Allocated space
		- malloc
		- calloc
		- free
	- See man malloc

File: alloc.c
	
			#include <stdio.h>
			#include <stdlib.h>
			
			int main(int argc, char *argv[]) {
				int num = atoi(argv[1]);
				int *i = NULL;
				
				i = malloc(size * (sizeof(int)));
				
				for(int j = 0; j < num; j++)
					printf("%d\n", i[j]);
					
				free(i);
				return 0;
				}
---

### 2/11/14

#### Allocating Space for Variables

#### Dynamic Allocation

- Use if we want memory area whose:
	- Lifetime does not match any particular function
- Another area region of memory exists, it is called the **heap** or **run-time heap** (not related to min/max heaps)
	- Dynamic request for memory are allocated from this region
	- Managed by run-time system (fancy name for library linked with all C code)
	- Use **malloc** for this

##### Problems that you can run into
- **Segmentation faults** are a catch-all for any kind of error 
- a **memory leak** is when you forget to free memory.
	- This results in more data being sent to disk
	- This slows down your processing speed by about *4-5 orders of magnitude*
	
#### malloc

- Standard C Library provides a function for dynamic memory allocation
		
		void *malloc(int numBytes);
	
- pointer is void because it can be used for any type of variable
- malloc() and free() manage the **heap**
- malloc() allocates a contiguous region of memory of size numBytes if there is enough free memory and returns a pointer to the beginnning of this region
	- Returns NULL if insufficient free memory
- How do we know how many bytes to allocate?

	Function:
	
		sizeof(type)
		sizeof(variable)
		
- Allocate right number of bytes, then cast to the right type
	
		int *numbers = (int *)malloc(sizeof(int) *n);
		
#### free

- Once a dynamically allocated piece of memory is no longer needed, you need to release it
	- Have finite amount of memory
	- If you don't release, you will eventually run out of heap space/cause a memory leak
	
	Function:
	
		void free(void*);
		
##### Example

	int airbornePlanes;
	struct flightType* planes;
	
	printf("How many planes are in the air?");
	scanf("%d", &airbornePlanes);
	
	planes = (struct flightType*)malloc(sizeof(struct flightType) * 
	airbornePlanes); 
	
	//if allocation fails, malloc returns NULL
	if (planes == NULL) {
		printf("Error in allocating the data array.\n");
		...
		}
	planes[0].altitude = ...
	...
	free(planes);
	
#### typedef

- **typedef** is used to name types (for clarity and ease-of-use)
	
		typedef <typedef><name>;
		
	Examples:
	
		typedef int Color:
		typedef struct flightType WeatherData
		typedef struct ab_type {
			int a;
			double b;
			} ABGroup;
			
---
### 2/18/14
			
#### Preprocessor

- C compilation uses a preprocess called cpp
- The preprocessor manipulates source code in various ways before the code is passed through the compiler
	- Preprocessor is controlled by *directives*
	- cpp is pretty rich in functionality
- Our use of the proprocessor will be pretty limited
	- \#include <stdio.h>
	- \#include "myHeader.h"
	- \#ifndef MY_HEADER_H

		\#define MY_HEADER_H
	
		\#endif /\* MY_HEADER_H \*/	
- Much useful functionality comes from **Standard C Library**

#### Command Line Arguments

- When using a shell

		$ hello 5
		
	Entire command line will be given to your program as a sequence of strings
- White spaces are typically the delimiters
	- Shell dependent
	
#### File I/O

- A file is a contiguous set of bytes
	- Has a name
	- Can create, remove, read, write, and append
- Unix/Linux supports persistent files stored on disk
	- Access using system calls: open(), read(), write(), close(), create(), lseek()
	- Provide random access
	- Section 2 of online manual (man)
- C supports extended interface to UNIX files
	- fopen(), fscanf(), fprintf(), fgetc(), fputc(), fclose()
	- View files as streams of bytes
	- Section 3 of man
- Open a file with *fopen()*, read or write with *fscanf()* and *fprintf()*

- Each program has three standard streams for input, output, and errors
	- stdin, stdout, stderr

---
### 2/20/14
## [Number Representation](id:anchor2)

- What do computers do?
	- Maniplate stored data
- We follow what is known as **Von Neumann architecture** ![Von Neumann Architecture](http://www.cise.ufl.edu/~mssz/CompOrg/Figure1.8-vonNeumannArch.gif)

##### Converting Number Systems  

- Value of binary number can be computed as $$$\sum_{i=0}^n{d_i\times2^i}$$$
- When converting to decimal take the modulo 2 and use the remainder to determine the base digit (1 or 0).
- When converting to hex (base 16) chunk them into groups of 4, working from the right b/c $$$2^4=16$$$
	- Do the same but with chunks of three for octal
- binary and hex are represented in the following:

Binary | Hex | Octal
------ | --- | -
0b1101 | 0x5c | 0o03 
		
- General formula for number systems: $$\sum_{i=0}^n{d_i\times \text{base}^i}$$

##### Big Endian vs Litle Endian

- Whenever you have multiple bytes of numbers, most significant bit is on the left for **Big Endian**, least significant bit is left for **Little Endian**

#### How to represent additional numbers

- Represent negative #'s by complementing positive numbers
- Flip the one's and zero's | take the unary complement operator ~
	- ~1100 = 0011 | one's complement


##### Two's Complement 

- One's complement plus one
- Most significant bit still gives the "sign"

##### Numerical Value of Two's Complement

- Given a two's complement number of length $$$n$$$, writen as $$$d_{n-1}\dots d_1\,d_0$$$
	- It's value is interpreted as $$$-d_{n-1}2^{n-1}+\sum\_{i=0}^{n-2}d_i\,2^i$$$
	- Range of values is then $$$[-2^{n-1},2^{n-1}-1]$$$
	
##### Floating-point

- Can be represented in scientific notation
- Same with binary
- IEEE floating point standard
	- 3 widths for floating-point
		- Single (32 bits)
		- Double (64 bits)
		- Extended (80)

##### Floating point in C

- 32 bits single precision (type float)
	- 1 bit for sign, 8 bits for exp, 23 bits for mantissa
	- Range is from $$$[-2^{16}, 2^{16}-1]$$$
- 64 bits double precision (type double)
	- 1 bit for sign, 11 bits for exponent, 52 bits for mantissa
	- Majority of bits for mantissa = higher precision
- Decimal to IEEE Floating point
	- 5.625 in binary is $$$101.101\to 1.01101\times 2^2$$$
	- Exponent field has value 2
		- add 127 to get 129
	- Exponent is 10000001
	- Mantissa is 01101
	- Sign bit is 0
	$$\color{blue}0\color{green}{10000001}\color{red}{0110100000000000000000}$$

---
### Recitation

- See LL program

---
### 2/25/14

### Computer Arithmetic

- How to deal with overflow
	- When you add 2 n-bit numbers together, you may end up with an n+1-bit number
	- An **overflow** occurs when the result cannot fit within the size limit of the data type.
- modulo
- Understand 1's complement, 2's complement

## [Assembly Programming](id:anchor3)

- Machine interface: where software meets hardware
- To understand how the hardware works, we have to understand the interface that it exports
- We are covering x86, which is not the only assembly language
	- Mobile CPUs do not use x86
- **Registers:** high-speed, small, memory units in the CPU
- Initially, the set of registers in the instruction set (**ISA**) is what was present in the processor

#### Assemble Programer's Units

- [insert diagram of computer]

---
### 2/27/14
### Assembly

#### Instruction Format

- General format:

		opcode operands
	
	- Opcode:
		- short operands for instruction's purpose
			- movb, addl, etc.
	- Operands:
		- Immediate, register, or memory
		- Number of operands command-depenent
		
Example:
	
	mol %ebx, (%ecx)

#### Machine Representation

- Each assembly instruction translated to a sequence of 1-15 bytes

		opcode byte | addressing modebyte | other bytes
		
- Most common instruction is data transfer instruction
	- mov S, D
		- Copy value at *source* to *destination*,
		
	- Used to copy data from:
		- Memory to register
		- Register to memory
		- Register to register
		- Constant to register
	- No memory to memory or constant to memory

- **Load:** register to memory
- **Store:** memory to register (move farther away from CPU)

#### Data Formats

1. Byte: 8-bits
- Word: 16-bits (2 bytes)
- Double Word: 32-bits (4 bytes)
- Quad Word: 64-bits (8 bytes)
- Instructions can operate on any data size

End character specifies what data size to be used

#### x86 Registers

- General purpose are 32 bit
- Originally categorized into two groups with different functionality
- Data registers (EAX, EBX, ECX, EDX)
	- Holds operands
- Pointer and Index registers (EBP, ESP, EIP, ESI, EDI)
	- Holds references to addresses as well as indexes
	
#### Addressing

- Immediate Addressing
- Direct Addressing
- Register Mode Addressing
	- %denotes register (%eax)
	
##### Using Simple Addressing Modes

C Program:
	
	void swap(int *xp, int *yp) {
		int t0 = *xp;
		int t1 = *yp;
		*yp = t1;
		*xp = t0;
	}
		
Assembly equivalent:

	swap:
	//set up
	push1 %ebp
	mov1 %esp, %ebp
	push1 %ebx
	//body
	mov1 12(%ebp), %ecx
	mov1 8(%ebp), %edx
	mov1 (%ecx), %eax
	mov1 %eax, (%edx)
	mov1 %ebx, (%ebx)
	//finish
	mov1 -4(%ebp), %ebx
	mov1 %ebp, %esp
	pop1 %edp
	ret
	
---

### 3/11/14

### Assembly Programming II

#### IA32 Stack

- Region of memory associated with stack discipline
- Grows towards lower addresses
- Associated with function
	- Stores return values, local vars, parameters, return addresses
	- Register %esp indicates lowest stack address
		- address of top element
- Pushing
	- pushl src
	- Write operand to address given by %esp
	- Decrement %esp by 4 
- Popping
	- popl dest
	- Read operand at address given by %esp
	- Increment %esp by 4
	- Write to Dest

#### Procedure Control Flow

- Use stack to support procedure call and return
- Procedure call:
	- call label: Push return address on stack; Jump to label
- Return address value
	- Address of instruction beyond call
	- Example from diassambly
	804854e: e8 3d 06 00 00		call 8048b90 <main>
	8048553: 50					push %eax
		- return address = 0x8048553
	
- Procedure return:
	- ret:	Pop address from stack; Jump to address
	
%eip is program counter

##### Stack-based Languages

- Pascal, C, Basic

#### Stack Frames

- %ebp is Frame Pointer
- %esp is Stack Pointer
- Space is allocated when you enter a procedure, dealloced when you return

- **Clobber**

#### IA32/Linux Register Usage

- Integer Registers
- Two have special uses
	- %ebp, %esp
- Three managed as callee-save
	%ebx, %esi, %edi
- The Stack makes Recursion work
	- Private storage for each instance of a procedure cal
		- Instantiations don't clobber each other
		- Addressing of locals + arguments can be relative to stack positions
	- Can be managed by stack discipline		
	- Procedures return in inverse order of cells
- IA32 Procedures Combination of Instructions + Conventions
	- Call/Ret instructions
	- Register usage conventions
		- Caller/Callee save
		- %ebp and %esp
- Activation record is the part of the stack that keeps track of the state of your shit

- Reminder: Stack grows toward smaller addresses, heap grows toward larger addresses

---
### 3/25/14
### Pointers and Data Structures

#### 2D Arrays

- 2D arrays are just a series of pointers to 1-D arrays

#### Structs

- Structs must have offsets which satisfy element's alignment requirement
- Overall Structures Placement
	- Each stucture has alignment requirement K
		- Largest alignment of any element
	- Initial address & structure length must be multiples of K
	
Ex:


char | padding | int[0] | int[1] | padding | double
:--- | :--     | :----- | :----- | :---    | :-----
x    | 000     | xxxx   | xxxx   | 0000    | xxxxxxxx

---

## [Digital Logic](id:anchor4)

**Levels of Computer Architecture**

- Algorithms
	- Applications
		- Compilers
			- OS
				- ISA (Instruction Set Architecture)
					- $$$\mathrm{\mu}$$$Arch
						- RTL (Register Transfer Level)
							- VLSI (Very-Large-Scale Inegration)
								- Device Physics
								
-  RTL makes blocks of transistors to form arithmetic logic units
- ISA contains the language which the OS and Compiler will follow
- Computer Architecture is traditionally the study of the interaction between hardware and software (ISA and $$$\rm{\mu}$$$Arch)
- Backwards compatibility exists because computer architecture is ** *split* ** into stratifications of black-box engineering.
- Two kinds of logic: *sequntial logic* and *combinatorial logic* <-- we will focus on this for digital logic

### MOS Transistor

- Two types: n-type and p-type transistors

### Logic Gates

- Use transistors to implement logical functions: AND, OR, NOT
- Digial symbols

- Inverter (NOT Gate)

	- Inverts the signal being sent

In | Out	| In	| Out	|
:--|:------	|:-----	|:-----	|	
0V | 2.9V	| 0		|	1	|
2.9V | 0	| 1		|	0	|

- NOR Gate (OR-NOT)
- AND Gate
- NAND Gate (AND-NOT)

#### Basic Logic Gate Symbols

![Add example from slides](https://raw.githubusercontent.com/Scorpio750/Computer-Architecture-211/master/Images/Basic%20Logic%20Symbols.png)

#### Decoder

- $$$n$$$ inputs, $$$2^n$$$ outputs

#### Multiplexer (MUX)

- $$$n$$$-bit selector and $$$2^n$$$ inputs, one output
	- Output equals one of the inputs, depending on selector
	- Similar to a switch statement
	
---
### 3/27/14

#### Full Adder

[example from slides]

- S will be 1 if there are an odd # of '1's among the input parameters
	- This is the same thing as taking $$$A\oplus B\oplus \dotso \oplus N$$$ due to binary arithmetic
	
#### Converting Truth Table to Boolean Expression

- Given a circuit, isolate the rows in which the output of the circuit should be *true*
- A product term that contains exactly one instance of every variable is called a *minterm*

#### K-Map

[insert slide]

- Look at the groupings of 1's
- No diagonal groupings, but you can have block groupings
- **Grey-Code Sequence:**

---
### 4/8/14

- **How to calculate gate delay for adders:**
	$$G=2n-1\text{ for } n \text{ bits}$$ for only sum bits. If we are interested in overflow as well, it will be $$$2n+1$$$.
	
#### Carry Lookahead Adder (CLA)

- Goal: produce an adder circuit of shorter dephth
- Mechanism: rewrite the carry function
\\[\begin{align}
c\_{i+1} &= a_ib_i + a_ic_i + b_ic_i \\\
&= a_ib_i + c_i(a_i+b_i) \\\
&= g_i + c_i(p_i) \\\
c_1 &= a_0b_0 + a_0c_0 + b_0c_0 \\\
&= g_0 + c_0p_0 \\\
c_2 &= g_1 + c_1p_1 \\\
&= g_1 + (g_0 + c_0p_0)p_1 \\\
c_2 &= g_1 + g_0p_1 + c_0p_0p_1 \\\
c_3 &= g_2 + g_1p_2 + g_0p_1p_2 + c_0p_0p_1p_2 \\\ 
\end{align}\\]

Carry Generate | Carry Propogate
:-|:-
$$$g_i = a_ib_i$$$ | $$$p_i = a_i + b_i$$$

- A **CLA** is must more efficient than a ripple carry

### Sequential Logic

- Latches
	- Set/Reset Latch
	- Flip-Flop
	
---
### 4/21/14

## [Memory Hierarchy and Caching](id:anchor5)

- In increasing order of $$$\mathrm L_i$$$, where L0 is the registers
- Computers usually have 128-256 registers
- L1, L2, L3 all caches 
	- L1 has 32 Kb, 1-2 clock cycles
	- L2 has 62-128 Kb, 4-8 clock cycles
	- L3 has about 32 Mb 30-40 clock cycles	

##### Table of Memory Storage in Caches

L1 | L2 | L3 |
---|----|----|
32kB | 256kb | 8-32 MB |
1-2 cc | 4-8 cc | 30-40 cc|

- Everything under L3 (L4, L5) is hardware
- It takes billions of cycles to retrieve memory from disk
- Hardware is a static design type

##### Locality

- Two kinds of locality: temporal and spatial
- Temporal locality
	- Using an element that you used in the past again
		- For loops
		- Instruction fetches in loops
	- Using data items at approximately similar memory addresses
	
CPU | L1 | L2 | L3 | Mem
----|----|----|----|-----
RF  | $  | $  | $  |

- **Inclusive Structure:** Every higher level of cache copies everything in the lower-level caches
- **Exclusive Structure:** Every higher level of cache has its own info
- Keep a separate *dirty bit* to flag whether or not that cache has been updated
	- Called a **write-back cache**
- **Cache line/cache block** is a a storage block of about 64-128 bytes to designate spatial locality
- Every load/store that requires memory access 
- Every memory reference must have an L1 lookup.
- If you find the item you are looking for, you have a *cache hit*; otherwise, you have a *cache miss*, and you have to go one level down.

- Every cache is a *cuckoo hash table*, a hash table of limited size/bucket size
- This cache is divided into columns of **ways**, and rows of **sets**
	- *Ways* all have to have an equal size
	- Has *address:value* pairs
		- Hash your address to a *set*, which has a bucket of *way*
- Total # of entries in your cache is $$$m \times n$$$ for *m* **sets** and *n* **ways**
- If you have only one way per set, you have a **direct map cache** 
- If you only have one set, you have a **fully associative cache**
- For an **n-way associative** set, you have n *ways* for *m* sets

---

### 4/29/14

#### L1 Cache

![insert picture from slides](https://raw.githubusercontent.com/Scorpio750/Computer-Architecture-211/master/Images/L1%20Cache.png)

#### Cache Mapping

- Multiple locations in memory map to the same location in cache
- In addition to content, cache must keep which entry it is actually caching 
- Since caches are much faster, but smaller, you store the address of the memory location for faster lookup

#### Indexing

- We use middle bits as an index because if we used high-bit indexing, it would result in a 100% LOAD miss [see picture from slides]

- for Intel's P4 L1 cache with 8kB/4-way/64b Block, with 32 sets, you have 5 s-bits, 6 t-bits, and 21 tags

#### Replacement

- What if you have a cache miss but all entries in the set are valid?
- Direct-mapped cache: no decision
- Discard current content and bring needed content in
- But which line do we evict?
	- We need an algorithm for replacemnt
- If we knew the future, can you think of an optimal replacement algorithm?
- Since we are oracles, we need to approximate:
	- FIFO
	- LRU: Least Recently Used
	- Random: Select victim from set randomly
	
#### Fully Associative Caches

- For a fully associative cache, set selection is trivial (there is only one)
- Accessing line is the same as a set associative cache
- Most flexible, (good for complex access patterns)

#### Writes and Cache

- Reading information from a cache is straightforward
- What about writing?
- What if you're writing data that is already cached (write-hit)?
- What if the data is not in the cache (write-miss)?
- Dealing a **write-hit**:
	- **Write-through**: immediately write data back to memory
	- **Write-back**: defer the write to memory for as long as possible
	
- Dealing with a **write-miss**:
	- **write-allocate:** load the block into memory and update
	- **no-write-allocate:** writes directly into memory

---
## [Final Review](id:anchor6)


#### Excitation Tables

Current State | Next State | D | T | Set | Reset | J | K
--------------|------------|---|---|-----------|---
0 | 0 | 0 | 0 | 0 | X | 0 | X
0 | 1 | 1 | 1 | 1 | 0 | 1 | X
1 | 0 | 0 | 1 | 0 | 1 | X | 1
1 | 1 | 1 | 0 | X | 0 | X | 0
