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

if(${ENABLE_WARNINGS})
    target_set_warnings(
        ${LIBRARY_NAME}
        ${ENABLE_WARNINGS}
        ${ENABLE_WARNINGS_AS_ERRORS}
    )
endif()

if (${ENABLE_LTO})
    target_enable_lto(${LIBRARY_NAME} ${ENABLE_LTO})
endif()