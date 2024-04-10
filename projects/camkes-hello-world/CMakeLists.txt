cmake_minimum_required(VERSION 3.7.2)

include(../../settings.cmake)

project(camkes-hello-world C ASM)

find_package(camkes-tool REQUIRED)
camkes_tool_setup_camkes_build_environment()

DeclareCAmkESComponent(Client SOURCES src/client.c)
DeclareCAmkESRootserver(hello.camkes)
GenerateCAmkESRootserver()

include(simulation)
GenerateSimulateScript()
