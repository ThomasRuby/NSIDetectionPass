# A LLVM pass to detect Non-Size-Increasing functions

**This is a proof of concept**

This pass implements a static analysis using LLVM

This analysis provides a pessimistic outer bound of heap allocation
memory. In some cases, it can answer to the following question:

*"Is the function Non-Size-Increasing?"*

This pass has been tested on a simulated stack machine implemented in C

It can be seen as a tool to detect memory leak but overall it can
provide certifications

## Build

See the following documentation to generate the .so 
http://llvm.org/docs/WritingAnLLVMPass.html

## Run

>   $ opt -load {llvm_build_path}/lib/LLVMNSIDetection.so -GimmeWeight < myIRprog.ll > /dev/null

## Some Details…

This pass enriches the CFG with a weight regarding to the heap
allocations. Further, it computes the maximum weight (worst case) on
this weighted graph using the Bellman-Ford algorithm.

This work has been done during my
[thesis](https://lipn.univ-paris13.fr/~rubiano/) at the LIPN -
Université Paris 13.
Funded by the [ELICA ANR project](https://lipn.univ-paris13.fr/~mazza/Elica/)
