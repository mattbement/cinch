#
#  MKL_ROOT         - Search path for MKL installation
#  MKL_INCLUDE_DIRS - where to find MKL.h, etc
#  MKL_LIBRARIES    - List of libraries when using MKL.
#  MKL_FOUND        - True if MKL found.
#
message (STATUS "HERE I AM!!")
message (STATUS "MKL_ROOT: ${MKL_ROOT}")
set(MKL_ROOT "/opt/intel/compilers_and_libraries/linux/mkl" CACHE PATH "Root directory of MKL installation")
message (STATUS "MKL_ROOT: ${MKL_ROOT}")
if(NOT ${MKL_ROOT})
	set(MKL_ROOT "/opt/intel/mkl" CACHE PATH "Root directory of MKL installation")
  message (STATUS "MKL_ROOT: ${MKL_ROOT}")
endif()

find_path(MKL_INCLUDE_DIR mkl.h
	HINTS ${MKL_ROOT}/include
   PATHS ${MKL_ROOT}/include)

find_library(MKL_INTEL_LIBRARY mkl_intel_lp64  
	PATHS ${MKL_ROOT}/lib/intel64)
find_library(MKL_SEQUENTIAL_LIBRARY mkl_sequential 
	PATHS ${MKL_ROOT}/lib/intel64)
find_library(MKL_CORE_LIBRARY mkl_core 
	PATHS ${MKL_ROOT}/lib/intel64)
  
set(MKL_LIBRARIES ${MKL_INTEL_LIBRARY} ${MKL_SEQUENTIAL_LIBRARY} ${MKL_CORE_LIBRARY})
set(MKL_INCLUDE_DIRS "${MKL_INCLUDE_DIR}")
message (STATUS "MKL_LIBRARIES: ${MKL_LIBRARIES}")
message (STATUS "MKL_INCLUDE_DIRS: ${MKL_INCLUDE_DIRS}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MKL DEFAULT_MSG MKL_CORE_LIBRARY MKL_INCLUDE_DIR)

mark_as_advanced(MKL_INCLUDE_DIR MKL_CORE_LIBRARY)
