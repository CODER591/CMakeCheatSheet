#Setting the minimum CMake version
cmake_minimum_required(VERSION 3.10.2)

#Project basic info
project(EXAMPLE_4_properties VERSION 1.0.1 LANGUAGES C CXX)


set_directory_properties(PROPERTIES kek_prop "kek_prop_val" lol_prop "lol_prop_val")

add_custom_target(kek_targ)
set_target_properties(kek_targ PROPERTIES property_name_list_demo "see;this;list;man;and;be;happy")


set_source_files_properties(main.cpp PROPERTIES source_file_prop "source_file_prop_val")

# "built-in" Debugging features.
include(CMakePrintHelpers)

cmake_print_properties(TARGETS kek_targ PROPERTIES property_name_list_demo)
cmake_print_properties(SOURCES source/main.cpp PROPERTIES source_file_prop )

set(var_1 "a")
set(var_2 "b")
set(var_3 "c")
cmake_print_variables(var_1 var_2 var_3)

cmake_print_variables(CMAKE_C_COMPILER CMAKE_MAJOR_VERSION DOES_NOT_EXIST)


include(TestBigEndian)
test_big_endian(isBigEndian)
message("Is target system big endian: ${isBigEndian}")


include(CheckCSourceCompiles) #same exist for c++ but via check_cxx_source_compiles
check_c_source_compiles(" int main(int argc, char* argv[]) {
                              int variable;
                              return 0;
                          }" noWarnUnused FAIL_REGEX "[Ww]arn")
if(noWarnUnused)
message("Unused variables do not generate warnings by default")
endif()

include(CheckSymbolExists)
include(CMakePushCheckState)

cmake_push_check_state()
# Could use RESET option, but needs CMake >= 3.10   Ex: cmake_push_check_state([RESET])
cmake_reset_check_state()

set(CMAKE_REQUIRED_FLAGS -Wall)

#Check that the <symbol> is available after including given header <files> and store the result in a <variable>.
check_symbol_exists(FOO_VERSION source/version.h HAVE_FOO) 
if(HAVE_FOO)
# Preserve -Wall and add more things for extra checks
cmake_push_check_state()
set(CMAKE_REQUIRED_INCLUDES source/inc.h source/more.h)
check_symbol_exists(FOOBAR "" HAVE_FOOBAR)
check_symbol_exists(FOOBAZ "" HAVE_FOOBAZ)
check_symbol_exists(FOOBOO "" HAVE_FOOBOO)
cmake_pop_check_state()
# Now back to just -Wall
endif()
# Clear all the CMAKE_REQUIRED_... variables for this last check
cmake_reset_check_state()
check_symbol_exists(__TIME__ "" HAVE_PPTIME)
# Restore all CMAKE_REQUIRED_... variables to their original values
# from the top of this example
cmake_pop_check_state()
