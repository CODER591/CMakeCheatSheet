
# functions and macro
# very similar to C/C++ counterparts

function(print_text text)
    message(${text})
endfunction()


function(count_to_ten)
     foreach(iter_var RANGE 10)
      message(${iter_var})
     endforeach()
endfunction()

#generally is kinda cool if we need to play with scope. As macro is only the pasted text and have no scope
macro(cool_printing_macro_name first_arg)
       message(${first_arg})
endmacro()


# called like print_args(a b c d e f g)
function(print_args arg arg1 arg2)
       message("${ARGV}") # all arguments which were defined.
       message("${ARGC}") # 7  = ${ARGV} + ${ARGN}
       message("${ARGN}") # arguments beyond defined d e f g
endfunction()


#without PARENT_SCOPE it would be simply local scope change
function(return_value_example argument value_to_be_returned)
         set(${value_to_be_returned} ${argument} PARENT_SCOPE)
endfunction()

#example of function wrapping
#Better way is to avoid such wrapping as it may lead to infinite recursion
function(pront)
       message("pront")
endfunction()

function(pront)
        message("pront wrapped") # all arguments which were defined.
        _pront()
endfunction()
