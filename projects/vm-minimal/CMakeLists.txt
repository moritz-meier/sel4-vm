cmake_minimum_required(VERSION 3.7.2)

include(../../settings.cmake)

project(camkes-hello-world C ASM)

find_package(camkes-vm REQUIRED)
include(../camkes-vm/camkes_vm_helpers.cmake)

camkes_x86_vm_setup_x86_vm_environment()

find_package(camkes-vm-linux REQUIRED)
include(../camkes-vm-linux/vm-linux-helpers.cmake)

GetDefaultLinuxKernelFile(kernel_file)
GetDefaultLinuxRootfsFile(rootfs_file)

DecompressLinuxKernel(extract_linux_kernel decompressed_kernel ${kernel_file})
AddToFileServer("bzimage" ${decompressed_kernel} DEPENDS extract_linux_kernel)
AddToFileServer("rootfs.cpio" ${rootfs_file})

DeclareCAmkESVM(Init0)
DeclareCAmkESVMRootServer(minimal-vm.camkes)

GenerateCAmkESRootserver()

include(simulation)
GenerateSimulateScript()
