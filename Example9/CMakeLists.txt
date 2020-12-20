cmake_minimum_required ( VERSION 3.1.0)

project(Example9)

#Example1
add_executable(myExe.out main.cpp)
  # Output file with relative path, generated in the build directory
add_custom_command(OUTPUT myExe.md5  COMMAND sha1sum $<TARGET_FILE:myExe.out> )
  # Absolute path needed for DEPENDS, otherwise relative to source directory
add_custom_target(computeHash DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/myExe.md5 )


add_custom_target(custom_targ ALL
    COMMAND echo "This is demonstration of how the COMMAND keyword acting"
    # If the file exists, then commands related to that file won't be executed
    # DONOT let other target depends on the same OUTPUT as current target,
    #   or it may be bad when doing parallel make
    #  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/myExe.md5

    # to make quotes printable,for example
    VERBATIM
)

set(TEST_FILE "log.txt")

# add_custom_command does not create a new target. You have to define targets explicitly
# by add_executable, add_library or add_custom_target in order to make them visible to make
add_custom_command(OUTPUT ${TEST_FILE}
    COMMAND touch ${TEST_FILE}

    # Display the given message before the commands are executed at build time
    COMMENT "Creating ${TEST_FILE}"
)

add_custom_target(test_file_targ ALL 
	COMMAND echo "Target test_file_targ is called"
	DEPENDS ${TEST_FILE}
	)



execute_process(COMMAND sh ../exec_proc_example.sh
                  RESULT_VARIABLE result)
if(result)
      message(FATAL_ERROR "runSomeScript failed: ${result}")
endif()

