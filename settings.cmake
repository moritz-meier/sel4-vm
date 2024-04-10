set(project_dir "${CMAKE_CURRENT_LIST_DIR}")
file(GLOB project_modules ${project_dir}/projects/*)
list(
	APPEND
	    CMAKE_MODULE_PATH
	    "${project_dir}/kernel"
	    "${project_dir}/tools/seL4/cmake-tool/helpers"
	    "${project_dir}/tools/seL4/elfloader-tool"
	    ${project_modules})

include(application_settings)

correct_platform_strings()

set(LibSel4PlatSupportUseDebugPutChar true CACHE BOOL "" FORCE)
set(CapDLLoaderMaxObjects 20000 CACHE STRING "" FORCE)
set(KernelRootCNodeSizeBits 16 CACHE STRING "")
set(LibSel4MuslcSysDebugHalt FALSE CACHE BOOL "" FORCE)
set(KernelNumDomains 1 CACHE STRING "" FORCE)

ApplyCommonSimulationSettings("${KernelSel4Arch}")
ApplyCommonReleaseVerificationSettings(${RELEASE} ${VERIFICATION})
