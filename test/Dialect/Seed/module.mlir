// RUN: mutator-opt %s | FileCheck %s
// RUN: mutator-opt %s --verify-roundtrip | FileCheck %s

// CHECK: %{{.+}} = seed.module<hash = 42> {
module {
  %0 = seed.module<hash = 42> {
    builtin.module {
      func.func @f(%arg0: i32) -> i32 {
        %1 = arith.constant 1 : i32
        %2 = arith.addi %arg0, %1 : i32
        return %2 : i32
      }
    }
  } : !seed.entry
  // CHECK: } : !seed.entry

  // CHECK: %{{.+}} = seed.bitflip %{{.+}}<hash = 43> {
  %3 = seed.bitflip %0 <hash = 43> {
    builtin.module {
      func.func @f(%arg0: i32) -> i32 {
        %1 = arith.constant 2 : i32
        %2 = arith.addi %arg0, %1 : i32
        return %2 : i32
      }
    }
  } : !seed.entry
  // CHECK: } : !seed.entry
}
