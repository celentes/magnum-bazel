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
load("@corrade//:index.bzl", "corrade_resource")

package(default_visibility = ["//visibility:public"])

CURRENT_DIR = "@magnum_src//:src/Magnum/DebugTools/"

cc_library(
    name = "headers",
    hdrs = [
        CURRENT_DIR + "ColorMap.h",
        CURRENT_DIR + "DebugTools.h",
        CURRENT_DIR + "FrameProfiler.h",
        CURRENT_DIR + "visibility.h",
        # gl
        CURRENT_DIR + "ResourceManager.h",
        CURRENT_DIR + "Screenshot.h",
        CURRENT_DIR + "TextureImage.h",
        # deprecated
        CURRENT_DIR + "Profiler.h",
        # testsuite
        CURRENT_DIR + "CompareImage.h",
        # scenegraph
        CURRENT_DIR + "ForceRenderer.h",
        CURRENT_DIR + "ObjectRenderer.h",
        # should be in src but the test needs it
        CURRENT_DIR + "Implementation/ForceRendererTransformation.h",
    ] + select({
        "@corrade//bazel/platforms:linux": [
            CURRENT_DIR + "BufferData.h",
        ],
        "@corrade//bazel/platforms:emscripten": []
    }),
    deps = [
        "//src/Magnum:headers",
    ],
    visibility = ["@magnum//:__subpackages__"],
)

corrade_resource(
    name = "MagnumDebugTools_RESOURCES",
    conf = CURRENT_DIR + "resources.conf",
    deps = [
        CURRENT_DIR + "TextureImage.vert",
        CURRENT_DIR + "TextureImage.frag",
    ],
)

DEBUGTOOLS_SRC = [
    CURRENT_DIR + "ColorMap.cpp",
    # gl
    CURRENT_DIR + "ResourceManager.cpp",
    CURRENT_DIR + "Screenshot.cpp",
    CURRENT_DIR + "TextureImage.cpp",
    # deprecated
    CURRENT_DIR + "Profiler.cpp",
    # scenegraph
    CURRENT_DIR + "ForceRenderer.cpp",
    CURRENT_DIR + "ObjectRenderer.cpp",
]

DEBUGTOOLS_GRACEFUL_ASSERT_SRCS = [
    CURRENT_DIR + "FrameProfiler.cpp",
    # testsuite
    CURRENT_DIR + "CompareImage.cpp",
]

cc_library(
    name = "DebugTools",
    srcs = DEBUGTOOLS_SRC + DEBUGTOOLS_GRACEFUL_ASSERT_SRCS + select({
        "@corrade//bazel/platforms:linux": [
            CURRENT_DIR + "BufferData.cpp",
        ],
        "@corrade//bazel/platforms:emscripten": [
            ":MagnumDebugTools_RESOURCES",
        ]
    }),
    deps = [
        ":headers",
        "//src/Magnum:Magnum",
        "//src/Magnum/GL:GL",
        # testsuite
        "@corrade//:TestSuite",
        "//src/Magnum/Trade:Trade",
        # gl
        "//src/Magnum/MeshTools:MeshTools",
        "//src/Magnum/Primitives:Primitives",
        "//src/Magnum/SceneGraph:SceneGraph",
        "//src/Magnum/Shaders:Shaders",
    ],
)

cc_library(
    name = "DebugToolsTestLib",
    srcs = DEBUGTOOLS_SRC + DEBUGTOOLS_GRACEFUL_ASSERT_SRCS + select({
        "@corrade//bazel/platforms:linux": [
            CURRENT_DIR + "BufferData.cpp",
        ],
        "@corrade//bazel/platforms:emscripten": [
            ":DebugToolsResources",
        ]
    }),
    deps = [
        ":headers",
        "//src/Magnum:Magnum",
        "//src/Magnum/GL:GL",
        # testsuite
        "@corrade//:TestSuite",
        "//src/Magnum/Trade:Trade",
        # gl
        "//src/Magnum/MeshTools:MeshTools",
        "//src/Magnum/Primitives:Primitives",
        "//src/Magnum/SceneGraph:SceneGraph",
        "//src/Magnum/Shaders:Shaders",
    ],
    local_defines = ["CORRADE_GRACEFUL_ASSERT"],
    testonly = True,
    visibility = ["//src/Magnum:__subpackages__"],
)
