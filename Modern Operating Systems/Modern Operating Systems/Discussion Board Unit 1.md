To fully understand the difference between a single-core/single-process
operating system and a multi-core/multi-processor operating system, I
think it would be best to start by defining what an operating system is
and what its responsibilities are. According to Stallings, (2018, p. 41)
an operating system utilizes the hardware of a machine for processes in
such a way that it obfuscates the intricacies of managing resources,
memory, security, and scheduling from the user or developer.

A single-core operating system is a system that can only manage a single
process at a time. Although the system can only offer memory, threads,
I/O access, and its single processing core to one process at a time,
this doesn\'t mean that that process can\'t be interrupted during a
blocking phase for another process. A multi-core operating system can
manage multiple processes concurrently, meaning that one process can be
ran on a core at the same exact time as another process on a separate
core. A single processor operating system refers to a system with a
single CPU. This CPU can be single-core, or multi-core, but there is
only a single central processing unit in the system. A multi-processor
operating system refers to multiple CPUs tethered together in a single
system. Again, these CPUs can be single-core or multiple-core, but the
system itself is capable of hosting multiple CPUs.

As with anything, there are merits and pitfalls to both the multi-core
operating system and the multi-processor operating system. A "Multicore
Processor" refers to a single chip that has more than one processing
core integrated into a single die. Each processing core can operate
distinctly from its sibling cores, allowing the system to operate as
though it has multiple processors. (Stallings, 2018, p.29) Here are
three main advantages of a multicore system over a single core system:

1.  Performance: A multicore system will outperform a single core system
    in that it has more processing capacity with the additional embedded
    processing core. This is due to the added capability to process a
    single task in parallel on multiple processing cores, or multiple
    distinct tasks concurrently on multiple processing cores.

2.  Efficiency: A multicore system is more efficient in that it can
    delegate the task to be processed by parallel processing cores.
    Therefore, it takes less energy to perform a task than it would to
    do so on a single core. A multicore environment can also perform
    more tasks in low power consumption mode by using multiple
    processing cores. (GeeksforGeeks, 2020)

3.  Multitasking: On a single core system, the machine can only operate
    on one action at a time. In a multicore system, the machine can
    handle multiple tasks independently, allowing for multiple
    applications to be ran concurrently without a loss in performance.

There are two common types of Multiprocessor systems, Symmetric and
Asymmetric. Symmetric Multiprocessing refers to a system where multiple
identical self-scheduling processors are tethered to shared memory and
I/O resources. Asymmetric Multiprocessing is a system where there is a
master processor that manages scheduling and operating system tasks, and
the other companion processors respond to tasks distributed by the
master processor (GeeksforGeeks, 2019). Regardless of which
Multiprocessing system is being used, here are some benefits of using a
multi-processor system over a single-processor system:

1.  Performance: A system with multiple processors can out-compete a
    system with a single processor due to its additional hardware.
    Having two processors over one doesn't necessarily mean twice the
    processing power though. And like many things, the continued
    addition of processors suffers from the law of diminishing returns.
    "Amdahl's Law" (Stallings, 2018, E-2) states that the speed of a
    process is dependent upon the sequential parts of the program, and
    at some point the added value of another processor doesn't outweigh
    the limitation of sequential processing.

2.  Availability: Since the system has multiple processors, if a single
    processor has a hardware malfunction it won't stop the entire system
    from performing. Instead, the other processors can handle the load
    of the fallen one at the cost of some performance.

3.  Scalability and Growth: Performance of the system can be increased
    by simply adding another processor to the system. As stated earlier,
    there may be limitations to this as we approach higher numbers of
    processors.

Stallings, W. (2018). Operating Systems: Internals and Design
Principles. Pearson Education Inc.

Advantages and Disadvantages of Multicore Processors. (2020, December
20). GeeksforGeeks.
https://www.geeksforgeeks.org/advantages-and-disadvantages-of-multicore-processors/

Difference between Asymmetric and Symmetric Multiprocessing. (2019,
September 4). GeeksforGeeks.
https://www.geeksforgeeks.org/difference-between-asymmetric-and-symmetric-multiprocessing/
