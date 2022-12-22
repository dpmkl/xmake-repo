package("cdt")
    set_homepage("https://artem-ogre.github.io/CDT/")
    set_description("Constrained Delaunay Triangulation (C++)")

    add_urls("https://github.com/artem-ogre/CDT/archive/refs/tags/$(version).tar.gz",
             "https://github.com/artem-ogre/CDT.git")
    add_versions("1.2.0", "9ab7b6f6737a422577443c98e53ea522f1a3df148dbf709d2019212bf134ab08")

    on_install(function (package)
        local configs = {}
        io.writefile("xmake.lua", [[
            add_rules("mode.release", "mode.debug")
            target("cdt")
                set_kind("$(kind)")
                add_files("src/*.c")
                add_headerfiles("src/(*.h)")
        ]])
        if package:config("shared") then
            configs.kind = "shared"
        end
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        assert(package:has_cfuncs("foo", {includes = "foo.h"}))
    end)
