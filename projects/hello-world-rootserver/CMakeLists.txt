cmake_minimum_required(VERSION 3.18.4)
project(hello-world-rootserver C)

add_executable(hello-world-rootserver src/main.c)
target_link_libraries(hello-world-rootserver sel4muslcsys muslc)

DeclareRootserver(hello-world-rootserver)

