add_library(${LIBRARY_NAME} STATIC my_lib.cpp)

target_include_directories(${LIBRARY_NAME} PUBLIC 
    "./"
    "${CMAKE_BINARY_DIR}/configured_files/include"    
)