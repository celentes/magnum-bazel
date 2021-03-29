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

CURRENT_DIR = "@magnum_src//:src/Magnum/Math/"

MATH_SRCS = [
    CURRENT_DIR + "Angle.cpp",
    CURRENT_DIR + "Color.cpp",
    CURRENT_DIR + "Half.cpp",
    CURRENT_DIR + "Packing.cpp",
    CURRENT_DIR + "instantiation.cpp",
]

MATH_GRACEFUL_ASSERT_SRCS = [
    CURRENT_DIR + "Functions.cpp",
    CURRENT_DIR + "PackingBatch.cpp",
]

cc_library(
    name = "headers",
    hdrs = [
        CURRENT_DIR + "Angle.h",
        CURRENT_DIR + "Bezier.h",
        CURRENT_DIR + "BoolVector.h",
        CURRENT_DIR + "Color.h",
        CURRENT_DIR + "Complex.h",
        CURRENT_DIR + "Constants.h",
        CURRENT_DIR + "ConfigurationValue.h",
        CURRENT_DIR + "CubicHermite.h",
        CURRENT_DIR + "Distance.h",
        CURRENT_DIR + "Dual.h",
        CURRENT_DIR + "DualComplex.h",
        CURRENT_DIR + "DualQuaternion.h",
        CURRENT_DIR + "Frustum.h",
        CURRENT_DIR + "Functions.h",
        CURRENT_DIR + "FunctionsBatch.h",
        CURRENT_DIR + "Half.h",
        CURRENT_DIR + "Intersection.h",
        CURRENT_DIR + "Math.h",
        CURRENT_DIR + "TypeTraits.h",
        CURRENT_DIR + "Matrix.h",
        CURRENT_DIR + "Matrix3.h",
        CURRENT_DIR + "Matrix4.h",
        CURRENT_DIR + "Quaternion.h",
        CURRENT_DIR + "Packing.h",
        CURRENT_DIR + "PackingBatch.h",
        CURRENT_DIR + "Range.h",
        CURRENT_DIR + "RectangularMatrix.h",
        CURRENT_DIR + "StrictWeakOrdering.h",
        CURRENT_DIR + "Swizzle.h",
        CURRENT_DIR + "Tags.h",
        CURRENT_DIR + "Unit.h",
        CURRENT_DIR + "Vector.h",
        CURRENT_DIR + "Vector2.h",
        CURRENT_DIR + "Vector3.h",
        CURRENT_DIR + "Vector4.h",
        CURRENT_DIR + "Implementation/halfTables.hpp",
    ],
    deps = [
        "//src/Magnum:headers",
        "//src/Magnum/Math/Algorithms:headers",
    ],
    visibility = ["//src/Magnum:__subpackages__"],
)

cc_library(
    name = "Math",
    srcs = MATH_SRCS + MATH_GRACEFUL_ASSERT_SRCS,
    deps = [
        ":headers",
        "@corrade//:Utility",
        "@magnum//:Main",
    ],
)

cc_library(
    name = "MathTestLib",
    srcs = MATH_SRCS + MATH_GRACEFUL_ASSERT_SRCS,
    deps = [
        ":headers",
        "@corrade//:Utility",
        "@magnum//:Main",
    ],
    local_defines = [
        "CORRADE_GRACEFUL_ASSERT",
        "Magnum_EXPORTS",
    ],
    testonly = True,
    visibility = ["//src/Magnum:__subpackages__"]
)
