//===- FuzzerCustomMutator.cpp - LLVMFuzzerCustomMutator stub ---------------===//
//
// Part of the mlir-mutator project under the Apache License v2.0 with LLVM
// Exceptions. See the LICENSE file for details.
//
//===----------------------------------------------------------------------===//

#include <cstddef>
#include <cstdint>

extern "C" std::size_t LLVMFuzzerCustomMutator(std::uint8_t *, std::size_t,
                                               std::size_t, unsigned) {
  return 0;
}
