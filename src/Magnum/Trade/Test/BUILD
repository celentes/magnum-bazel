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

CURRENT_DIR = "@magnum_src//:src/Magnum/Trade/Test/"

corrade_configure_header(
    name = "configure",
    src = CURRENT_DIR + "configure.h.cmake",
    output = "configure.h",
    defines = {
        "TRADE_TEST_DIR": "$(rootpath %s)" % CURRENT_DIR[:-1],
        "TRADE_TEST_OUTPUT_DIR": "$(rootpath %s)/write" % CURRENT_DIR[:-1],
    },
    deps = [CURRENT_DIR[:-1]],
    visibility = ["//:__pkg__"]
)

[cc_test(
    name = "%s" % t,
    srcs = [CURRENT_DIR + "%s.cpp" % t],
    deps = [
        "@corrade//:TestSuite",
        "//src/Magnum/Trade:Trade",
    ],
)
for t in [
    "DataTest",
    "SceneDataTest",
    "TextureDataTest",
]]

[cc_test(
    name = "%s" % t,
    srcs = [
        CURRENT_DIR + "%s.cpp" % t,
        ":configure",
    ],
    includes = ["."],
    deps = [
        "@corrade//:TestSuite",
        "//src/Magnum/Trade:TradeTestLib",
    ],
)
for t in [
    "AbstractImageConverterTest",
    "AbstractSceneConverterTest",
]]

[cc_test(
    name = "%s" % t,
    srcs = [
        CURRENT_DIR + "%s.cpp" % t,
        ":configure",
    ],
    includes = ["."],
    data = [
        CURRENT_DIR + "file.bin",
    ],
    deps = [
        "@corrade//:TestSuite",
        "//src/Magnum/Trade:TradeTestLib",
    ],
)
for t in [
    "AbstractImporterTest",
]]

[cc_test(
    name = "%s" % t,
    srcs = [CURRENT_DIR + "%s.cpp" % t],
    deps = [
        "@corrade//:TestSuite",
        "//src/Magnum/Trade:TradeTestLib",
    ],
)
for t in [
    "CameraDataTest",
    "FlatMaterialDataTest",
    "ImageDataTest",
    "LightDataTest",
    "ObjectData2DTest",
    "ObjectData3DTest",
    "PbrClearCoatMaterialDataTest",
    "PbrMetallicRoughnessMaterialDataTest",
    "PbrSpecularGlossinessMaterialDataTest",
    "PhongMaterialDataTest",
    "SkinDataTest",
]]

[cc_test(
    name = "%s" % t,
    srcs = [CURRENT_DIR + "%s.cpp" % t],
    deps = [
        "@corrade//:TestSuite",
        "//src/Magnum/Trade:TradeTestLib",
    ],
    defines = ["CORRADE_GRACEFUL_ASSERT"],
)
for t in [
    "AnimationDataTest",
    "MaterialDataTest",
    "MeshDataTest",
]]

[[wasm_cc_binary(
    name = "%s_wasm" % t,
    cc_target = ":%s" % t,
    testonly = True,
  ),
  nodejs_test(
    name = "Emscripten_%s" % t,
    data = [":%s_wasm" % t],
    entry_point = ":%s_wasm/%s.js" % (t, t),
    tags = ["emscripten_test"],
  )]
for t in [
    "CameraDataTest",
    "FlatMaterialDataTest",
    "ImageDataTest",
    "LightDataTest",
    "ObjectData2DTest",
    "ObjectData3DTest",
    "PbrClearCoatMaterialDataTest",
    "PbrMetallicRoughnessMaterialDataTest",
    "PbrSpecularGlossinessMaterialDataTest",
    "PhongMaterialDataTest",
    "SkinDataTest",
    "AnimationDataTest",
    "MaterialDataTest",
    "MeshDataTest",
    "AbstractImageConverterTest",
    "AbstractSceneConverterTest",
    #"AbstractImporterTest", TODO: get it in after embeds are fixed
    "DataTest",
    "SceneDataTest",
    "TextureDataTest",
]]
