# Passed to lit.site.cfg.py.in to set up the path where to find libraries.
set(MLIRMUTATOR_TOOLS_DIR ${LLVM_RUNTIME_OUTPUT_INTDIR})
set(MLIRMUTATOR_LIB_DIR ${LLVM_LIBRARY_OUTPUT_INTDIR})

configure_lit_site_cfg(
  ${CMAKE_CURRENT_SOURCE_DIR}/lit.site.cfg.py.in
  ${CMAKE_CURRENT_BINARY_DIR}/lit.site.cfg.py
  MAIN_CONFIG
  ${CMAKE_CURRENT_SOURCE_DIR}/lit.cfg.py
  PATHS
  "LLVM_SOURCE_DIR"
  "LLVM_TOOLS_DIR"
  "MLIRMUTATOR_BINARY_DIR"
  "MLIRMUTATOR_SOURCE_DIR"
  "MLIRMUTATOR_TOOLS_DIR"
  "MLIRMUTATOR_LIB_DIR"
  )

set(MLIRMUTATOR_TEST_DEPENDS
  FileCheck
  mutator-opt
  not
  )

# This target can be used to just build the dependencies
# for the check-mlir-mutator target without executing the tests.
# This is useful for bots when splitting the build step
# from the testing step.
add_custom_target(check-mlir-mutator-build-only
  DEPENDS ${MLIRMUTATOR_TEST_DEPENDS}
  )
set_target_properties(check-mlir-mutator-build-only PROPERTIES FOLDER "Tests")

add_lit_testsuite(check-mlir-mutator "Running the mlir-mutator regression tests"
  ${CMAKE_CURRENT_BINARY_DIR}
  DEPENDS ${MLIRMUTATOR_TEST_DEPENDS}
  )

add_lit_testsuites(MLIR-MUTATOR ${CMAKE_CURRENT_SOURCE_DIR}
  DEPENDS ${MLIRMUTATOR_TEST_DEPENDS}
  )
