

cmake_minimum_required(VERSION 3.1.0)
project(Example10)

set(input "kek.txt")

get_filename_component(returnVariable ${input} NAME)
message( "${returnVariable}" )

get_filename_component(returnVariable_1 ${input} EXT)
message( "${returnVariable_1}" )

get_filename_component(returnVariable_2 ${input} NAME_WE)
message( "${returnVariable_2}" )

get_filename_component(returnVariable_3 ${input} PATH)
message( "${returnVariable_3}" )

#CACHE means that "returnVariable_4 will appear in the CmakeCache.txt
get_filename_component(returnVariable_4 ${input} ABSOLUTE CACHE)
message( "${returnVariable_4}" )

get_filename_component(returnVariable_5 cat PROGRAM kek.txt)
message( "${returnVariable_5}" ) #path to cat program

# file() --Relative path manipulation example
set(basePath   /etc)
set(fooBarPath /etc/stunnel/valid_certs)
set(otherPath  /etc/apache2/)

file(RELATIVE_PATH fooBar ${basePath} ${fooBarPath})
file(RELATIVE_PATH other  ${basePath} ${otherPath})
  # The variables now have the following values:
  #   fooBar = foo/bar
  #   other  = ../other/place
message( "${fooBar}" )
message( "${other}")

set(some_path "/hello/friend:/nice/guy:/mur/femma")
#Conversion of some system used path to CMake path format
file(TO_CMAKE_PATH ${some_path} outVar)
message("${outVar}")

#conversion of CMAKE_PATH style to system path type(like substitution of \ or /)
#It does not working on UNIX. it leaves ; as they are, instead of substitution to the :
file(TO_NATIVE_PATH "/hello;/usr/bin/;/kek/lol" outVar1)
message("${outVar1}")

#Copying files

#When performing the copy, configure_file() has the ability to substitute CMake variables.
#Without the COPYONLY or @ONLY options,
#Anything in the source file that looks like a use of a CMake variable (i.e. has the form ${someVar})
#will be replaced by the value of that variable.
#If no variable exists with that name, an empty string is substituted.
#Strings of the form @someVar@ are also substituted in the same way.
set(nice_variable "NiceVAR")
configure_file(configure_sample.txt copies/configure_sample_configured.txt)

#Simple copying example
configure_file(configure_sample.txt copies/configure_sample.txt @ONLY)

#Using file directive
file(COPY configure_sample.txt DESTINATION copies/)
file(COPY cool.sh DESTINATION copies/
                  FILE_PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE
                       GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_WRITE)

#Files which are ended with _dummy will be IGNORED
file(COPY source/ DESTINATION source_copies/
                                 REGEX ./*_dummy\\.cpp EXCLUDE
                                 PATTERN *.cpp
                                 PERMISSIONS OWNER_READ
                                             OWNER_WRITE
                                             OWNER_EXECUTE)

# Third way is to use add_custom_command and add_custom_target
# [TO BE DONE]


#WRITING to files
file(WRITE nice_file.txt "I AM NICE" )
file(APPEND nice_file.txt "APPENDed string" )
#there will be "I AM NICEAPPENDed string"


file(WRITE text_to_remove.txt [[
First line
Second line
                        ]])

file(GENERATE
OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/outputfile-$<CONFIG>.txt
INPUT  ${CMAKE_CURRENT_SOURCE_DIR}/inputfile.txt.in
CONDITION $<NOT:$<CONFIG:Release>>
)

#READING from files
file(READ nice_file.txt outputVar)
message("${outputVar}")
#HEX is optionalб content will be converted to the HEX
file(READ nice_file.txt outputVar
      OFFSET 2 LIMIT 20 HEX
)
message("${outputVar}")


file(MAKE_DIRECTORY directory_to_rename directory_to_remove)
file(RENAME directory_to_rename renamed_directory)
file(REMOVE_RECURSE directory_to_remove) #rm -r
file(REMOVE text_to_remove.txt)# only for files rm


#file(DOWNLOAD [url] fileName [options])
#file(UPLOAD [url] fileName [options])
