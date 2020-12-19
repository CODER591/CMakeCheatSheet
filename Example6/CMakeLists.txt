cmake_minimum_required(VERSION 3.0.0)

project(Example6)

# All compile definitions are equal to -D compliler flag  g++ -DCOOL_DEFINITION_VAR

# This function is placing the compile definitions to the COMPILE_DEFINITIONS. And COMPILE_DEFINITIONS is specific for the directory
# add_compile_definitions(<definition> ...)
#add_compile_definitions(FIRST_DEF SECOND_DEF THIRD_DEF) # is for CMake starting 3.12


add_definitions(-DFIRST_DEF -DSECOND_DEF -DTHIRD_DEF)
remove_definitions(-DTHIRD_DEF)

#The way it is working is the same as add_compile_options, but for the COMPILE_OPTIONS variable
add_compile_options(-Wall -Wextra -pedantic -Werror)  # this is a list

include_directories(source/first_headers source/second_headers) # is equivalent to compiler flag -I
get_property(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
get_property(compile_defs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY COMPILE_DEFINITIONS)

message("Here we are printing in the ${CMAKE_CURRENT_SOURCE_DIR} all included dirs ${dirs}")
message("Here we are printing in the ${CMAKE_CURRENT_SOURCE_DIR} all compile definitions ${compile_defs}")

add_executable(CoolExe.out  source/main.cpp)

#definitions
target_compile_definitions(CoolExe.out PUBLIC FOO)
target_compile_definitions(CoolExe.out PUBLIC ${compile_defs})  
# will be added when compiled. run ./CoolExe from build directory
# You will see that Foo is defined.


# Options(flags)
get_property(compile_opts DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY COMPILE_OPTIONS)
target_compile_options(CoolExe.out PUBLIC ${compile_opts})
message("Compile options are ${compile_opts}")


#Also there is possibility to manipulate options using these things
#CMAKE_<LANG>_FLAGS_<CONFIG>
#Example:
set(CMAKE_C_FLAGS_RELEASE "-p -O2 -Wall -Werror" CACHE STRING "") #this CMAKE_C_FLAGS_RELEASE is contain string
# Using FORCE to always update the cache variable, but this overwrites
# any changes a developer might make to the cache
set(CMAKE_CXX_FLAGS "-Wall -Werror" CACHE STRING "C++ flags" FORCE)

# Safe appending
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror")

#Example:
#CMAKE_<TARGETTYPE>_LINKER_FLAGS_<CONFIG>
set(CMAKE_STATIC_LINKER_FLAGS_RELEASE "-p -O2" CACHE STRING "")
