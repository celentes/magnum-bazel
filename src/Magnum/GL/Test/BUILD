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
load("@corrade//:index.bzl", "corrade_configure_header")

test_suite(
    name = "native",
    tags = ["-emscripten_test"],
)

test_suite(
    name = "emscripten",
    tags = ["emscripten_test"],
)

CURRENT_DIR = "@magnum_src//:src/Magnum/GL/Test/"

#corrade_configure_header(
#    name = "configure",
#    src = CURRENT_DIR + "configure.h.cmake",
#    output = "configure.h",
#    defines = select({
#        "@corrade//bazel/platforms:linux": {
#            "MAGNUM_BUILD_DEPRECATED": "1",
#            "MAGNUM_TARGET_GL": "1",
#        },
#        "@corrade//bazel/platforms:emscripten": {
#            "MAGNUM_BUILD_DEPRECATED": "1",
#            "MAGNUM_BUILD_STATIC": "1",
#            "MAGNUM_TARGET_GL": "1",
#            "MAGNUM_TARGET_GLES": "1",
#            "MAGNUM_TARGET_GLES3": "1",
#            "MAGNUM_TARGET_WEBGL": "1",
#        },
#    }),
#    visibility = ["//:__pkg__"]
#)
# TODO: native tests
# TODO: BUILD_GL_TESTS

[cc_test(
    name = "%s" % t,
    srcs = [CURRENT_DIR + "%s.cpp" % t],
    deps = [
        "@corrade//:TestSuite",
        "//src/Magnum/GL:GLTestLib",
    ],
)
for t in [
    "AttributeTest",
    "PixelFormatTest",
    "SamplerTest",
    "MeshTest",
]]

[cc_test(
    name = "%s" % t,
    srcs = [CURRENT_DIR + "%s.cpp" % t],
    deps = [
        "@corrade//:TestSuite",
        "//src/Magnum/GL:GL",
    ],
)
for t in [
    "AbstractShaderProgramTest",
    "BufferTest",
    "ContextTest",
    "CubeMapTextureTest",
    "DefaultFramebufferTest",
    "FramebufferTest",
    "RendererTest",
    "RenderbufferTest",
    "ShaderTest",
    "TextureTest",
    "TimeQueryTest",
    "VersionTest",
    "BufferImageTest",
    "PrimitiveQueryTest",
    "TextureArrayTest",
    "TransformFeedbackTest",
    "SampleQueryTest",
    # non webgl
    "BufferTextureTest",
    "CubeMapTextureArrayTest",
    "MultisampleTextureTest",
    "PipelineStatisticsQueryTest",
    "RectangleTextureTest",
]]

# TODO: these for emscripten
# these run successfully when used with bazel run, but fail on bazel test
# TODO: INVESTIGATE WHY

#[cc_test(
#    name = "%s" % t,
#    srcs = [CURRENT_DIR + "%s.cpp" % t],
#    deps = [
#        "@corrade//:TestSuite",
#        "//src/Magnum/GL:OpenGLTester",
#    ],
#)
#for t in [
#    "BufferGLTest",
#    "RenderbufferGLTest",
#    "TimeQueryGLTest",
#]]
#
#[cc_test(
#    name = "%s" % t,
#    srcs = [CURRENT_DIR + "%s.cpp" % t],
#    deps = [
#        "@corrade//:TestSuite",
#        "//src/Magnum/GL:OpenGLTesterTestLib",
#    ],
#)
#for t in [
#    "AbstractTextureGLTest",
#    "CubeMapTextureGLTest",
#    "FramebufferGLTest",
#    "MeshGLTest",
#    "TextureGLTest",
#]]

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
    "AttributeTest",
    "PixelFormatTest",
    "SamplerTest",
    "MeshTest",
    "AbstractShaderProgramTest",
    "BufferTest",
    "ContextTest",
    "CubeMapTextureTest",
    "DefaultFramebufferTest",
    "FramebufferTest",
    "RendererTest",
    "RenderbufferTest",
    "ShaderTest",
    "TextureTest",
    "TimeQueryTest",
    "VersionTest",
    "BufferImageTest",
    "PrimitiveQueryTest",
    "TextureArrayTest",
    "TransformFeedbackTest",
    "SampleQueryTest",
]]
