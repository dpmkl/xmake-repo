package("cpp-mjpeg-streamer")
    set_homepage("https://github.com/hal9000-swarm/cpp-mjpeg-streamer")
    set_description("C++ MJPEG over HTTP Library")
    set_license("MIT")

    add_urls("https://github.com/hal9000-swarm/cpp-mjpeg-streamer.git")
    add_versions("2023.01.26", "28e3a75c08e036e104deaafaee877a63da85a3f1")

    add_deps("cmake")

    on_install(function (package)
        io.writefile("xmake.lua", [[
            add_rules("mode.debug", "mode.release")
            target("cpp-mjpeg-streamer")
                set_kind("headeronly")                
                add_headerfiles("single_include/nadjieb/mjpeg_streamer.hpp")
                add_rules("utils.install.cmake_importfiles")
                add_rules("utils.install.pkgconfig_importfiles")                
        ]])
        import("package.tools.xmake").install(package, config)
    end)

    
