cmake_minimum_required(VERSION 3.1.0)

project(Example7)
include(WriteCompilerDetectionHeader)
# Require C++11 and disable extensions for all targets
set(CMAKE_CXX_STANDARD 11)# flag --std=c++11
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
#Approach above would work for all project.


add_executable(target_name.out main.cpp)

#There is a way to compile target in feature=specific way
#from CMake 3.8
target_compile_features(target_name.out PUBLIC cxx_std_14) #exec will be compiled with c++14 standart


# compiling with exact features.
target_compile_features(target_name.out PUBLIC
$<$<COMPILE_FEATURES:cxx_override>:cxx_override>
)

#target foo will be compiled with the 14 standard. As we are choosing more new/strict.
#set_target_properties(foo PROPERTIES CXX_STANDARD 11)
#target_compile_features(foo PUBLIC cxx_std_14)

#target bar will be compiled with the 17 standard.
#set_target_properties(bar PROPERTIES CXX_STANDARD 17)
#target_compile_features(bar PRIVATE cxx_std_11)

#inheriting from the foo. compiled with the c++14 
#set_target_properties(guff PROPERTIES CXX_STANDARD 11)
#target_link_libraries(guff PRIVATE foo)


write_compiler_detection_header(
                  FILE foo_compiler_detection.h
                  PREFIX foo
                  COMPILERS GNU Clang
                  FEATURES cxx_override
                  cxx_final
                  cxx_nullptr
                  cxx_rvalue_references
)
