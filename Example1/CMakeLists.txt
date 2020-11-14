#Setting the minimum CMake version
cmake_minimum_required(VERSION 3.0.0)

#Project basic info
project(EXAMPLE_1 VERSION 1.0.1 LANGUAGES C CXX)

#We could create STATIC/SHARED/OBJECT/MODULE types of libs
#OBJECT -is not a library, it is simply set/list of files compiled under target
# to get only appropriate object files for each source file.
# some_file.cpp -> some_file.cpp.o
# another_file.cpp -> another_file.cpp.o

#Equivalent to the Makefile example
# target.o:
#     g++ some_file.cpp -c
#     g++ another_file.cpp -c


add_library(kek_lib_obj OBJECT 
            source/kek.h
            source/kek.cpp
            )

add_library(kek_lib_stat STATIC
            source/kek.h
            source/kek.cpp
            )

add_library(kek_lib_shar SHARED 
            source/kek.h
            source/kek.cpp
            )

#Add executable target
add_executable(NiceApp_simple.out 
               source/main.cpp
               source/kek.cpp
               #sources should be separated by spaces
               )

add_executable(NiceApp_OBJ.out 
               source/main.cpp
               $<TARGET_OBJECTS:kek_lib_obj>
               )

add_executable(NiceApp_STAT.out 
               source/main.cpp
               )
               
add_executable(NiceApp_SHAR.out 
               source/main.cpp
               )


# Linking types explanation
#Private dependencies specify that library A uses library B in its own internal implementation.

#Public dependencies specify that not only does library A use library B internally, it also uses B in
#its interface. This means that A cannot be used without B, so anything that uses A will also have
#a direct dependency on B.

#INTERFACE 
# If your header files but not your source files include the headers of another library, then it is an INTERFACE dependency.
# Is suitable for header-only library


# target_link_libraries(collector
#                       PUBLIC ui
#                       PRIVATE algo engine
#                      )
# target_link_libraries(myApp PRIVATE collector)

#Explanation:
# <-- stands for direct linkage
# \-- stands for direct linkage, beautify 
# Private:
#     collector <-- algo
#     collector <-- engine
# myApp <-- collector

# Public:
#     collector <-- ui
#     myApp     <-- collector
#     myApp     <-- ui

# Which equivalent to:
#      myApp <-- collector <-- ui
#           \-- ui     
# So, with public linking ui will be directly linked to myApp and collector
# PUBLIC it is not about transitive linking, it about "also".


target_link_libraries(NiceApp_STAT.out PRIVATE kek_lib_stat)

target_link_libraries(NiceApp_SHAR.out PRIVATE kek_lib_stat)

#PUBLIC
#executables for PUBLIC linking
# static / shared library makes no difference

add_library(lib_collector STATIC
            source/collector.cpp)

add_executable(NiceApp_STAT_LPUB.out 
               source/main_1.cpp
              )

target_link_libraries(lib_collector PUBLIC kek_lib_shar)

target_link_libraries(NiceApp_STAT_LPUB.out PRIVATE lib_collector)
