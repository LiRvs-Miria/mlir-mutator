//===- SeedTypes.h - Seed dialect types -----------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef MUTATOR_SEEDTYPES_H
#define MUTATOR_SEEDTYPES_H

#include "mlir/IR/QuantStorageTypeInterface.h"
#include "mlir/IR/BuiltinTypes.h"

#define GET_TYPEDEF_CLASSES
#include "Dialect/Seed/SeedOpsTypes.h.inc"

#endif // MUTATOR_SEEDTYPES_H
