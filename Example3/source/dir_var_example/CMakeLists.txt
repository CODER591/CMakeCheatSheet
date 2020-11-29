

message("EXAMPLE_VAR in the subdirectory BEFORE change: ${EXAMPLE_VAR}")
set(EXAMPLE_VAR 10)
message("EXAMPLE_VAR in the subdirectory AFTER change: ${EXAMPLE_VAR}")


#So, inherited variables after changing in child scope are not affected in the parent scope.
