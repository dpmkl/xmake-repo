package("paho.mqtt.c")
    set_homepage("https://eclipse.org/paho")
    set_description("An Eclipse Paho C client library for MQTT for Windows, Linux and MacOS. API documentation: https://eclipse.github.io/paho.mqtt.c/")

    add_urls("https://github.com/eclipse/paho.mqtt.c/archive/refs/tags/$(version).tar.gz",
             "https://github.com/eclipse/paho.mqtt.c.git")
    add_versions("v1.3.12", "6a70a664ed3bbcc1eafdc45a5dc11f3ad70c9bac12a54c2f8cef15c0e7d0a93b")

    add_deps("cmake")

    on_install(function (package)
        local configs = {}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        table.insert(configs, "-DPAHO_BUILD_STATIC=" .. "ON")
        table.insert(configs, "-DPAHO_BUILD_SHARED=" .. "OFF")
        import("package.tools.cmake").install(package, configs)
    end)

