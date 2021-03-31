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
load("@emsdk//emscripten_toolchain:wasm_rules.bzl", "wasm_cc_binary")
load("@build_bazel_rules_nodejs//:index.bzl", "nodejs_test")

test_suite(
    name = "native",
    tags = ["-emscripten_test"],
)

test_suite(
    name = "emscripten",
    tags = ["emscripten_test"],
)

CURRENT_DIR = "@magnum_src//:src/MagnumPlugins/AnyImageImporter/Test/"

corrade_configure_header(
    name = "configure",
    src = CURRENT_DIR + "configure.h.cmake",
    output = "configure.h",
    defines = {
        "TEST_FILE_DIR": "$(rootpath %s)" % CURRENT_DIR[:-1],
        "TGA_FILE": "$(rootpath %s)" % (CURRENT_DIR + "rgb.tga"),
    },
    deps = [
        CURRENT_DIR[:-1],
        CURRENT_DIR + "rgb.tga",
    ],
    visibility = ["//:__pkg__"],
    local = True,
)

cc_test(
    name = "AnyImageImporterTest",
    srcs = [
        CURRENT_DIR + "AnyImageImporterTest.cpp",
    ],
    deps = [
        "@corrade//:TestSuite",
        "@magnum//:Trade",
        "@magnum//:AnyImageImporterPlugin",
        ":configure",
    ],
    data = [
        CURRENT_DIR + "gray.jpg",
        CURRENT_DIR + "image.exr",
        CURRENT_DIR + "image.tiff",
        CURRENT_DIR + "pngs.ico",
        CURRENT_DIR + "rgb.basis",
        CURRENT_DIR + "rgb.hdr",
        CURRENT_DIR + "rgb.png",
        CURRENT_DIR + "rgb.tga",
        CURRENT_DIR + "rgba_dxt1.dds",
    ],
)
