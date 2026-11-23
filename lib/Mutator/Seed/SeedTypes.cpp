//===- SeedTypes.cpp - Seed dialect types ---------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "Mutator/Seed/SeedTypes.h"

#include "Mutator/Seed/SeedDialect.h"
#include "mlir/IR/DialectInterface.h"
#include "mlir/IR/DialectImplementation.h"
#include "llvm/ADT/TypeSwitch.h"

using namespace mlir;
using namespace mlir::mutator;

#define GET_TYPEDEF_CLASSES
#include "Mutator/Seed/SeedOpsTypes.cpp.inc"

void SeedDialect::registerTypes() {
  addTypes<
#define GET_TYPEDEF_LIST
#include "Mutator/Seed/SeedOpsTypes.cpp.inc"
      >();
}
