package("azure-sdk-for-cpp")
    set_homepage("https://github.com/Azure/azure-sdk-for-cpp")
    set_description("This repository is for active development of the Azure SDK for C++.  For consumers of the SDK we recommend visiting our versioned developer docs at https://azure.github.io/azure-sdk-for-cpp. ")
    set_license("MIT")

    add_urls("https://github.com/Azure/azure-sdk-for-cpp/archive/refs/tags/azure-storage-files-datalake_12.5.0.tar.gz")
    add_versions("2023-01-10", "a84ce912907b804d1fd90d04c2050e0b3804c2185bd88d8802320c68470c02d5")

    add_deps("cmake")

    on_install(function (package)
        local configs = {}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
        import("package.tools.cmake").install(package, configs)
    end)

