cmake_minimum_required(VERSION 3.0.0)

project(Example4_policies)
#Definitions:
# CONFIGURATION TYPES are Debug and Release and whatever you want.
# BUILD TYPE is a CONFIGURATION TYPE in current build.

#Lets consider next project hierarchy
# /root
#   | - source/
#   | - CMakeLists.txt
#   | - build-Release/
#   | - build-Debug/

# single configuration generator for Ninja and Unix Makefile.
# run from build directory
#cmake -DCMAKE_BUILD_TYPE:STRING=Debug ../source
#cmake --build .

# For Release.
# mkdir Release
# cd Release
# cmake -DCMAKE_BUILD_TYPE=Release ..
# make
#Same algorythm is for Debug also.


# multiple configuration generator is for the Xcode or VisualStudio
#cmake -G Xcode/Visual Studio ../source
#cmake --build . --config Debug

#We have detection mechanics of which type of configuration generator is we using.
#starting CMake 3.9
if(GENERATOR_IS_MULTI_CONFIG)
   message("Multi conf")
else()
   message("Single conf")
endif()




#working great for single conf gen.
if (${CMAKE_BUILD_TYPE} STREQUAL Debug )
    message("Debug build")
endif()

#This shall work for the multi conf gen 
if ($<CONFIG:Debug>) #same is for release
    message("multi conf gen debug")
endif()
#To work in both cases we should execute the following
# cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ../source  #single
# cmake --build . --config Release                     # multi


#Custom build types
#nice way
if(CMAKE_CONFIGURATION_TYPES)
     if(NOT "Profile" IN_LIST CMAKE_CONFIGURATION_TYPES)
         list(APPEND CMAKE_CONFIGURATION_TYPES Profile)
     endif()
endif()


#Also there is possibility to manipulate such variables as
#CMAKE_<LANG>_FLAGS_<CONFIG>
#Example:
set(CMAKE_C_FLAGS_RELEASE "-p -O2 -Wall -Werror" CACHE STRING "")
set(CMAKE_CXX_FLAGS_RELEASE "-p -O2 -Wall -Werror" CACHE STRING "")

#
#Example:
#CMAKE_<TARGETTYPE>_LINKER_FLAGS_<CONFIG>
set(CMAKE_STATIC_LINKER_FLAGS_RELEASE "-p -O2" CACHE STRING "")
