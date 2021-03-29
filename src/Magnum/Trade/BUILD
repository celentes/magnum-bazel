#
#   This file is part of Magnum.
#
#   Copyright © 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019,
#               2020, 2021 Vladimír Vondruš <mosra@centrum.cz>
#
#   Permission is hereby granted, free of charge, to any person obtaining a
#   copy of this software and associated documentation files (the "Software"),
#   to deal in the Software without restriction, including without limitation
#   the rights to use, copy, modify, merge, publish, distribute, sublicense,
#   and/or sell copies of the Software, and to permit persons to whom the
#   Software is furnished to do so, subject to the following conditions:
#
#   The above copyright notice and this permission notice shall be included
#   in all copies or substantial portions of the Software.
#
#   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#   THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#   DEALINGS IN THE SOFTWARE.
#
load("@corrade//:index.bzl", "corrade_configure_header")

package(default_visibility = ["//visibility:public"])

CURRENT_DIR = "@magnum_src//:src/Magnum/Trade/"

corrade_configure_header(
    name = "configure",
    src = CURRENT_DIR + "configure.h.cmake",
    output = "configure.h",
    defines = {},
    visibility = ["//:__pkg__"]
)

TRADE_SRCS = [
    CURRENT_DIR + "Implementation/arrayUtilities.h",
    CURRENT_DIR + "Implementation/converterUtilities.h",
    CURRENT_DIR + "Implementation/materialAttributeProperties.hpp",
    CURRENT_DIR + "Implementation/materialLayerProperties.hpp",
    CURRENT_DIR + "ArrayAllocator.cpp",
    CURRENT_DIR + "Data.cpp",
    CURRENT_DIR + "MeshObjectData2D.cpp",
    CURRENT_DIR + "MeshObjectData3D.cpp",
    CURRENT_DIR + "SceneData.cpp",
    CURRENT_DIR + "TextureData.cpp",
]

TRADE_GRACEFUL_ASSERT_SRCS = [
    CURRENT_DIR + "AbstractImageConverter.cpp",
    CURRENT_DIR + "AbstractImporter.cpp",
    CURRENT_DIR + "AbstractSceneConverter.cpp",
    CURRENT_DIR + "AnimationData.cpp",
    CURRENT_DIR + "CameraData.cpp",
    CURRENT_DIR + "FlatMaterialData.cpp",
    CURRENT_DIR + "ImageData.cpp",
    CURRENT_DIR + "LightData.cpp",
    CURRENT_DIR + "MaterialData.cpp",
    CURRENT_DIR + "MeshData.cpp",
    CURRENT_DIR + "ObjectData2D.cpp",
    CURRENT_DIR + "ObjectData3D.cpp",
    CURRENT_DIR + "PbrClearCoatMaterialData.cpp",
    CURRENT_DIR + "PbrMetallicRoughnessMaterialData.cpp",
    CURRENT_DIR + "PbrSpecularGlossinessMaterialData.cpp",
    CURRENT_DIR + "PhongMaterialData.cpp",
    CURRENT_DIR + "SkinData.cpp",
    # MAGNUM_BUILD_DEPRECATED
    CURRENT_DIR + "MeshData2D.cpp",
    CURRENT_DIR + "MeshData3D.cpp",
]

cc_library(
    name = "headers",
    hdrs = [
        ":configure",
        CURRENT_DIR + "AbstractImporter.h",
        CURRENT_DIR + "AbstractImageConverter.h",
        CURRENT_DIR + "AbstractSceneConverter.h",
        CURRENT_DIR + "AnimationData.h",
        CURRENT_DIR + "ArrayAllocator.h",
        CURRENT_DIR + "CameraData.h",
        CURRENT_DIR + "Data.h",
        CURRENT_DIR + "FlatMaterialData.h",
        CURRENT_DIR + "ImageData.h",
        CURRENT_DIR + "LightData.h",
        CURRENT_DIR + "MaterialData.h",
        CURRENT_DIR + "MaterialLayerData.h",
        CURRENT_DIR + "MeshData.h",
        CURRENT_DIR + "MeshObjectData2D.h",
        CURRENT_DIR + "MeshObjectData3D.h",
        CURRENT_DIR + "ObjectData2D.h",
        CURRENT_DIR + "ObjectData3D.h",
        CURRENT_DIR + "PbrClearCoatMaterialData.h",
        CURRENT_DIR + "PbrMetallicRoughnessMaterialData.h",
        CURRENT_DIR + "PbrSpecularGlossinessMaterialData.h",
        CURRENT_DIR + "PhongMaterialData.h",
        CURRENT_DIR + "SceneData.h",
        CURRENT_DIR + "SkinData.h",
        CURRENT_DIR + "TextureData.h",
        CURRENT_DIR + "Trade.h",
        CURRENT_DIR + "visibility.h",
        # MAGNUM_BUILD_DEPRECATED
        CURRENT_DIR + "AbstractMaterialData.h",
        CURRENT_DIR + "MeshData2D.h",
        CURRENT_DIR + "MeshData3D.h",
    ],
    deps = [
        "//src/Magnum:headers",
    ],
    visibility = ["//src/Magnum:__subpackages__"],
)

cc_library(
    name = "Trade",
    srcs = TRADE_SRCS + TRADE_GRACEFUL_ASSERT_SRCS,
    deps = [
        ":headers",
        "@corrade//:PluginManager",
        "@magnum//:Magnum",
    ],
)

cc_library(
    name = "TradeTestLib",
    srcs = TRADE_SRCS + TRADE_GRACEFUL_ASSERT_SRCS,
    deps = [
        ":headers",
        "@corrade//:PluginManager",
        "@magnum//:Magnum",
    ],
    local_defines = [
        "CORRADE_GRACEFUL_ASSERT",
        "MagnumTrade_EXPORTS",
    ],
    testonly = True,
    visibility = ["//src/Magnum:__subpackages__"]
)
