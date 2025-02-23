project "GLFW"
    kind "StaticLib"
    language "C"
    staticruntime "on"

    targetdir ( "bin/".. outputdir .. "/%{prj.name}" )
    objdir    ( "bin/intermediates/" .. outputdir .. "/%{prj.name}" )  

    files
    {
        "include/glfw3.h",
        "include/glfw3native.h",
        "src/egl_context.c",
        "src/internal.h" ,
        "src/mappings.h",
        "src/context.c",
        "src/init.c",
        "src/input.c" ,
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c",
        "src/osmesa_context.c"
    }

    includedirs
    {
        "include"
    }

filter "system:linux"
        pic "On"

        systemversion "latest"
        staticruntime "On"

        files
        {
            "src/x11_init.c",
            "src/x11_monitor.c",
            "src/x11_window.c",
            "src/xkb_unicode.c",
            "src/posix_time.c",
            "src/posix_thread.c",
            "src/glx_context.c",
            "src/linux_joystick.c"
        }

        defines
        {
            "_GLFW_X11"
        }

    filter "system:windows"
        systemversion "latest"

        files 
        {
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
        }

        defines 
        { 
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

    filter "system:MacOS"
        systemversion "latest"

        files
        {
            "src/cocoa_init.m",
            "src/cocoa_monitor.m",
            "src/cocoa_window.m",
            "src/cocoa_platform.h",
            "src/cocoa_time.c",
            "src/nsgl_context.h",
            "src/nsgl_context.m",
            "src/cocoa_joystick.h",
            "src/cocoa_joystick.m"
        }

        defines
        {
            "_GLFW_COCOA"
        }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
