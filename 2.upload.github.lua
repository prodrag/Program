package = "Program"
version = "1.1.0-1"
source = {
   url = "git://github.com/prodrag/Program.git",
}
description = {
   summary = "An implementation of semantic versioning (semver.org) in Lua",
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

