set(EXE_SOURCES
    "main.cpp"    
)

add_executable(Executable 
    ${EXE_SOURCES}
)

target_link_libraries(Executable PUBLIC 
    ${LIBRARY_NAME}
    nlohmann_json    
)

if(${ENABLE_WARNINGS})
    target_set_warnings(
        ${EXECUTABLE_NAME}
        ${ENABLE_WARNINGS}
        ${ENABLE_WARNINGS_AS_ERRORS}
    )
endif()