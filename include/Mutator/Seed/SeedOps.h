//===- SeedOps.h - Seed dialect ops ---------------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef MUTATOR_SEEDOPS_H
#define MUTATOR_SEEDOPS_H

#include "mlir/IR/QuantStorageTypeInterface.h"
#include "mlir/IR/DialectInterface.h"
#include "mlir/Bytecode/BytecodeOpInterface.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"

#include "Mutator/Seed/SeedDialect.h"
#include "Mutator/Seed/SeedTypes.h"

#define GET_OP_CLASSES
#include "Mutator/Seed/SeedOps.h.inc"

#endif // MUTATOR_SEEDOPS_H
