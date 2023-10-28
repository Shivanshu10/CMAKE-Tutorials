set(EXE_SOURCES
    "main.cpp"    
)

add_executable(Executable 
    ${EXE_SOURCES}
)

target_link_libraries(Executable PUBLIC ${LIBRARY_NAME})