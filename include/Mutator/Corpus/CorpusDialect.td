//===- CorpusDialect.td - Corpus dialect -------------------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef CORPUS_DIALECT
#define CORPUS_DIALECT

include "mlir/IR/OpBase.td"

//===----------------------------------------------------------------------===//
// Corpus dialect definition.
//===----------------------------------------------------------------------===//

def Corpus_Dialect : Dialect {
    let name = "corpus";
    let summary = "A fuzzing corpus dialect.";
    let description = [{
        Corpus state and selection metadata represented as IR.
    }];
    let cppNamespace = "::mlir::mutator";
}

#endif // CORPUS_DIALECT
