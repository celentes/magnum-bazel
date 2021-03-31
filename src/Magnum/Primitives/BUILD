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

CURRENT_DIR = "@magnum_src//:src/Magnum/Primitives/"

cc_library(
    name = "headers",
    hdrs = [
        CURRENT_DIR + "Axis.h",
        CURRENT_DIR + "Capsule.h",
        CURRENT_DIR + "Circle.h",
        CURRENT_DIR + "Crosshair.h",
        CURRENT_DIR + "Cone.h",
        CURRENT_DIR + "Cube.h",
        CURRENT_DIR + "Cylinder.h",
        CURRENT_DIR + "Gradient.h",
        CURRENT_DIR + "Grid.h",
        CURRENT_DIR + "Icosphere.h",
        CURRENT_DIR + "Line.h",
        CURRENT_DIR + "Plane.h",
        CURRENT_DIR + "Square.h",
        CURRENT_DIR + "UVSphere.h",
        CURRENT_DIR + "visibility.h",
    ],
    deps = [
        "//src/Magnum:headers",
    ],
    visibility = ["@magnum//:__subpackages__"],
)

PRIMITIVES_SRC = [
    CURRENT_DIR + "Axis.cpp",
    CURRENT_DIR + "Capsule.cpp",
    CURRENT_DIR + "Circle.cpp",
    CURRENT_DIR + "Crosshair.cpp",
    CURRENT_DIR + "Cone.cpp",
    CURRENT_DIR + "Cube.cpp",
    CURRENT_DIR + "Cylinder.cpp",
    CURRENT_DIR + "Gradient.cpp",
    CURRENT_DIR + "Grid.cpp",
    CURRENT_DIR + "Icosphere.cpp",
    CURRENT_DIR + "Line.cpp",
    CURRENT_DIR + "Plane.cpp",
    CURRENT_DIR + "Square.cpp",
    CURRENT_DIR + "UVSphere.cpp",
    CURRENT_DIR + "Implementation/Spheroid.cpp",
    CURRENT_DIR + "Implementation/WireframeSpheroid.cpp",
    CURRENT_DIR + "Implementation/Spheroid.h",
    CURRENT_DIR + "Implementation/WireframeSpheroid.h",
]

cc_library(
    name = "Primitives",
    srcs = PRIMITIVES_SRC,
    deps = [
        ":headers",
        "//src/Magnum:Magnum",
        "//src/Magnum/Trade:Trade",
        "//src/Magnum/MeshTools:MeshTools",
    ],
)
