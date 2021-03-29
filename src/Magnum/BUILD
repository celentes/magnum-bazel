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

package(default_visibility = ["//visibility:public"])

CURRENT_DIR = "@magnum_src//:src/Magnum/"

corrade_configure_header(
    name = "version",
    src = CURRENT_DIR + "version.h.cmake",
    output = "version.h",
    defines = {
        # just some sample data i suppose
        "MAGNUM_VERSION_YEAR": "2020",
        "MAGNUM_VERSION_MONTH": "6",
        "MAGNUM_VERSION_COMMIT": " 252",
        "MAGNUM_VERSION_HASH": "b329d056",
        "MAGNUM_VERSION_STRING": "v2020.06-252-ga1038a9b",
    },
    visibility = ["//:__pkg__"]
)

corrade_configure_header(
    name = "configure",
    src = CURRENT_DIR + "configure.h.cmake",
    output = "configure.h",
    defines = select({
      "@corrade//bazel/platforms:linux": {
          "MAGNUM_BUILD_DEPRECATED": "1",
          "MAGNUM_TARGET_GL": "1",
      },
      "@corrade//bazel/platforms:emscripten": {
          "MAGNUM_BUILD_DEPRECATED": "1",
          "MAGNUM_BUILD_STATIC": "1",
          "MAGNUM_TARGET_WEBGL": "1",
          "MAGNUM_TARGET_GLES": "1",
      },
    }),
    # TODO: -s USE_WEBGL2=1
    visibility = ["//:__pkg__"]
)

cc_library(
    name = "headers",
    hdrs = [
        CURRENT_DIR + "AbstractResourceLoader.h",
        CURRENT_DIR + "British.h",
        CURRENT_DIR + "DimensionTraits.h",
        CURRENT_DIR + "FileCallback.h",
        CURRENT_DIR + "Image.h",
        CURRENT_DIR + "ImageView.h",
        CURRENT_DIR + "Magnum.h",
        CURRENT_DIR + "Mesh.h",
        CURRENT_DIR + "PixelFormat.h",
        CURRENT_DIR + "PixelStorage.h",
        CURRENT_DIR + "Resource.h",
        CURRENT_DIR + "ResourceManager.h",
        CURRENT_DIR + "Sampler.h",
        CURRENT_DIR + "Tags.h",
        CURRENT_DIR + "Timeline.h",
        CURRENT_DIR + "Types.h",
        CURRENT_DIR + "VertexFormat.h",
        CURRENT_DIR + "visibility.h",
        ":version",
        ":configure",
        # MAGNUM_BUILD_DEPRECATED
        CURRENT_DIR + "Array.h",
    ],
    deps = ["@magnum//:Main"],
    visibility = ["//src/Magnum:__subpackages__"]
)

MAGNUM_SRCS = [
    CURRENT_DIR + "FileCallback.cpp",
    CURRENT_DIR + "PixelStorage.cpp",
    CURRENT_DIR + "Resource.cpp",
    CURRENT_DIR + "Sampler.cpp",
    CURRENT_DIR + "Timeline.cpp",
    CURRENT_DIR + "Implementation/ImageProperties.h",
    CURRENT_DIR + "Implementation/converterUtilities.h",
    CURRENT_DIR + "Implementation/meshIndexTypeMapping.hpp",
    CURRENT_DIR + "Implementation/meshPrimitiveMapping.hpp",
    CURRENT_DIR + "Implementation/compressedPixelFormatMapping.hpp",
    CURRENT_DIR + "Implementation/pixelFormatMapping.hpp",
    CURRENT_DIR + "Implementation/vertexFormatMapping.hpp",
]

MAGNUM_GRACEFUL_ASSERT_SRCS = [
    CURRENT_DIR + "Image.cpp",
    CURRENT_DIR + "ImageView.cpp",
    CURRENT_DIR + "Mesh.cpp",
    CURRENT_DIR + "PixelFormat.cpp",
    CURRENT_DIR + "VertexFormat.cpp",
    CURRENT_DIR + "Animation/Player.cpp",
    CURRENT_DIR + "Animation/Interpolation.cpp",
]

cc_library(
    name = "Magnum",
    srcs = MAGNUM_SRCS + MAGNUM_GRACEFUL_ASSERT_SRCS,
    deps = [
        ":headers",
        "@corrade//:Utility",
        "//src/Magnum/Math:Math",
        "//src/Magnum/Animation:headers",
    ],
)

cc_library(
    name = "MagnumTestLib",
    srcs = MAGNUM_SRCS + MAGNUM_GRACEFUL_ASSERT_SRCS,
    deps = [
        ":headers",
        "@corrade//:Utility",
        "//src/Magnum/Math:Math",
        "//src/Magnum/Animation:headers",
    ],
    local_defines = [
        "CORRADE_GRACEFUL_ASSERT",
    ],
)
