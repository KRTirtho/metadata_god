
set(CRATE_STATIC ON)
include(../../cmake/rust.cmake)

set_property(TARGET ${CRATE_NAME} PROPERTY IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/librust.so")
