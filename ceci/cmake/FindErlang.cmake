#.rst:
#
# FindErlang
# ----------
#
# Try to find the Erlang runtime and C bindings.
#
# This will define the following variables:
#
# ``Erlang_FOUND``
#    True if Erlang is available.
#
# ``Erlang_INCLUDE_DIRS``
#    Directories to add to the include path for Erlang C binding headers.
#
#
message(STATUS "Looking for Erlang ..")

find_program(Erlang_EXECUTABLE NAMES erlc)

find_path(_ei_dir ei.h)
find_path(_erl_dir erl_interface.h)

if(_ei_dir AND _erl_dir)
    if(_ei_dir STREQUAL _erl_dir)
        SET(Erlang_INCLUDE_DIRS ${_ei_dir})
    else()
        SET(Erlang_INCLUDE_DIRS ${_ei_dir} ${_erl_dir})
    endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Erlang
    FOUND_VAR
        Erlang_FOUND
    REQUIRED_VARS
        Erlang_EXECUTABLE
        Erlang_INCLUDE_DIRS
)
