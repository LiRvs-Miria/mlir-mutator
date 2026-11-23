cmake_minimum_required(VERSION 3.20.0)
project(mlir-mutator LANGUAGES CXX C)

set(CMAKE_BUILD_WITH_INSTALL_NAME_DIR ON)

set(CMAKE_CXX_STANDARD 17 CACHE STRING "C++ standard to conform to")

set(MLIR_BUILD_DIR "$ENV{HOME}/mlir-fuzz-build" CACHE PATH
  "LLVM/MLIR build directory to link against")

find_package(MLIR REQUIRED CONFIG
  HINTS ${MLIR_BUILD_DIR}/lib/cmake/mlir
  )

# Define the default argument to use by `lit` when testing.
set(LLVM_LIT_ARGS "-sv" CACHE STRING "Default options for lit")

message(STATUS "Using MLIRConfig.cmake in: ${MLIR_DIR}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

set(LLVM_RUNTIME_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/bin)
set(LLVM_LIBRARY_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/lib)

set(MLIRMUTATOR_SOURCE_DIR ${PROJECT_SOURCE_DIR})
set(MLIRMUTATOR_BINARY_DIR ${PROJECT_BINARY_DIR})

list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

include(TableGen)
include(AddLLVM)
include(AddMLIR)
include(HandleLLVMOptions)

# The lit command in AddLLVM runs as ${Python3_EXECUTABLE} llvm-lit.
find_package(Python3 COMPONENTS Interpreter REQUIRED)

include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${MLIR_INCLUDE_DIRS})
link_directories(${LLVM_BUILD_LIBRARY_DIR})
add_definitions(${LLVM_DEFINITIONS})

option(MLIRMUTATOR_INCLUDE_TESTS "Whether to build mlir-mutator tests" ON)
if(MLIRMUTATOR_INCLUDE_TESTS)
  add_subdirectory(test)
endif()
