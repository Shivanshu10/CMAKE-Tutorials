cmake_minimum_required(VERSION 3.22)

project(
    HelloWorld
    VERSION 1.0.0
    LANGUAGES C CXX
)

set(CMAKE_CXX_STANDARD 17)

set(LIBRARY_NAME "Library")
set(EXECUTABLE_NAME "Executable")

option(COMPILE_EXECUTABLE "whether to compile the executable or not" OFF)

option(ENABLE_TESTING "enable a unit testing build" ON)

add_subdirectory(configured)
add_subdirectory(src)
add_subdirectory(tests)

include(FetchContent)

FetchContent_Declare(
    Catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG v2.13.9
    GIT_SHALLOW true
)
FetchContent_MakeAvailable(Catch2)

if (COMPILE_EXECUTABLE)
    add_subdirectory(app)
else()
    message("Without exe compiling")
endif()