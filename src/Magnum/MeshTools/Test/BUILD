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

CURRENT_DIR = "@magnum_src//:src/Magnum/MeshTools/Test/"

# TODO: BUILD_GL_TESTS

cc_library(
    name = "mt",
    deps = [
        "//src/Magnum/MeshTools:MeshTools",
    ],
    testonly = True,
)

cc_library(
    name = "mttest",
    deps = [
        "//src/Magnum/MeshTools:MeshToolsTestLib",
    ],
    testonly = True,
)

cc_library(
    name = "mttest_graceful",
    deps = [
        "//src/Magnum/MeshTools:MeshToolsTestLib",
    ],
    defines = ["CORRADE_GRACEFUL_ASSERT"],
    testonly = True,
)

cc_library(
    name = "mttest_primitives",
    deps = [
        "//src/Magnum/MeshTools:MeshToolsTestLib",
        "//src/Magnum/Primitives:Primitives",
    ],
    testonly = True,
)

cc_library(
    name = "mttest_primitives_graceful",
    deps = [
        "//src/Magnum/MeshTools:MeshToolsTestLib",
        "//src/Magnum/Primitives:Primitives",
    ],
    defines = ["CORRADE_GRACEFUL_ASSERT"],
    testonly = True,
)

[cc_test(
    name = "%s" % t,
    srcs = [CURRENT_DIR + "%s.cpp" % t],
    deps = [
        "@corrade//:TestSuite",
        ":%s" % l
    ],
)
for (t, l) in [
    ["TipsifyTest", "mt"],
    ["TransformTest", "mt"],
    ["CombineTest", "mttest"],
    ["CompressIndicesTest", "mttest"],
    ["FlipNormalsTest", "mttest"],
    ["GenerateIndicesTest", "mttest"],
    ["ConcatenateTest", "mttest_graceful"],
    ["DuplicateTest", "mttest_graceful"],
    ["RemoveDuplicatesTest", "mttest_graceful"],
    ["InterleaveTest", "mttest_graceful"],
    # deprecated
    ["CombineIndexedArraysTest", "mttest_graceful"],
    ["GenerateNormalsTest", "mttest_primitives"],
    ["ReferenceTest", "mttest_primitives"],
    ["SubdivideTest", "mttest_primitives_graceful"],
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
    "CombineTest",
    "CompressIndicesTest",
    "FlipNormalsTest",
    "GenerateIndicesTest",
    "ConcatenateTest",
    "DuplicateTest",
    "RemoveDuplicatesTest",
    "InterleaveTest",
    "CombineIndexedArraysTest",
    "GenerateNormalsTest",
    "ReferenceTest",
    "SubdivideTest",
    "TipsifyTest",
    "TransformTest",
]]
