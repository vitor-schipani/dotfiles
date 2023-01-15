# Notes from Introduction to Operating Systems
# Book: Introduction to operating systems

# Chapter 1: Computer-System organization
## 1.2.2: Storage Structure
Hierarchy of speed (fastest to slowest)

    > registers (fastest)
    >> cache
    >>> main memory
    **** (division from main memory to secondary memory) ****
    >>>> solid-state disk
    >>>>> magnetic disk
    >>>>>> optical disk
    >>>>>>> magnetic tape (slowest)

## 1.5.1: Dual-Mode and Multimode Operation
Operating systems have multiple modes of operation and 
use hardware support to enforce these modes.

At the very least there are two modes:
    User mode
    Kernel mode

The system sets a bit called the 'mode bit' to indicate the
current mode of operation.

Certain operations are protected and only available through
operating system API calls. Those calls are then handled
by the OS which has privileged access.

## 1.6 Process Management
A program in execution is called a process.
It is possible to have several processes running originating
from the same program. 

Hence the program is the "inactive" version and the process is the
"active" version of software.

The process is the unit of work on an OS. And the system is 
simply a collection of processes. Some processes are run by
the OS and others by the users of the system.

## 1.7 Memory Management
Main responsibilities of the OS:
    Keeping track of which parts of memory are being used and
    who is using them.
    Deciding what to move in and out of memory.
    Allocating and Deallocating memory space as needed.

## 1.8 Storage Management
### 1.8.1 File-System Management
Main responsibilities of the OS:
    Creating and deleting files/directories
    Support primitives for manipulating files and directories
    Mapping files onto secondary storage
    Backing up files on stable storage
## 1.8.2 Mass-Storage Management
Main responsibilities of the OS:
    Free-space management
    Storage Allocation
    Disk scheduling

# Chapter 2: Operating-System structures
Operating systems can be viewed from 3 different angles that
will be explored in the next sections.
## 2.1: Operating-System Services
Elements the OS provides:
    User interface
    Program execution
    I/O operations
    File-system manipulation
    Communications
    Error detection

Elements the OS have for optimizing itself:
    Resource allocation
    Accounting (who's using what resources)
    Protection and Security

## 2.2: User and Operating-System interface
### 2.2.1: Command Interpreters
Those are the different "shells" that the user can interact with
to perform system calls. On Unix the shell only calls other programs
and does not contain the programs itself.

### 2.2.2: Graphical User Interfaces
Those are graphical ways of interacting with the system, usually
also requiring a mouse or in the case of mobile systems gestures
using a touchscreen.

## 2.3: System Calls
Usually OS makes certain services available through interfaces.
The routines themselves are implemented in C and C++ or even
assembly-language itself.

Even simple programs can be composed of hundreds or thousands of
system calls, but most programmers don't see this level of detail
because the system calls are hidden by the provided OS API.

## 2.4: Types of System Calls
System calls can ber grouped into six major categories that
will be explored ahead.

### 2.4.1: Process Control
Examples of system calls:
    end, abort
    load, execute
    create process, terminate process
    get process attributes, set process attributes
    wait for time
    wait event, signal event
    allocate and free memory

### 2.4.2: File Management
Examples of system calls:
    create file, delete file
    open, close
    read, write, reposition
    get file attributes, set file attributes

### 2.4.3: Device Management
Examples of system calls:
    request device, release device
    read, write, reposition
    get device attributes, set device attributes
    locally attach or detach devices

### 2.4.4: Information Maintenance
Examples of system calls:
    get time or date, set time or date
    get system data, set system data
    get process, file, or device attributes
    set process, file or device attributes

### 2.4.5: Communications
Examples of system calls:
    create, delete communication connection
    send, receive messages
    transfer status information
    attach or detach remote devices

### 2.4.6: Protection
Examples of system calls:
    get_permission, set_permission

## 2.5: System Programs
System Programs or System utilities are provided by the OS as
a means of interacting indirectly with system calls. They can be
grouped into some categories:

    - File Management
    - Status Information
    - File Modification
    - Programming-language support
    - Program loading and execution
    - Communications
    - Background services

## 2.6: Operating system design and implementation
OSes are very different because their requirements are not trivial.
On the design phase usually we focus on the **policies** (what) 
and not on the **mechanisms** (how). 
Because policies will be enforced through code later on based on the
policies of the design phase.

The implementation of an operating system is usually done by dozens
of programmers working on several programs over a long period of time.

Here, having systems written in higher level languages such as C or C++
is useful because if you use low level languages that are processor-
specific then the system is harder to write and to port to other
systems.

## 2.10: System Boot
The bootstrap program is usually located in Read-Only Memory (ROM).
Forms of ROM are called "firmware" and sit at the interface of
Hardware and Software.
After the bootstrap program executes and finds the operating 
system kernel then it loads it into memory and the system is said 
to be running.

# Part 2 - Process Management
# Chapter 3 - Processes
Processes are the basic unit of work of the modern OS.

Usually the word "Process" is more appropriate for running programs.
The word "Job" was once used but today is more often associated with
Job scheduling.

## 3.1: Process Concept
### 3.1.1: The Process
A process is not only the text (source code) but also several other
pieces such as the contents of the stack, heap, data, and processor
registers.


    MAX MEMORY LOCATION     -----------------------
                                    STACK
                            -----------------------
                                      V
                                      V
                                      V



                                      ^
                                      ^
                                      ^
                            ----------------------
                                     HEAP
                            ----------------------
                                     DATA
                            ----------------------
                                 SOURCE CODE
    ZERO MEMORY LOCATION    ----------------------


### 3.1.2: Process State
Programs can be in several states depending on their lifecycle:
    - New
    - Running
    - Waiting
    - Ready
    - Terminated

### 3.1.3: PCBs (Process Control Blocks)
Each process is represented by a PCB which is a collection of
data important to the program execution:

    - Process State (New, Running, ...)
    - Program Counter (where in memory the next instruction is)
    - CPU Registers (specific to each CPU architecture)
    - CPU-scheduling information
    - Memory-management information
    - Accounting information
    - I/O Status Information

This architecture allows programs to be stopped and reinitialized
in a manner that is convenient to the processor.

### 3.1.4: Threads
Programs can support multiple threads so several tasks can be
completed at the same time.

## 3.2 Process Scheduling
There are several queues that the CPU manages so it can process
several programs at the same time in an efficient manner.

## 3.3 Operations on Processes
On Unix processes have unique IDs called "pid".
The init process is the parent of all processes and has pid = 1.

Other processes can also spawn their own children and one can be
dependent on another.

## 3.4 Interprocess Communication
    <MUST STILL READ THE REST OF THIS CHAPTER>

# Chapter 4: Threads
Threads are ways of a process multiplying itself and increasing
responsiveness, resource sharing, economy and scalability.

This is accomplished by having a single program spawn multiple threads
and threads themselves sharing all source code and Heap data of the
process but having their own Register and Stack.


    MAX     ---------|---------|---------
              STACK  |  STACK  |  STACK
            ---------|---------|---------
                V    |    V    |    V
                V    |    V    |    V
                V    |    V    |    V
            -----------------------------
                          ^
                          ^
                          ^
            ------------------------------
                         HEAP
            ------------------------------
                         DATA
            ------------------------------
                     SOURCE CODE
    ZERO    ------------------------------


**Concurrency != Parallelism**
Threads are concurrent if they are interleaved and when one thread
can't make progress for some reason you switch to another thread.

Parallel threads are just threads that run on different cores, but
it is possible to have parallelism without concurrency and vice-versa.

Amdahl's law states that performance gains from additional computing
cores (with both nonparallel and parallel components).
If S is the portion that must be performed serial (nonparallel) then:

                     1
    speedup <=  ------------
                S + (1 - S)
                    -------
                       N

## 4.3 Multithreading models
Threads exist at the user level but need to be sent to the kernel level.

User-level threads are visible to the programmer but unknown to the
Kernel. In general it is quicker to create user threads since the
kernel doesn't have to be involved, but eventually the thread must be
converted to a Kernel thread.

You can do many-to-one, many-to-many or one-to-one of those associations.
One to One gives true concurrency but can be expensive for the system.

## 4.4 Thread Libraries
There are well-known kernel level libraries to implement threading.

    Pthreads - Used mostly on Linux and Unix based systems (MacOSX)
    Windows Threads - Used by Windows
    Java Threads - Implemented in the JVM.

For Java threads the specific way the JVM does things depend on the
system, therefore it varies for each implementation.
So for Java threads they are actually using the underlying OS
utilities (either Pthreads or Windows threads).

## 4.5 Implicit Threading
Implicit Threading is the technique of making the operating system
automatically optimize the program and create the threads itself
instead of the programmer.

### 4.5.1 Thread Pools
Many threads are already pre-created in the system and exist in
a limited number and are used by the system and given back by the
pool as programs are executed.
This prevents infinite threads that may exhaust the system resources.

### 4.5.2 OpenMP
Allows programmers to highlight to the compiler parallel sections of
code that are then optimized for runtime.

### 4.5.3 Grand Central Dispatch
Used by Mac OS and iOS that identifies pieces of code with "blocks"
and queues those "blocks".

## 4.6 Threading Issues
### 4.6.1 The fork() and exec() System Calls
When forking a process do you fork only the calling thread
or all threads for that process? Unix decided to have two
separate system calls for each one.

### 4.6.2 Signal Handling
Processes can send signals to itself (in the case of executing a
division by zero for example) this is an example of a Synchronous
signal since it is received at the same time it is generated.

But may a process may also receive signals from other processes 
(such as getting stopped by Ctrl+C) and that is an example of
Assynchronous signals.

Programs have default signal handlers (the kernel runs them) but
can also be overriden by the user.

Usually synchronous signals are delivered only by the thread that
generated them. But some other assync signals are delivered to all
threads (Ctrl+C for example kills the entire program, including all
threads).




