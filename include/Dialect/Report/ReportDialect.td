//===- ReportDialect.td - Report dialect -------------------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef REPORT_DIALECT
#define REPORT_DIALECT

include "mlir/IR/OpBase.td"

//===----------------------------------------------------------------------===//
// Report dialect definition.
//===----------------------------------------------------------------------===//

def Report_Dialect : Dialect {
    let name = "report";
    let summary = "A fuzzing campaign report dialect.";
    let description = [{
        Campaign results represented as IR.
    }];
    let cppNamespace = "::mlir::mutator";
}

#endif // REPORT_DIALECT
