language: erlang

env:
  global:
    - LUAROCKS_BASE=luarocks-2.0.9
  matrix:
    - LUA=lua5.1 LUA_DEV=liblua5.1-dev LUA_VER=5.1 LUA_SFX=5.1 LUA_INCDIR=/usr/include/lua5.1
    - LUA=lua5.2 LUA_DEV=liblua5.2-dev LUA_VER=5.2 LUA_SFX=5.2 LUA_INCDIR=/usr/include/lua5.2
    - LUA=luajit LUA_DEV=libluajit-5.1-dev LUA_VER=5.1 LUA_SFX=jit LUA_INCDIR=/usr/include/luajit-2.0

before_install:
  - if [ $LUA = "luajit" ]; then
      sudo add-apt-repository ppa:mwild1/ppa -y && sudo apt-get update -y;
    fi
  - sudo apt-get install $LUA
  - sudo apt-get install $LUA_DEV
  - lua$LUA_SFX -v
  # Install a recent luarocks release
  - wget http://luarocks.org/releases/$LUAROCKS_BASE.tar.gz
  - tar zxvpf $LUAROCKS_BASE.tar.gz
  - cd $LUAROCKS_BASE
  - ./configure
    --lua-version=$LUA_VER --lua-suffix=$LUA_SFX --with-lua-include="$LUA_INCDIR"
  - sudo make
  - sudo make install
  - cd $TRAVIS_BUILD_DIR

install:
  - sudo -E luarocks install busted

script:
  - sudo -E busted -v

notifications:
  email:
    on_success: change
    on_failure: always