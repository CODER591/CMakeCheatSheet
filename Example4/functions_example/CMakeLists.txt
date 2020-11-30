#Setting the minimum CMake version
cmake_minimum_required(VERSION 3.0.0)

#Project basic info
project(EXAMPLE_1 VERSION 1.0.1 LANGUAGES C CXX)


# pasting cmake_functions.cmake directly as text
include(cmake_functions.cmake)


print_text("Some cool and inspirational text =)")

count_to_ten()


#macro call
cool_printing_macro_name(1000000)

print_args(a b c d e f g)

set(myVariable 500000)

return_value_example(${myVariable} returnVar)
message("Argument: ${myVariable}")
message("returned value: ${returnVar}")


pront()
