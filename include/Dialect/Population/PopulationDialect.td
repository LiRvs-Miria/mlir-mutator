//===- PopulationDialect.td - Population dialect -------------------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef POPULATION_DIALECT
#define POPULATION_DIALECT

include "mlir/IR/OpBase.td"

//===----------------------------------------------------------------------===//
// Population dialect definition.
//===----------------------------------------------------------------------===//

def Population_Dialect : Dialect {
    let name = "population";
    let summary = "A fuzzing population dialect.";
    let description = [{
        Population state and selection metadata represented as IR.
    }];
    let cppNamespace = "::mlir::mutator";
}

#endif // POPULATION_DIALECT
