//===- SeedDialect.cpp - Seed dialect --------------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "Mutator/Seed/SeedDialect.h"
#include "Mutator/Seed/SeedOps.h"
#include "Mutator/Seed/SeedTypes.h"

using namespace mlir;
using namespace mlir::mutator;

#include "Mutator/Seed/SeedOpsDialect.cpp.inc"

//===----------------------------------------------------------------------===//
// Seed dialect.
//===----------------------------------------------------------------------===//

void SeedDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "Mutator/Seed/SeedOps.cpp.inc"
      >();
  registerTypes();
}
