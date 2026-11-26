# mlir-mutator

A standalone, out-of-tree MLIR mutator: you feed it MLIR, it prints mutated MLIR.

mlir-mutator is mutation infrastructure for MLIR fuzzing. Its goal is
stability, not novelty: a stable, extensible entry point for mutation
strategies, so compiler fuzzers, academic projects and security researchers
can plug strategies in instead of rebuilding mutation machinery from scratch.

## Design direction

The working direction was announced in the
[Fuzzing MLIR Infrastructure thread](https://discourse.llvm.org/t/fuzzing-mlir-infrastructure/84855/15):

- **Everything is IR.** Three product dialects:
  - `seed` — inputs as IR; mutation is pass work over typed structure, not
    byte shoveling
  - `corpus` — corpus state and selection metadata as IR
  - `report` — campaign results as IR
- **Five pass families** on top of them:
  - mutation transforms — bitflip / arith / splice / havoc over seed IR
  - mutation analysis — picks the next round's strategy from feedback, as an
    MLIR analysis with caching and invalidation
  - coverage analysis — bitmap/graph annotation, novelty signals
  - result analysis — findings and crash classification
  - report transforms — dedup, aggregation, output shapes
- **Strategies plug in as passes.**

## Consumers

- The in-tree MLIR fuzz target
  ([llvm-project PR #239171](https://github.com/llvm/llvm-project/pull/239171)):
  mlir-mutator provides its out-of-tree mutation infrastructure; the
  in-tree piece stays deliberately thin.
- Further consumers (e.g. dbgfuzz) integrate via dedicated adapters.

## Campaign reporting

Templates for the upstream reporting workflow that consumes campaign
output (the `fuzzing-campaign` ledger model):

- `docs/templates/campaign-meta-issue.md` — the campaign thread skeleton
  (adopted from the
  [reporting-advice thread](https://discourse.llvm.org/t/seeking-advice-on-reporting-100-mlir-bugs-found-by-an-automated-testing-tool/92920/18))

## Status

Scaffolding stage. The design contract is written before any
implementation; the first slice is minimal shapes of the `seed`,
`corpus` and `report` dialects plus minimal mutation transforms, mutation
analysis, coverage analysis, result analysis, and report transforms.

## Building

Requires an LLVM/MLIR build (or install) with MLIR enabled, built with
the same compiler and flags: the linked build here uses clang with
`-fsanitize=fuzzer-no-link`, and its sanitizer-coverage runtime must be
available at link time:

```sh
cmake -S . -B build -DMLIR_BUILD_DIR=$HOME/mlir-fuzz-build \
  -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_CXX_FLAGS=-fsanitize=fuzzer-no-link
cmake --build build
```

`mutator-opt` is the mutator driver: feed it MLIR, it prints mutated
MLIR.

## Testing

Lit + FileCheck based, following MLIR conventions. The test suite
requires the tools (`mlir-opt`, `FileCheck`, ...) of the linked
LLVM/MLIR build:

```sh
cmake --build build --target check-mlir-mutator
```

Currently the suite runs the in-tree mlir-opt-fuzzer cases, the
designated consumer of this project.

## License

Apache License 2.0 with LLVM Exceptions — see [LICENSE](LICENSE).
