function(add_sanitizer_flags)
    if (NOT ${ENABLE_SANITIZE_ADDR} AND NOT ${ENABLE_SANITIZE_UNDEF})
        message(STATUS "Sanitizers Deactivated")
        return()
    endif()

    if(CMAKE_CXX_COMPILER_ID MATCHES "CLANG" OR CMAKE_CXX_COMPILER_ID MATCHES "GNU")
        add_compile_options("-fno-omit-frame-pointer")
        add_link_options("-fno-omit-frame-pointer")

        if (${ENABLE_ADDRESS_SANITIZER})
            add_compile_options("-fsanitize=address")
            add_link_options("-fsanitize=address")
        endif()

        if (${ENABLE_UNDEFINED_SANITIZER})
            add_compile_options("-fsanitize=undefined")
            add_link_options("-fsanitize=undefined")
        endif()
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
        if (${ENABLE_SANITIZE_ADDR})
            add_compile_options("/fsanitize=address")
        endif()

        if (${ENABLE_SANITIZE_UNDEF})
            message(STATUS "Undefined Sanitizer not implemented for MSVC")
        endif()
    else()
        message(ERROR "Compiler not Supported for Sanitizers")
    endif()
endfunction()