#include_guard([DIRECTORY|GLOBAL])
#working in the same way as ifndef->define->endif

add_library(empty_lib STATIC
            source/dir_include_directive_example/empty.cpp
           )
# only full relative path
