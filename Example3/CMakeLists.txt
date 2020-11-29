#Setting the minimum CMake version
cmake_minimum_required(VERSION 3.0.0)

#Project basic info
project(EXAMPLE_1 VERSION 1.0.1 LANGUAGES C CXX)

#EXCLUDE_FROM_ALL
#Set this directory property to a true value on a subdirectory to exclude its targets from the “all” target of its ancestors.
#So, that means, if we execute "make all" excluded target would not be built.

add_subdirectory(source/dir_collect)
add_subdirectory(source/dir_kek)
add_subdirectory(source/dir_lol)

add_executable(final_man.out
               source/main.cpp
              )

target_link_libraries(final_man.out PRIVATE kek_lib)
target_link_libraries(final_man.out PRIVATE collect_lib)

#Example how to link object lib from subdirectory.
add_library(tmp_lib $<TARGET_OBJECTS:funny_lib>)
target_link_libraries(final_man.out PRIVATE tmp_lib)

#nice explanation
#https://stackoverflow.com/questions/56210202/how-to-link-static-library-that-was-created-from-add-subdirectory-in-cmake
#https://pabloariasal.github.io/2018/02/19/its-time-to-do-cmake-right/


# include() CMake directive explanation.
# This directive is somewhat similar to the add_subdirectory, but
# include() expects the name of a file to read in, whereas add_subdirectory() expects a directory
# and will look for a CMakeLists.txt file within that directory.
# So, include is kind of an include directive in C++
include(source/dir_include_directive_example/cmake_script.cmake)
#Note: this cmake_script.cmake is simply the file written in the CMake style.
#Check out this file.
#Also, I think that CMake directive "include" is working by same principle as c++ preprocessor with #include directive
#As we need to set up the full relative path in file which we want to include.


#Variable scope example.
set(EXAMPLE_VAR 5)
message("EXAMPLE_VAR in the PARENT directory BEFORE change: ${EXAMPLE_VAR}")
add_subdirectory(source/dir_var_example)
message("EXAMPLE_VAR in the PARENT directory AFTER change: ${EXAMPLE_VAR}")
#check out the dir_example CMakeLists.txt
#So, inherited variables after changing in child scope are not affected in the parent scope.
