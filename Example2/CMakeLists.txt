#Setting the minimum CMake version
cmake_minimum_required(VERSION 3.0.0)

#Project basic info
project(EXAMPLE_1 VERSION 1.0.1 LANGUAGES C CXX)

#${var_name} --getting variable name 

# set --simple variable setting
# message --cout/printf equivalent

set(status_variable "I am a simple message to represent status")
message(STATUS ${variable})

set(dev_warning "I am warning for developers")
message(AUTHOR_WARNING ${dev_warning})

# [[ some text ]] 
# [=[some text]=]    both examples are equivalent to quotes
set(multiLine [[
First line
Second line
]])
message(STATUS ${multiLine})
set(multiLine1 [=[
Print
]=])

#unset(var_name) is equivalent to the set(var_name) --means that we are setting nothing here
unset({multiLine1})
#message(STATUS "AAAA=="${multiLine1}) in case we use uncomment this. unset will do nothing

#Environment Variables
set(ENV{KEK} "SOME TEXT")

message(STATUS "${PATH}")


# Cache variables
# They are cached because they are present in the CmakeCache.txt
message(STATUS ${cached_value})# on first run printing emptyness. On the second printing <cached>. This how it should work.
set(cached_value "cachedVariableValue" CACHE STRING "Explanation?")
message(STATUS ${cached_value})

#cached boolean variable.
option(option_var "comment?" ON)
message(STATUS ${option_var})


#Also there is possibility to set CACHED variable from command line
#cmake -D Var_name:type=Value 
#Ex: cmake -D MY_VAR:BOOL=TRUE
message(STATUS ${MY_VAR})

#Removing variable from cache using cmd
#cmake -U SOME_CACHED_VAR -U ANOTHER_CACHED_VAR ..


#If value is an unquoted constant with value 1, ON, YES, TRUE, Y or a non-zero number, it will be evaluated as true.
#If value is an unquoted constant with value 0, OFF, NO, FALSE, N, IGNORE, NOTFOUND, an empty string or a string that ends in -NOTFOUND, it will be evaluated as false.

set(AAA NO)
set(BBB 1)
if(${AAA}) # Evaluates to false
endif()

if(${BBB})  # Evaluates to true
endif()

if(${bla_bla})

elseif(NOT ${bla_bla})

else()

endif()


if((${AAA} EQUAL ${BBB})AND (${bla_bla} EMPTY))
         message("EVALUATED")
endif()

#example of detecting system/compiler
if(UNIX)
     message("UNIX")
endif()

if(APPLE)
     message("Apple")
endif()


if(MSVC)
     message("MSVC compiler")
endif()

if(WIN32)
     message(STATUS "WIN32")
endif()

# generally speaking, we could interact with list/string as it is apropriate STL container

set(sample_long_str qwerty)
set(sample_short_str q)
string(FIND ${sample_long_str} ${sample_short_str} fwdIndex)
message("fwdIndex = ${fwdIndex}")

set(sample_long_str_2 zxcvbnm)
string(REGEX MATCHALL "[cvb]" match_var ${sample_long_str_2})
message("Success Match = ${match_var}")

string(REGEX MATCHALL "[aaa]" match_var ${sample_long_str_2})
message("Failed Match = ${match_var}")


#list example
set(my_list a b c d e f g)
list(LENGTH my_list out_var)
message("Length of list:${my_list} is ${out_var}")

list(GET my_list 3 5 0 s_letters)
message("s_letters = ${s_letters}")


#math example
set(a 2)
set(b 4)
math(EXPR c "(${a}+${b}) / 2")
message("result = ${c}")


message(STATUS "Using foreach cycle. Iterate over provided list")
foreach(iterator_var lol kek kek1 kek2 kek3)
        message("list_element = ${iterator_var}")
endforeach()


message(STATUS "Using foreach cycle to iterate over setted list.")
foreach(iterator_var  IN LISTS my_list)
        message("list_element = ${iterator_var}")
endforeach()

message(STATUS "Using foreach cycle to iterate over setted list. But with custom items in the list. by using ITEMS directive")
foreach(iterator_var  IN LISTS my_list ITEMS MUDA ORA VOLARE DORA)
        message("list_element = ${iterator_var}")
endforeach()


#RANGE <start> <stop> <step>(optional)
#default step is 1
#Equivalent example.
#foreach(iterator_var RANGE 0 10 1)
#foreach(iterator_var RANGE 0 10)
message(STATUS "Lets iterate in range")
foreach(iterator_var RANGE 0 10 )
        message("list_element = ${iterator_var}")
endforeach()

#also possible this condition
message(STATUS "Lets iterate in range (1)")
foreach(iterator_var RANGE -10)
       message("list_element = ${iterator_var}")
endforeach()

message(STATUS "While cycle")
set(while_var -20)
#while cycles
while(NOT ${while_var} EQUAL -30) #not should be always before
     if(${while_var} EQUAL -27)
          break()
     endif()
     math(EXPR while_var "${while_var}-1")   #calculation
     if(${while_var} EQUAL -22)
          continue()
     endif()
     message("while_element = ${while_var}")
endwhile()


