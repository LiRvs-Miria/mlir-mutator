cmake_minimum_required(VERSION 3.20)
project(mlir-mutator CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(MLIR_BUILD_DIR "$ENV{HOME}/mlir-fuzz-build" CACHE PATH
  "LLVM/MLIR build directory to link against")

find_package(MLIR REQUIRED CONFIG
  HINTS ${MLIR_BUILD_DIR}/lib/cmake/mlir
  )

include_directories(${MLIR_INCLUDE_DIRS} ${LLVM_INCLUDE_DIRS})
