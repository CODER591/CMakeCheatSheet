#Setting the minimum CMake version
cmake_minimum_required(VERSION 3.10.2)

#Project basic info
project(EXAMPLE_4_properties VERSION 1.0.1 LANGUAGES C CXX)


# For me I guess better to use variables or "direct sets".

set_property(DIRECTORY PROPERTY Property_Name Value)
set_property(DIRECTORY PROPERTY Build_dir "build")

get_property(return_var DIRECTORY PROPERTY Build_dir)
message("Property Build_dir ==== ${return_var}")

#end of set/get_property explanation.

set_property(GLOBAL PROPERTY some_global_var_name "ORA ORA ORA ORA ORA")
get_cmake_property(resultVar some_global_var_name) # only for globals
message("get_cmake_property == ${resultVar}")

#"Direct sets"(set_directory_properties,set_target_properties ...etc) are not able in the APPEND functionality.
# For APPEND use more general and flexible function "set_property"

#set_directory_properties is always related for current directory.
set_directory_properties(PROPERTIES kek_prop "kek_prop_val" lol_prop "lol_prop_val")
get_directory_property(result_dirs_props DIRECTORY . kek_prop) 
#get_directory_property(result_dirs_props DIRECTORY .) #crashing for some reason
message("get_directory_property == ${result_dirs_props}")


#Target properties
add_custom_target(kek_targ)
set_target_properties(kek_targ PROPERTIES property_name "prop_value")

set_target_properties(kek_targ PROPERTIES property_name_list_demo "see;this;list;man;and;be;happy")#list demo

get_target_property(resultVar kek_targ property_name)
message("get_target_property == ${resultVar}")


#Sources properties

set_source_files_properties(source_file_property_demo.cpp PROPERTIES source_file_prop "source_file_prop_val")
get_source_file_property(NiceRetVal source_file_property_demo.cpp source_file_prop)
message("get_source_file_property == ${NiceRetVal}")


#Same works for tests.

#set_tests_properties(test1 PROPERTIES property_test_Name1 "value1")
#get_test_property(resultVar_test test1 property_test_Name1)
#message("get_source_file_property == ${resultVar_test}")

