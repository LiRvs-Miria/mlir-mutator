
# Fuzzer entry: exports the strong LLVMFuzzerCustomMutator symbol that
# libFuzzer resolves at link time. Kept free of MLIR dependencies so the
# wiring slice builds while the dialect libraries are still in flux.
add_library(MutatorFuzzer STATIC FuzzerCustomMutator.cpp)
