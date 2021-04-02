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

CURRENT_DIR = "@magnum_src//:src/Magnum/GL/"

cc_library(
    name = "headers",
    hdrs = [
        CURRENT_DIR + "AbstractFramebuffer.h",
        CURRENT_DIR + "AbstractObject.h",
        CURRENT_DIR + "AbstractQuery.h",
        CURRENT_DIR + "AbstractShaderProgram.h",
        CURRENT_DIR + "AbstractTexture.h",
        CURRENT_DIR + "Attribute.h",
        CURRENT_DIR + "Buffer.h",
        CURRENT_DIR + "Context.h",
        CURRENT_DIR + "CubeMapTexture.h",
        CURRENT_DIR + "DefaultFramebuffer.h",
        CURRENT_DIR + "Extensions.h",
        CURRENT_DIR + "Framebuffer.h",
        CURRENT_DIR + "GL.h",
        CURRENT_DIR + "Mesh.h",
        CURRENT_DIR + "MeshView.h",
        CURRENT_DIR + "OpenGL.h",
        CURRENT_DIR + "PixelFormat.h",
        CURRENT_DIR + "Renderbuffer.h",
        CURRENT_DIR + "RenderbufferFormat.h",
        CURRENT_DIR + "Renderer.h",
        CURRENT_DIR + "Sampler.h",
        CURRENT_DIR + "Shader.h",
        CURRENT_DIR + "Texture.h",
        CURRENT_DIR + "TextureFormat.h",
        CURRENT_DIR + "TimeQuery.h",
        CURRENT_DIR + "Version.h",
        CURRENT_DIR + "visibility.h",
    ] + select({
        # NOTE: assumption is desktop GL, revisit if not
        "@corrade//bazel/platforms:linux": [
            CURRENT_DIR + "PipelineStatisticsQuery.h",
            CURRENT_DIR + "RectangleTexture.h",
            CURRENT_DIR + "DebugOutput.h",
            CURRENT_DIR + "BufferTexture.h",
            CURRENT_DIR + "BufferTextureFormat.h",
            CURRENT_DIR + "CubeMapTextureArray.h",
            CURRENT_DIR + "ImageFormat.h",
            CURRENT_DIR + "MultisampleTexture.h",
            CURRENT_DIR + "BufferImage.h",
            CURRENT_DIR + "PrimitiveQuery.h",
            CURRENT_DIR + "TextureArray.h",
            CURRENT_DIR + "TransformFeedback.h",
            CURRENT_DIR + "SampleQuery.h",
        ],
        # NOTE: assumption is WebGL2, revisit if not
        "@corrade//bazel/platforms:emscripten": [
            CURRENT_DIR + "BufferImage.h",
            CURRENT_DIR + "PrimitiveQuery.h",
            CURRENT_DIR + "TextureArray.h",
            CURRENT_DIR + "TransformFeedback.h",
            CURRENT_DIR + "SampleQuery.h",
        ],
    }),
    deps = [
        "//src/Magnum:headers",
    ],
    visibility = ["@magnum//:__subpackages__"],
)

GL_SRCS = [
    CURRENT_DIR + "AbstractObject.cpp",
    CURRENT_DIR + "AbstractQuery.cpp",
    CURRENT_DIR + "Buffer.cpp",
    CURRENT_DIR + "Context.cpp",
    CURRENT_DIR + "DefaultFramebuffer.cpp",
    CURRENT_DIR + "Framebuffer.cpp",
    CURRENT_DIR + "OpenGL.cpp",
    CURRENT_DIR + "Renderbuffer.cpp",
    CURRENT_DIR + "Renderer.cpp",
    CURRENT_DIR + "Shader.cpp",
    CURRENT_DIR + "Texture.cpp",
    CURRENT_DIR + "TextureFormat.cpp",
    CURRENT_DIR + "Version.cpp",
    CURRENT_DIR + "Implementation/BufferState.cpp",
    CURRENT_DIR + "Implementation/ContextState.cpp",
    CURRENT_DIR + "Implementation/FramebufferState.cpp",
    CURRENT_DIR + "Implementation/MeshState.cpp",
    CURRENT_DIR + "Implementation/QueryState.cpp",
    CURRENT_DIR + "Implementation/RendererState.cpp",
    CURRENT_DIR + "Implementation/ShaderProgramState.cpp",
    CURRENT_DIR + "Implementation/ShaderState.cpp",
    CURRENT_DIR + "Implementation/State.cpp",
    CURRENT_DIR + "Implementation/TextureState.cpp",
    CURRENT_DIR + "Implementation/driverSpecific.cpp",
    CURRENT_DIR + "Implementation/maxTextureSize.cpp",
    CURRENT_DIR + "Implementation/BufferState.h",
    CURRENT_DIR + "Implementation/ContextState.h",
    CURRENT_DIR + "Implementation/FramebufferState.h",
    CURRENT_DIR + "Implementation/maxTextureSize.h",
    CURRENT_DIR + "Implementation/MeshState.h",
    CURRENT_DIR + "Implementation/QueryState.h",
    CURRENT_DIR + "Implementation/RendererState.h",
    CURRENT_DIR + "Implementation/ShaderProgramState.h",
    CURRENT_DIR + "Implementation/ShaderState.h",
    CURRENT_DIR + "Implementation/State.h",
    CURRENT_DIR + "Implementation/TextureState.h",
    CURRENT_DIR + "Implementation/pixelFormatMapping.hpp",
    CURRENT_DIR + "Implementation/compressedPixelFormatMapping.hpp",
]

GL_GRACEFUL_ASSERT_SRCS = [
    CURRENT_DIR + "AbstractFramebuffer.cpp",
    CURRENT_DIR + "AbstractShaderProgram.cpp",
    CURRENT_DIR + "AbstractTexture.cpp",
    CURRENT_DIR + "Attribute.cpp",
    CURRENT_DIR + "CubeMapTexture.cpp",
    CURRENT_DIR + "Mesh.cpp",
    CURRENT_DIR + "MeshView.cpp",
    CURRENT_DIR + "PixelFormat.cpp",
    CURRENT_DIR + "Sampler.cpp",
]

GL_DESKTOP_SRCS = [
    CURRENT_DIR + "RectangleTexture.cpp",
    CURRENT_DIR + "DebugOutput.cpp",
    CURRENT_DIR + "Implementation/DebugState.cpp",
    CURRENT_DIR + "Implementation/DebugState.h",
    CURRENT_DIR + "BufferTexture.cpp",
    CURRENT_DIR + "CubeMapTextureArray.cpp",
    CURRENT_DIR + "MultisampleTexture.cpp",
]

GL_WEBGL2_SRCS = [
    CURRENT_DIR + "PrimitiveQuery.cpp",
    CURRENT_DIR + "TextureArray.cpp",
    CURRENT_DIR + "TransformFeedback.cpp",
    CURRENT_DIR + "Implementation/TransformFeedbackState.cpp",
    CURRENT_DIR + "Implementation/TransformFeedbackState.h",
]

GL_WEBGL2_GRACEFUL_ASSERT_SRCS = [
    CURRENT_DIR + "BufferImage.cpp",
]

cc_library(
    name = "GL",
    srcs = select({
        "@corrade//bazel/platforms:linux": \
            GL_SRCS + \
            GL_GRACEFUL_ASSERT_SRCS + \
            GL_DESKTOP_SRCS + \
            GL_WEBGL2_SRCS + \
            GL_WEBGL2_GRACEFUL_ASSERT_SRCS,
        "@corrade//bazel/platforms:emscripten":
            GL_SRCS + \
            GL_GRACEFUL_ASSERT_SRCS + \
            GL_WEBGL2_SRCS + \
            GL_WEBGL2_GRACEFUL_ASSERT_SRCS,
    }),
    linkopts = select({
        "@corrade//bazel/platforms:linux": ["-lGL"],
        "@corrade//bazel/platforms:emscripten": ["-s", "USE_WEBGL2=1"],
    }),
    deps = [
        ":headers",
        "//src/Magnum:Magnum",
        "//src/MagnumExternal/OpenGL:FlextGL",
    ],
)

cc_library(
    name = "GLTestLib",
    srcs = select({
        "@corrade//bazel/platforms:linux": \
            GL_SRCS + \
            GL_GRACEFUL_ASSERT_SRCS + \
            GL_DESKTOP_SRCS + \
            GL_WEBGL2_SRCS + \
            GL_WEBGL2_GRACEFUL_ASSERT_SRCS,
        "@corrade//bazel/platforms:emscripten":
            GL_SRCS + \
            GL_GRACEFUL_ASSERT_SRCS + \
            GL_WEBGL2_SRCS + \
            GL_WEBGL2_GRACEFUL_ASSERT_SRCS,
    }),
    linkopts = select({
        "@corrade//bazel/platforms:linux": ["-lGL"],
        "@corrade//bazel/platforms:emscripten": ["-s", "USE_WEBGL2=1"],
    }),
    deps = [
        ":headers",
        "//src/Magnum:Magnum",
        "//src/MagnumExternal/OpenGL:FlextGL",
    ],
    local_defines = ["CORRADE_GRACEFUL_ASSERT"],
    testonly = True,
)
