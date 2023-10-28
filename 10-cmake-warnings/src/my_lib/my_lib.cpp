#include<iostream>
#include<cstdint>

void print_hello_world() {
    std::cout << "Hello World!!";
}

std::uint32_t factorial( unsigned int number ) {
    return number <= 1 ? number : factorial(number-1)*number;
}