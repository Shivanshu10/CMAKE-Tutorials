cmake_minimum_required(VERSION 3.22)

project(
    HelloWorld
    VERSION 1.0.0
    LANGUAGES C CXX
)

set(CMAKE_CXX_STANDARD 17)
set(LIBRARY_NAME "Library")
set(EXECUTABLE_NAME "Executable")

option(COMPILE_EXECUTABLE "whether to compile the executable or not" ON)

option(ENABLE_WARNINGS "enable warnings messages to show" ON)
option(ENABLE_WARNINGS_AS_ERRORS "enable warnings as error" ON)

option(ENABLE_SANITIZE_ADDR "enable ..." OFF)
option(ENABLE_SANITIZE_UNDEF "enable ..." OFF)

option(ENABLE_LTO "enable ..." ON)

option(ENABLE_CPM "enable ..." ON)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(AddGitSubmodule)

if (${ENABLE_CPM})
    message(STATUS "Using CPM")
    include(CPM)
    CPMAddPackage("gh:nlohmann/json#3.11.2")
else()
message(STATUS "Using AddGitSubmodule")
    include(AddGitSubmodule)
    add_git_submodule(external/json)
endif()

if (${ENABLE_WARNINGS})
    include(Warnings)
endif()

if (ENABLE_SANITIZE_ADDR OR ENABLE_SANITIZE_UNDEF)
    include(Sanitizers)
    add_sanitizer_flags()
endif()

if (ENABLE_LTO) 
    include(LTO)
endif()

add_subdirectory(configured)
add_subdirectory(src)

if (COMPILE_EXECUTABLE)
    add_subdirectory(app)
else()
    message("Without exe compiling")
endif()