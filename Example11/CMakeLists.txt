cmake_minimum_required(VERSION 3.1.0)
set(PROJECT_VERSION "1.1.1")
project(Example11 VERSION 1.1.1)

#getting latest commit
find_package(Git REQUIRED)
execute_process(COMMAND ${GIT_EXECUTABLE} rev-parse HEAD
                RESULT_VARIABLE resultVar
                OUTPUT_VARIABLE PROJECT_LATEST_COMMIT_GIT_HASH
                OUTPUT_STRIP_TRAILING_WHITESPACE
)
if(result)
   message(FATAL_ERROR "Failed to extract latest commit hash, result is: ${result}")
endif()

#First way to add version to project is by using simple definition
#add_definitions(-DPROJECT_VERSION=\"${PROJECT_VERSION}\")
add_definitions(-DPROJECT_VERSION_DEFINE="${PROJECT_VERSION}")

#second way is to create the "version manager" header file
configure_file(version_manager.h.in version_manager.h @ONLY)

add_executable(version_printer.out main.cpp)
target_include_directories(version_printer.out PRIVATE "${CMAKE_BINARY_DIR}")
