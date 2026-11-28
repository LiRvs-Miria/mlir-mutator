add_mlir_dialect_library(MutatorSeedDialect
        SeedTypes.cpp
        SeedDialect.cpp
        SeedOps.cpp

        ADDITIONAL_HEADER_DIRS
        ${MLIRMUTATOR_SOURCE_DIR}/include/Dialect

        DEPENDS
        MLIRSeedOpsIncGen

        LINK_LIBS PUBLIC
        MLIRIR
        )
