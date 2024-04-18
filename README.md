# sel4-vm

## Build

```
mkdir build && cd build

cmake -GNinja -DCMAKE_TOOLCHAIN_FILE=../kernel/gcc.cmake -DPLATFORM=x86_64 -DKernelVTX=ON -DKernelX86_64VTX64BitGuests=ON -DRELEASE=FALSE -DVERIFICATION=FALSE -DKernelIsMCS=ON -DLibSel4FunctionAttributes=public -DKernelDangerousCodeInjection=ON -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ../projects/camkes-hello-world

ninja
```

## Qemu

```
qemu-system-x86_64 -cpu host -enable-kvm -m 1G -nographic -serial mon:stdio -kernel images/kernel-x86_64-pc99 -initrd images/capdl-loader-image-x86_64-pc99
```