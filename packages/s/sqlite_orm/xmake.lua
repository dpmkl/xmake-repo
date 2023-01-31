package("sqlite_orm")
    set_homepage("https://github.com/fnc12/sqlite_orm")
    set_description("❤️ SQLite ORM light header only library for modern C++")

    add_urls("https://github.com/fnc12/sqlite_orm/archive/refs/tags/$(version).tar.gz",
             "https://github.com/fnc12/sqlite_orm.git")
    add_versions("v1.8.1", "3fbe40d4bb7884a29a9a5764baa27e150ef53940895eb097014202bee3f06644")

    add_deps("cmake")

    on_install(function (package)
        local configs = {}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
        import("package.tools.cmake").install(package, configs)
    end)

