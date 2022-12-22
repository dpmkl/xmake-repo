package("cdt")
    set_homepage("https://artem-ogre.github.io/CDT/")
    set_description("Constrained Delaunay Triangulation (C++)")

    add_urls("https://github.com/artem-ogre/CDT/archive/refs/tags/$(version).tar.gz",
             "https://github.com/artem-ogre/CDT.git")
    add_versions("1.2.0", "9ab7b6f6737a422577443c98e53ea522f1a3df148dbf709d2019212bf134ab08")

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end	
	table.insert(configs, "-DCDT_USE_AS_COMPILED_LIBRARY=ON")
	os.cd("CDT")
	import("package.tools.cmake").install(package, configs)
    end)

