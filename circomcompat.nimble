# Package

version       = "0.1.0"
author        = "Dmitriy Ryajov"
description   = "Nim wrapper for rust circom compat (ark-circom)"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.2.18"

import std/os

task genffi, "update the nim ffi bindings":
  exec "cargo install --git https://github.com/arnetheduck/nbindgen#e80a85f1505d78eeae78ce33b6f406603be27d35 nbindgen"
  exec "nbindgen -c ./cbindgen.toml vendor/circom-compat-ffi --output circomcompatffi.nim"

task tests, "run unit tests":
  exec "nim c -r tests/testcircomcompat.nim"
