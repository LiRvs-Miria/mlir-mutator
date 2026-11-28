//===- ReportOps.td - Report dialect ops -------------------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef REPORT_OPS
#define REPORT_OPS

include "Dialect/Report/ReportDialect.td"

//===----------------------------------------------------------------------===//
// Base report operation definition.
//===----------------------------------------------------------------------===//

class Report_Op<string mnemonic, list<Trait> traits = []> :
        Op<Report_Dialect, mnemonic, traits>;

#endif // REPORT_OPS
