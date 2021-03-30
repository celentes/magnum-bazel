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

CURRENT_DIR = "@magnum_src//:src/Magnum/Platform/"

cc_library(
    name = "headers",
    hdrs = [
        CURRENT_DIR + "GLContext.h",
        CURRENT_DIR + "Platform.h",
        CURRENT_DIR + "Screen.h",
        CURRENT_DIR + "ScreenedApplication.h",
        CURRENT_DIR + "ScreenedApplication.hpp",
    ],
    deps = [
        "//src/Magnum:headers",
    ],
    visibility = ["//src/Magnum:__subpackages__"],
)

# TODO: native
cc_library(
    name = "Platform",
    srcs = [
        CURRENT_DIR + "Implementation/DpiScaling.h",
        CURRENT_DIR + "Implementation/DpiScaling.cpp",
    ],
    linkopts = select({
        "@corrade//bazel/platforms:linux": [
            #"-lGL",
            "-ldl",
        ],
        "@corrade//bazel/platforms:emscripten": [
        ],
    }),
    defines = select({
        "@corrade//bazel/platforms:linux": {
            "_MAGNUM_PLATFORM_USE_X11": "",
        },
        "@corrade//bazel/platforms:emscripten": {
        },
    }),
    deps = select({
        "@corrade//bazel/platforms:linux": [
            ":headers",
            "//src/Magnum:Magnum",
        ],
        "@corrade//bazel/platforms:emscripten": [
            ":headers",
            "//src/Magnum:Magnum",
        ],
    }),
)

# TODO: native
# TODO: fix SDL2 not being preloaded on emscripten side
cc_library(
    name = "Sdl2Application",
    srcs = [CURRENT_DIR + "Sdl2Application.cpp"],
    hdrs = [CURRENT_DIR + "Sdl2Application.h"],
    deps = [
        ":Platform",
        "//src/Magnum/GL:GL",
        # TODO: this is not needed on emscripten
        #"@bazelregistry_sdl2//:SDL2_lib",
    ],
    linkopts = select({
        "@corrade//bazel/platforms:linux": [],
        "@corrade//bazel/platforms:emscripten": [
            "-s", "USE_SDL=2",
        ],
    }),
)

cc_library(
    name = "EmscriptenApplication",
    srcs = [CURRENT_DIR + "EmscriptenApplication.cpp"],
    hdrs = [CURRENT_DIR + "EmscriptenApplication.h"],
    deps = [
        ":Platform",
        "//src/Magnum/GL:GL",
    ],
)
