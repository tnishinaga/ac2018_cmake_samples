# toolchain
set(CMAKE_C_COMPILER clang)
set(CMAKE_AR llvm-ar CACHE FILEPATH "Arhiver")
set(CMAKE_RANLIB llvm-ranlib CACHE FILEPATH "Ranlib")
set(CMAKE_AS llvm-as)
set(CMAKE_NM llvm-nm)
set(CMAKE_OBJDUMP llvm-objdump)

# to pass compiler test
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# target
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR aarch64)
set(triple aarch64-pc-windows-coff)
set(CMAKE_C_COMPILER_TARGET ${triple})

# sysroot
set(CMAKE_SYSROOT $ENV{HOME}/opt/llvm/aarch64-none-eabi)
set(CMAKE_INCLUDE_PATH ${CMAKE_SYSROOT}/include)
set(CMAKE_LIBRARY_PATH ${CMAKE_SYSROOT}/lib)
set(CMAKE_INSTALL_PREFIX ${CMAKE_SYSROOT}/)
set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# set include directories
include_directories(${CMAKE_SYSROOT}/include/efi)
include_directories(${CMAKE_SYSROOT}/include/efi/aarch64)

# flags
# C
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-stack-protector -fshort-wchar")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c11 -Wall -Wextra -Wpedantic")


# linker
set(ld_flags "-subsystem:efi_application -dll -entry:efi_main")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${ld_flags}")

set(CMAKE_C_LINK_EXECUTABLE "/usr/bin/lld-link <LINK_FLAGS> <OBJECTS> <LINK_LIBRARIES> -out:<TARGET>")
