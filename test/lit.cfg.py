# -*- Python -*-

import os
import sys

import lit.formats

from lit.llvm import llvm_config
from lit.llvm.subst import ToolSubst

# Configuration file for the 'lit' test runner.

# name: The name of this test suite.
config.name = "MLIR-MUTATOR"

# Set the test format based on shell configuration
config.test_format = lit.formats.ShTest()

# suffixes: A list of file extensions to treat as test files.
config.suffixes = [
    ".td",
    ".mlir",
]

# test_source_root: The root path where tests are located.
config.test_source_root = os.path.dirname(__file__)

# test_exec_root: The root path where tests should be run.
config.test_exec_root = os.path.join(config.mlir_mutator_obj_root, "test")

config.substitutions.append(("%PATH%", config.environment["PATH"]))
config.substitutions.append(("%shlibext", config.llvm_shlib_ext))
config.substitutions.append(("%llvm_src_root", config.llvm_src_root))
config.substitutions.append(("%mlir_mutator_src_root", config.mlir_mutator_src_root))

llvm_config.with_system_environment(["HOME", "INCLUDE", "LIB", "TMP", "TEMP"])

# excludes: A list of directories to exclude from the testsuite. The 'Inputs'
# subdirectories contain auxiliary inputs for various tests in their parent
# directories.
config.excludes = [
    "Inputs",
    "CMakeLists.txt",
    "README.txt",
    "LICENSE.txt",
    "lit.cfg.py",
    "lit.site.cfg.py",
]

# Tweak the PATH to include the tools dir.
tool_dirs = [config.mlir_mutator_tools_dir, config.llvm_tools_dir]
for dirs in tool_dirs:
    llvm_config.with_environment("PATH", dirs, append_path=True)

tools = [
    "mlir-tblgen",
    "FileCheck",
    "not",
]

# The following tools are optional
tools.extend(
    [
        ToolSubst("%mlir_mutator_lib_dir", config.mlir_mutator_lib_dir, unresolved="ignore"),
        ToolSubst("%mlir_mutator_src_dir", config.mlir_mutator_src_root, unresolved="ignore"),
    ]
)

if "MLIR_OPT_CHECK_IR_ROUNDTRIP" in os.environ:
    tools.extend(
        [
            ToolSubst("mlir-opt", "mlir-opt --verify-roundtrip", unresolved="fatal"),
        ]
    )
else:
    tools.extend(["mlir-opt"])

llvm_config.add_tool_substitutions(tools, tool_dirs)

# FileCheck -enable-var-scope is enabled by default in MLIR test
# This option avoids to accidentally reuse variable across -LABEL match,
# it can be explicitly opted-in by prefixing the variable name with $
config.environment["FILECHECK_OPTS"] = "-enable-var-scope --allow-unused-prefixes=false"

config.available_features.add("host-byteorder-" + sys.byteorder + "-endian")

if config.enable_assertions:
    config.available_features.add("asserts")
else:
    config.available_features.add("noasserts")
