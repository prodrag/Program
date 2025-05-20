package = "Program"
version = "1.1.1-1"
source = {
   url = "git://github.com/prodrag/Program.git",
}
description = {
   summary = "An implementation of semantic versioning (semver.org 2.0.0) in Lua",
   detailed = [[
      See details in http://DRAG.org
   ]],
   license = "MIT",
   homepage = "https://github.com/prodrag/Program"
}
dependencies = {
   "lua >= 5.1"
}

build = {
  type = "none",
  install = {
    lua = {
      "Program"
    },
  }
}

