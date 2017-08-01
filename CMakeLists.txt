cmake_minimum_required (VERSION 3.4)

project (TestLibProtobuf)

# protobuf
find_path(PROTOBUF_INCLUDE_DIR google/protobuf/stubs/common.h)
find_library(PROTOBUF_LIBRARY libprotobuf)
if (PROTOBUF_INCLUDE_DIR AND PROTOBUF_LIBRARY)
	include_directories(${PROJECT_SOURCE_DIR}/generated)
	include_directories(${PROTOBUF_INCLUDE_DIR})
	set(MY_LIBRARIES ${MY_LIBRARIES} ${PROTOBUF_LIBRARY})
endif()

set(HEADERS
)

set(SOURCES
	main.cpp
)

file(GLOB INTERFACE_HEADERS ${PROJECT_SOURCE_DIR}/generated/*.h)
file(GLOB INTERFACE_SOURCES ${PROJECT_SOURCE_DIR}/generated/*.cc)
source_group("Generated Files" FILES ${INTERFACE_SOURCES} ${INTERFACE_HEADERS})

add_executable (TestLibProtobuf ${SOURCES} ${HEADERS} ${INTERFACE_SOURCES} ${INTERFACE_HEADERS})

target_link_libraries (TestLibProtobuf ${MY_LIBRARIES})