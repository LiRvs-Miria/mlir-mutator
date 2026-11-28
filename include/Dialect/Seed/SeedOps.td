//===- SeedOps.td - Seed dialect ops -----------------------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef SEED_OPS
#define SEED_OPS

include "Dialect/Seed/SeedDialect.td"
include "Dialect/Seed/SeedTypes.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

//===----------------------------------------------------------------------===//
// Base seed operation definition.
//===----------------------------------------------------------------------===//

class Seed_Op<string mnemonic, list<Trait> traits = []> :
        Op<Seed_Dialect, mnemonic, traits>;

//===----------------------------------------------------------------------===//
// Seed op definitions.
//===----------------------------------------------------------------------===//

def Seed_ModuleOp : Seed_Op<"module", [Pure, NoTerminator]> {
  let summary = "a seed entry holding one fuzzing input module";
  let description = [{
    Wraps one fuzzing input in its single body region. The input itself is
    generic MLIR and is recorded verbatim, the way it was loaded.

    Ledger semantics: the op records that this input exists as a seed
    entry; it does not perform any work. The `hash` attribute carries the
    content fingerprint used for deduplication across the corpus.
  }];

  let arguments = (ins I64Attr:$hash);
  let regions = (region SizedRegion<1>:$body);
  let results = (outs Seed_EntryType:$entry);

  let assemblyFormat =
      "`<` `hash` `=` $hash `>` $body attr-dict `:` type($entry)";
  let hasVerifier = 1;
}

def Seed_BitflipOp : Seed_Op<"bitflip", [Pure, NoTerminator]> {
  let summary = "records a bitflip mutation of a seed entry";
  let description = [{
    Ledger op: records that a new entry was derived from `input` by the
    bitflip mutation strategy. The op does not perform the mutation;
    mutation transforms run as passes over the input. The body region
    holds the mutated module.

    `input` is never modified: value semantics, the new entry is a new
    value.
  }];

  let arguments = (ins Seed_EntryType:$input, I64Attr:$hash);
  let regions = (region SizedRegion<1>:$body);
  let results = (outs Seed_EntryType:$entry);

  let assemblyFormat =
      "$input `<` `hash` `=` $hash `>` $body attr-dict `:` type($entry)";
  let hasVerifier = 1;
}

#endif // SEED_OPS
