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

CURRENT_DIR = "@magnum_src//:src/Magnum/MeshTools/"

cc_library(
    name = "headers",
    hdrs = [
        CURRENT_DIR + "Combine.h",
        CURRENT_DIR + "CompressIndices.h",
        CURRENT_DIR + "Concatenate.h",
        CURRENT_DIR + "Duplicate.h",
        CURRENT_DIR + "FlipNormals.h",
        CURRENT_DIR + "GenerateIndices.h",
        CURRENT_DIR + "GenerateNormals.h",
        CURRENT_DIR + "Interleave.h",
        CURRENT_DIR + "Reference.h",
        CURRENT_DIR + "RemoveDuplicates.h",
        CURRENT_DIR + "Subdivide.h",
        CURRENT_DIR + "Tipsify.h",
        CURRENT_DIR + "Transform.h",
        CURRENT_DIR + "visibility.h",
        # GL specific
        CURRENT_DIR + "Compile.h",
        CURRENT_DIR + "FullScreenTriangle.h",
        # deprecated
        CURRENT_DIR + "CombineIndexedArrays.h",
        CURRENT_DIR + "GenerateFlatNormals.h",
    ],
    deps = [
        "//src/Magnum:headers",
    ],
    visibility = ["@magnum//:__subpackages__"],
)

MESHTOOLS_SRCS = [
    CURRENT_DIR + "Tipsify.cpp",
    CURRENT_DIR + "Implementation/Tipsify.h",
    # GL specific
    CURRENT_DIR + "FullScreenTriangle.cpp",
]

MESHTOOLS_GRACEFUL_ASSERT_SRCS = [
    CURRENT_DIR + "Combine.cpp",
    CURRENT_DIR + "CompressIndices.cpp",
    CURRENT_DIR + "Concatenate.cpp",
    CURRENT_DIR + "Duplicate.cpp",
    CURRENT_DIR + "FlipNormals.cpp",
    CURRENT_DIR + "GenerateIndices.cpp",
    CURRENT_DIR + "GenerateNormals.cpp",
    CURRENT_DIR + "Interleave.cpp",
    CURRENT_DIR + "Reference.cpp",
    CURRENT_DIR + "RemoveDuplicates.cpp",
    # GL specific
    CURRENT_DIR + "Compile.cpp",
    # deprecated
    CURRENT_DIR + "CombineIndexedArrays.cpp",
]

cc_library(
    name = "MeshTools",
    srcs = MESHTOOLS_SRCS + MESHTOOLS_GRACEFUL_ASSERT_SRCS,
    deps = [
        ":headers",
        "//src/Magnum:Magnum",
        "//src/Magnum/Trade:Trade",
        "//src/Magnum/Shaders:headers",
        # GL specific
        "//src/Magnum/GL:GL",
    ],
)

cc_library(
    name = "MeshToolsTestLib",
    srcs = MESHTOOLS_SRCS + MESHTOOLS_GRACEFUL_ASSERT_SRCS,
    deps = [
        ":headers",
        "//src/Magnum:Magnum",
        "//src/Magnum/Trade:Trade",
        "//src/Magnum/Shaders:headers",
        # GL specific
        "//src/Magnum/GL:GL",
    ],
    local_defines = ["CORRADE_GRACEFUL_ASSERT"],
    testonly = True,
    visibility = ["//src/Magnum:__subpackages__"],
)
