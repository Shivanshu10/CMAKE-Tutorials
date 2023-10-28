#include<iostream>

#include "my_lib.h"
#include "config.hpp"

#include <nlohmann/json.hpp>

int main() {
    std::cout << project_name << "\n";
    std::cout << project_version << "\n";

    int i;

    print_hello_world();

    std::cout << "JSON Lib Version"
        << NLOHMANN_JSON_VERSION_MAJOR << ".";

    std::cout << "\n";
    return 0;
}