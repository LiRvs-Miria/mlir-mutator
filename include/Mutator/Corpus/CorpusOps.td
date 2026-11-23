//===- CorpusOps.td - Corpus dialect ops -------------------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef CORPUS_OPS
#define CORPUS_OPS

include "Mutator/Corpus/CorpusDialect.td"

//===----------------------------------------------------------------------===//
// Base corpus operation definition.
//===----------------------------------------------------------------------===//

class Corpus_Op<string mnemonic, list<Trait> traits = []> :
        Op<Corpus_Dialect, mnemonic, traits>;

#endif // CORPUS_OPS
