cmake_minimum_required(VERSION 3.7.2)

include(../../settings.cmake)

project(camkes-hello-world C ASM)

find_package(camkes-vm REQUIRED)
include(../camkes-vm/camkes_vm_helpers.cmake)

camkes_x86_vm_setup_x86_vm_environment()

find_package(camkes-vm-linux REQUIRED)
include(../camkes-vm-linux/vm-linux-helpers.cmake)

DecompressLinuxKernel(extract_linux_kernel decompressed_kernel /run/media/data/moritz/Repositories/dlr/sel4-vm/projects/vm-minimal/default_bzimage_4.8.16)
AddToFileServer("bzimage" ${decompressed_kernel} DEPENDS extract_linux_kernel)
AddToFileServer("rootfs.cpio" /run/media/data/moritz/Repositories/dlr/sel4-vm/projects/vm-minimal/default_buildroot_rootfs-bare.cpio)

DeclareCAmkESVM(Init0)
DeclareCAmkESVMRootServer(minimal-vm.camkes)

GenerateCAmkESRootserver()

include(simulation)
GenerateSimulateScript()
