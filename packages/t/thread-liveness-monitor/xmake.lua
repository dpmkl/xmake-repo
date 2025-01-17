package("thread-liveness-monitor")
    set_homepage("https://github.com/shuvalov-mdb/thread-liveness-monitor")
    set_description("Low cost runtime deadlock detection with checkpoints history")
    set_license("MIT")

    add_urls("https://github.com/shuvalov-mdb/thread-liveness-monitor/archive/refs/tags/$(version).tar.gz",
             "https://github.com/shuvalov-mdb/thread-liveness-monitor.git")
    add_versions("v1.0.0", "53b85758ed8846cc5fb6339081b525fa50fd4bb92c26ee731682359792aa62df")

    add_deps("cmake")

    on_install(function (package)
        io.writefile("xmake.lua", [[            
            add_rules("mode.debug", "mode.release")
            target("thread-liveness-monitor")
                set_kind("static")
                add_headerfiles("src/thread_monitor/thread_monitor.h", 
                                "src/thread_monitor/thread_monitor_central_repository.h",
                                { prefixdir = "thread_monitor" } )
                add_files("thread_monitor.cpp", "thread_monitor_central_repository.cpp")
                add_rules("utils.install.cmake_importfiles")
                add_rules("utils.install.pkgconfig_importfiles")                
        ]])
        import("package.tools.xmake").install(package, config)
    end)

