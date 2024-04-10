set(project_dir "${CMAKE_CURRENT_LIST_DIR}/")
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

# find_package(seL4 REQUIRED)
# sel4_configure_platform_settings()

ApplyCommonSimulationSettings("${KernelSel4Arch}")
ApplyCommonReleaseVerificationSettings(${RELEASE} ${VERIFICATION})
