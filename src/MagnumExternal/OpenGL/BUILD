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
package(default_visibility = ["//visibility:public"])

CURRENT_DIR = "@magnum_src//:src/MagnumExternal/OpenGL/"

cc_library(
    name = "FlextGL",
    hdrs = select({
        "@corrade//bazel/platforms:linux": [
            CURRENT_DIR + "GL/flextGL.h",
            CURRENT_DIR + "KHR/khrplatform.h",
        ],
        "@corrade//bazel/platforms:emscripten": [
            CURRENT_DIR + "GLES3/flextGLEmscripten.h",
            CURRENT_DIR + "KHR/khrplatform.h",
        ],
    }),
    srcs = select({
        "@corrade//bazel/platforms:linux": [
            CURRENT_DIR + "GL/flextGL.cpp",
        ],
        "@corrade//bazel/platforms:emscripten": [],
    }),
    deps = [
        "//src/Magnum/GL:headers",
        "@corrade//:Utility",
    ],
)

# TODO: selects
filegroup(
    name = "flextGLPlatform.cpp",
    srcs = [
        CURRENT_DIR + "GL/flextGLPlatform.cpp",
    ],
)
