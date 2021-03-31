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

CURRENT_DIR = "@magnum_src//:src/Magnum/TextureTools/"
SHADERS_DIR = "@magnum_src//:src/Magnum/Shaders/"

cc_library(
    name = "headers",
    hdrs = [
        CURRENT_DIR + "Atlas.h",
        CURRENT_DIR + "visibility.h",
        # gl
        CURRENT_DIR + "DistanceField.h",
    ],
    deps = [
        "//src/Magnum:headers",
        "//src/Magnum/Shaders:headers",
    ],
    visibility = ["@magnum//:__subpackages__"],
)

corrade_resource(
    name = "TextureToolsResources",
    conf = CURRENT_DIR + "resources.conf",
    deps = [
        CURRENT_DIR + "DistanceFieldShader.vert",
        CURRENT_DIR + "DistanceFieldShader.frag",
        SHADERS_DIR + "FullScreenTriangle.glsl",
        SHADERS_DIR + "compatibility.glsl",
    ],
)

TEXTURETOOLS_SRC = [
    ":TextureToolsResources",
    CURRENT_DIR + "Atlas.cpp",
    CURRENT_DIR + "DistanceField.cpp",
]

cc_library(
    name = "TextureTools",
    srcs = TEXTURETOOLS_SRC,
    deps = [
        ":headers",
        "//src/Magnum:Magnum",
        "//src/Magnum/GL:GL",
    ],
)
