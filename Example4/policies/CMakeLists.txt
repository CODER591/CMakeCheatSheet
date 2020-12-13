cmake_minimum_required(VERSION 3.0.0)


project(Example4_policies)
#Policy is the set of rules which help to configure CMake to act as you want it.

#cmake_policy(VERSION major[.minor[.patch[.tweak]]])
cmake_policy(VERSION 2.8.11) # case when we need old functionality for the backward compatibility
#Also, could be such a thing:
cmake_policy(VERSION 3.7...3.12)

#https://cmake.org/cmake/help/latest/manual/cmake-policies.7.html#manual:cmake-policies(7)
#cmake_policy(SET CMPxxxx NEW)
#cmake_policy(SET CMPxxxx OLD)
#Ex:
cmake_policy(SET CMP0056 OLD) 
#By specifying NEW or OLD, a we are telling CMake to use the new or old behavior for
#that particular policy.
#cmake_policy(GET CMPxxxx outVar)
#Ex:
cmake_policy(GET CMP0056 outVar) 
message (${outVar})


# Save existing policy state
cmake_policy(PUSH)
# Set some policies to OLD to preserve a few old behaviors
cmake_policy(SET CMP0060 OLD) 
cmake_policy(SET CMP0021 OLD)
# Restore earlier policy settings
cmake_policy(POP)
