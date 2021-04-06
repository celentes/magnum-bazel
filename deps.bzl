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
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def deps():
    excludes = native.existing_rules().keys()

    if "corrade" not in excludes:
        http_archive(
            name = "corrade",
            strip_prefix = "corrade-bazel-566b1cd4da39d2da0feff803c8a81986e8038c0c",
            sha256 = "0d390faa3fd907132b80a66ae829dd81fd13b7e193211eed722ba76b74b77140",
            url = "https://github.com/celentes/corrade-bazel/archive/566b1cd4da39d2da0feff803c8a81986e8038c0c.tar.gz",
        )

    if "magnum_src" not in excludes:
        http_archive(
            name = "magnum_src",
            sha256 = "9f44fbd412f29c922a5d7965c5151134b6460a723e2042b7a99ca92d10debab7",
            strip_prefix = "magnum-7154200e16472e6f663e222cffc60533693e8180",
            url = "https://github.com/mosra/magnum/archive/7154200e16472e6f663e222cffc60533693e8180.tar.gz",
            build_file = "@magnum//:BUILD.magnum",
        )

    if "glfw" not in excludes:
        http_archive(
            name="glfw",
            url="https://github.com/glfw/glfw/archive/8d7e5cdb49a1a5247df612157ecffdd8e68923d2.tar.gz",
            strip_prefix="glfw-8d7e5cdb49a1a5247df612157ecffdd8e68923d2",
            sha256="66340d8f015381a368ed34e5eb20c3de2cdd916461fa43d2703d624baa48dde8",
            build_file = "@magnum//:BUILD.glfw",
        )
