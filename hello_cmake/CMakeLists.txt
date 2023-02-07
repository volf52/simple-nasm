cmake_minimum_required(VERSION 3.14)
# https://cmake.org/cmake/help/latest/policy/CMP0083.html
cmake_policy(SET CMP0083 NEW)

project(
  hello-world
  VERSION 0.1.0
  DESCRIPTION "Hello World"
  HOMEPAGE_URL "https://github.com/volf52/simple-nasm"
  LANGUAGES C ASM_NASM)

string(COMPARE EQUAL "${CMAKE_SOURCE_DIR}" "${PROJECT_SOURCE_DIR}"
               PROJECT_IS_TOP_LEVEL)

include(CheckPIESupported)
check_pie_supported()

# set(ASM_LIB ${PROJECT_NAME}_asm)
set(ASM_LIB hello_world_asm)
# set(PROJ_LIB ${PROJECT_NAME}_lib) set(PROJ_EXE ${PROJECT_NAME}_exe)
set(PROJ_EXE hello_world_exe)

set(OUTPUT_EXEC_NAME hello_world)

# ---- ASM
set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)
set(CMAKE_ASM_NASM_FLAGS_DEBUG "-g -F dwarf")

add_library(${ASM_LIB} OBJECT src/hello.asm)
# ---- C Lib (if required)
#
# add_library(hello_world_lib OBJECT src/lib.c)
# target_compile_features(hello_world_lib PUBLIC c_std_99)

# ---- Executable
add_executable(${PROJ_EXE} src/main.c)

set_property(TARGET ${PROJ_EXE} PROPERTY OUTPUT_NAME ${OUTPUT_EXEC_NAME})
set_property(TARGET ${PROJ_EXE} PROPERTY POSITION_INDEPENDENT_CODE FALSE)

target_compile_features(${PROJ_EXE} PRIVATE c_std_99)
target_compile_options(${PROJ_EXE} PRIVATE -Wall -Wextra -pedantic -Werror)
target_link_options(${PROJ_EXE} PRIVATE -Wl,--fatal-warnings)
target_link_libraries(${PROJ_EXE} PRIVATE ${ASM_LIB})
