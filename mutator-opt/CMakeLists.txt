set(LIBS
    MLIRArithDialect
    MLIRFuncDialect
    MLIROptLib
    MLIRRegisterAllDialects
    MLIRRegisterAllPasses
    MutatorSeedDialect
  )
add_llvm_executable(mutator-opt mutator-opt.cpp)

llvm_update_compile_flags(mutator-opt)
target_link_libraries(mutator-opt PRIVATE ${LIBS})

mlir_check_all_link_libraries(mutator-opt)
