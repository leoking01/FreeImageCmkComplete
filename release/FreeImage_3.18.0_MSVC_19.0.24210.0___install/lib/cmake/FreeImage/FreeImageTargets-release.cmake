#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "FreeImage::FreeImage" for configuration "Release"
set_property(TARGET FreeImage::FreeImage APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(FreeImage::FreeImage PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/FreeImage.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/FreeImage.dll"
  )

list(APPEND _cmake_import_check_targets FreeImage::FreeImage )
list(APPEND _cmake_import_check_files_for_FreeImage::FreeImage "${_IMPORT_PREFIX}/lib/FreeImage.lib" "${_IMPORT_PREFIX}/bin/FreeImage.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
