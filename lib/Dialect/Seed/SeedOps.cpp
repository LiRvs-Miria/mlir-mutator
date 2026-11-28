//===- SeedOps.cpp - Seed dialect ops -------------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "Dialect/Seed/SeedOps.h"

#include "mlir/IR/SymbolTable.h"
#include "mlir/IR/RegionKindInterface.h"
#include "mlir/IR/BuiltinOps.h"
#include "llvm/ADT/STLExtras.h"

using namespace mlir::mutator;

#define GET_OP_CLASSES
#include "Dialect/Seed/SeedOps.cpp.inc"

//===----------------------------------------------------------------------===//
// Seed ops.
//===----------------------------------------------------------------------===//

// Entry payload invariant shared by Seed_ModuleOp and Seed_BitflipOp: the
// body region holds exactly one operation, a builtin.module.
static ::mlir::LogicalResult verifyEntryBody(::mlir::Operation *op,
                                             ::mlir::Region &body) {
  if (!body.hasOneBlock())
    return op->emitOpError("expected a single block body region");
  if (!llvm::hasSingleElement(body.front()))
    return op->emitOpError("expected exactly one operation in the body region");
  if (!::mlir::isa<::mlir::ModuleOp>(body.front().front()))
    return op->emitOpError(
        "expected the body region to contain a builtin.module");
  return ::mlir::success();
}

::mlir::LogicalResult ModuleOp::verify() {
  return verifyEntryBody(*this, getBody());
}

::mlir::LogicalResult BitflipOp::verify() {
  return verifyEntryBody(*this, getBody());
}
