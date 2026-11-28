//===- SeedTypes.td - Seed dialect types -------------------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef SEED_TYPES
#define SEED_TYPES

include "mlir/IR/AttrTypeBase.td"
include "Dialect/Seed/SeedDialect.td"

//===----------------------------------------------------------------------===//
// Seed type definitions
//===----------------------------------------------------------------------===//

class Seed_Type<string name, string typeMnemonic, list<Trait> traits = []>
    : TypeDef<Seed_Dialect, name, traits> {
  let mnemonic = typeMnemonic;
}

def Seed_EntryType : Seed_Type<"Entry", "entry"> {
  let summary = "A handle to a seed entry";
  let description = [{
    A handle to one fuzzing input represented as IR. The input itself is
    generic MLIR; the seed dialect does not type its contents.

    Value semantics: entries are immutable. Mutation ops produce new
    entries; a registered entry is never modified in place.

    Type parameters carry no payload: entry identity lives in the `hash`
    attribute of the defining op, not in the type, so that the same type
    is produced regardless of content and type equivalence stays stable.
  }];
  let assemblyFormat = "";
}

#endif // SEED_TYPES
