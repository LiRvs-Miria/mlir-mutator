//===- SeedDialect.td - Seed dialect -----------------------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef SEED_DIALECT
#define SEED_DIALECT

include "mlir/IR/OpBase.td"

//===----------------------------------------------------------------------===//
// Seed dialect definition.
//===----------------------------------------------------------------------===//

def Seed_Dialect : Dialect {
    let name = "seed";
    let summary = "A fuzzing seed dialect.";
    let description = [{
        Fuzzing inputs represented as IR. Mutation is pass work over typed
        structure, not byte shoveling.
    }];
    let cppNamespace = "::mlir::mutator";
}

#endif // SEED_DIALECT
