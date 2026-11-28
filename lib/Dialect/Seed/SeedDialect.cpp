//===- SeedDialect.cpp - Seed dialect --------------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "Dialect/Seed/SeedDialect.h"
#include "Dialect/Seed/SeedOps.h"
#include "Dialect/Seed/SeedTypes.h"

using namespace mlir;
using namespace mlir::mutator;

#include "Dialect/Seed/SeedOpsDialect.cpp.inc"

//===----------------------------------------------------------------------===//
// Seed dialect.
//===----------------------------------------------------------------------===//

void SeedDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "Dialect/Seed/SeedOps.cpp.inc"
      >();
  registerTypes();
}
