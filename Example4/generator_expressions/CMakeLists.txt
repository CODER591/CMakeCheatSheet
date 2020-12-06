#Setting the minimum CMake version
cmake_minimum_required(VERSION 3.10.2)

#Project basic info
project(EXAMPLE_4_properties VERSION 1.0.1 LANGUAGES C CXX)


# Here is GeneratorExpession example lies.

#Set of rules

#$<1:foo> -> foo
#$<0:foo> -> (nothing)
#$<true:foo> -> (will be an error, not a 1 or 0)
#$<$<BOOL:true>:foo>  -> foo
#$<$<NOT:0>:foo> -> foo
#$<$<NOT:1>:foo>  -> (nothing)
#$<$<NOT:true>:foo> -> foo (Error, NOT requires a 1 or 0)
#$<$<AND:1,0>:foo>  -> (nothing)
#$<$<OR:1,0>:foo> -> foo
#$<1:$<$<BOOL:false>:foo>> (nothing)
#$<IF:$<BOOL:${foo}>,yes,no>#result will be depending on ${foo}


#Simplest Generator Expression demo is linking executable with OBJECT library.

#add_library(objLib OBJECT src_file1.cpp src_file2.cpp)

#add_executable(example main.cpp $<TARGET_OBJECTS:objLib>)

