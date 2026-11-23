//===- SeedOps.td - Seed dialect ops -----------------------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef SEED_OPS
#define SEED_OPS

include "Mutator/Seed/SeedDialect.td"

//===----------------------------------------------------------------------===//
// Base seed operation definition.
//===----------------------------------------------------------------------===//

class Seed_Op<string mnemonic, list<Trait> traits = []> :
        Op<Seed_Dialect, mnemonic, traits>;

#endif // SEED_OPS
