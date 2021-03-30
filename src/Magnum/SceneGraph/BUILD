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

CURRENT_DIR = "@magnum_src//:src/Magnum/SceneGraph/"

cc_library(
    name = "headers",
    hdrs = [
        CURRENT_DIR + "AbstractFeature.h",
        CURRENT_DIR + "AbstractFeature.hpp",
        CURRENT_DIR + "AbstractGroupedFeature.h",
        CURRENT_DIR + "AbstractObject.h",
        CURRENT_DIR + "AbstractTransformation.h",
        CURRENT_DIR + "AbstractTranslation.h",
        CURRENT_DIR + "AbstractTranslationRotation2D.h",
        CURRENT_DIR + "AbstractTranslationRotation3D.h",
        CURRENT_DIR + "AbstractTranslationRotationScaling2D.h",
        CURRENT_DIR + "AbstractTranslationRotationScaling3D.h",
        CURRENT_DIR + "Animable.h",
        CURRENT_DIR + "Animable.hpp",
        CURRENT_DIR + "AnimableGroup.h",
        CURRENT_DIR + "Camera.h",
        CURRENT_DIR + "Camera.hpp",
        CURRENT_DIR + "Drawable.h",
        CURRENT_DIR + "Drawable.hpp",
        CURRENT_DIR + "DualComplexTransformation.h",
        CURRENT_DIR + "DualQuaternionTransformation.h",
        CURRENT_DIR + "RigidMatrixTransformation2D.h",
        CURRENT_DIR + "RigidMatrixTransformation2D.hpp",
        CURRENT_DIR + "RigidMatrixTransformation3D.h",
        CURRENT_DIR + "RigidMatrixTransformation3D.hpp",
        CURRENT_DIR + "FeatureGroup.h",
        CURRENT_DIR + "FeatureGroup.hpp",
        CURRENT_DIR + "MatrixTransformation2D.h",
        CURRENT_DIR + "MatrixTransformation2D.hpp",
        CURRENT_DIR + "MatrixTransformation3D.h",
        CURRENT_DIR + "MatrixTransformation3D.hpp",
        CURRENT_DIR + "Object.h",
        CURRENT_DIR + "Object.hpp",
        CURRENT_DIR + "Scene.h",
        CURRENT_DIR + "SceneGraph.h",
        CURRENT_DIR + "TranslationTransformation.h",
        CURRENT_DIR + "TranslationRotationScalingTransformation2D.h",
        CURRENT_DIR + "TranslationRotationScalingTransformation3D.h",
        CURRENT_DIR + "visibility.h",
    ],
    deps = [
        "//src/Magnum:headers",
    ],
    visibility = ["//src/Magnum:__subpackages__"],
)

SCENEGRAPH_SRCS = [
    CURRENT_DIR + "Animable.cpp",
]

SCENEGRAPH_GRACEFUL_ASSERT_SRCS = [
    CURRENT_DIR + "instantiation.cpp",
]

cc_library(
    name = "SceneGraph",
    srcs = SCENEGRAPH_SRCS + SCENEGRAPH_GRACEFUL_ASSERT_SRCS,
    deps = [
        ":headers",
        "//src/Magnum:Magnum",
    ],
)

cc_library(
    name = "SceneGraphTestLib",
    srcs = SCENEGRAPH_SRCS + SCENEGRAPH_GRACEFUL_ASSERT_SRCS,
    deps = [
        ":headers",
        "//src/Magnum:Magnum",
        "//src/Magnum/Math:MathTestLib",
    ],
    local_defines = ["CORRADE_GRACEFUL_ASSERT"],
    testonly = True,
)
