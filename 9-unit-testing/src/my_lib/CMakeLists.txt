set(LIBRARY_SOURCES
    "my_lib.cpp"    
)
set(LIBRARY_HEADERS
    "my_lib.h"
)

add_library(${LIBRARY_NAME} STATIC
    ${LIBRARY_HEADERS}
    ${LIBRARY_SOURCES}
)

target_include_directories(${LIBRARY_NAME} PUBLIC 
    "./"
    "${CMAKE_BINARY_DIR}/configured_files/include"    
)