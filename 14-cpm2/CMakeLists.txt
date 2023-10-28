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

option(ENABLE_CPM "enable ..." ON)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(FetchContent)

if (${ENABLE_CPM})
    message(STATUS "Using CPM")
    include(CPM)
    CPMAddPackage("gh:nlohmann/json#v3.11.2")
else()
    include(FetchContent)
    message(STATUS "Using FetchContent")
    FetchContent_Declare(
        nlohmann_json
        GIT_REPOSITORY https://github.com/nlohmann/json
        GIT_TAG v3.11.2
        GIT_SHALLOW true
    )
    FetchContent_MakeAvailable(nlohmann_json)
endif()

add_subdirectory(configured)
add_subdirectory(src)

if (COMPILE_EXECUTABLE)
    add_subdirectory(app)
else()
    message("Without exe compiling")
endif()