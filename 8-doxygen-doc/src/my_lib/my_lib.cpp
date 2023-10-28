#include<iostream>

#include <nlohmann/json.hpp>

/**
 * @brief Prints out hello world and test JSON lib
 */
void print_hello_world() {
    std::cout << "Hello World!!";

    std::cout << "JSON Lib Version"
        << NLOHMANN_JSON_VERSION_MAJOR << ".";
}