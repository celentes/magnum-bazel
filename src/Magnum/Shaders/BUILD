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

CURRENT_DIR = "@magnum_src//:src/Magnum/Shaders/"

cc_library(
    name = "headers",
    hdrs = [
        CURRENT_DIR + "DistanceFieldVector.h",
        CURRENT_DIR + "AbstractVector.h",
        CURRENT_DIR + "Flat.h",
        CURRENT_DIR + "Generic.h",
        CURRENT_DIR + "MeshVisualizer.h",
        CURRENT_DIR + "Phong.h",
        CURRENT_DIR + "Shaders.h",
        CURRENT_DIR + "Vector.h",
        CURRENT_DIR + "VertexColor.h",
        CURRENT_DIR + "visibility.h",
    ],
    deps = [
        "//src/Magnum:headers",
    ],
    visibility = ["@magnum//:__subpackages__"],
)

corrade_resource(
    name = "ShadersResources",
    conf = CURRENT_DIR + "resources.conf",
    deps = [
        CURRENT_DIR + "AbstractVector.vert",
        CURRENT_DIR + "Flat.vert",
        CURRENT_DIR + "Flat.frag",
        CURRENT_DIR + "FullScreenTriangle.glsl",
        CURRENT_DIR + "generic.glsl",
        CURRENT_DIR + "MeshVisualizer.vert",
        CURRENT_DIR + "MeshVisualizer.geom",
        CURRENT_DIR + "MeshVisualizer.frag",
        CURRENT_DIR + "Phong.vert",
        CURRENT_DIR + "Phong.frag",
        CURRENT_DIR + "Vector.frag",
        CURRENT_DIR + "DistanceFieldVector.frag",
        CURRENT_DIR + "VertexColor.vert",
        CURRENT_DIR + "VertexColor.frag",
        CURRENT_DIR + "compatibility.glsl",
    ],
)

SHADERS_SRCS = [
    CURRENT_DIR + "AbstractVector.cpp",
    CURRENT_DIR + "VertexColor.cpp",
    CURRENT_DIR + "Implementation/CreateCompatibilityShader.h",
    ":ShadersResources",
]

SHADERS_GRACEFUL_ASSERT_SRCS = [
    CURRENT_DIR + "DistanceFieldVector.cpp",
    CURRENT_DIR + "Flat.cpp",
    CURRENT_DIR + "MeshVisualizer.cpp",
    CURRENT_DIR + "Phong.cpp",
    CURRENT_DIR + "Vector.cpp",
]

cc_library(
    name = "Shaders",
    srcs = SHADERS_SRCS + SHADERS_GRACEFUL_ASSERT_SRCS,
    deps = [
        ":headers",
        "//src/Magnum:Magnum",
        "//src/Magnum/GL:GL",
    ],
)

cc_library(
    name = "ShadersTestLib",
    srcs = SHADERS_SRCS + SHADERS_GRACEFUL_ASSERT_SRCS,
    deps = [
        ":headers",
        "//src/Magnum:Magnum",
        "//src/Magnum/GL:GL",
    ],
    local_defines = ["CORRADE_GRACEFUL_ASSERT"],
    testonly = True,
    visibility = ["//src/Magnum:__subpackages__"],
)
