local v = require 'semver'

-- two ways of creating it: with separate parameters, or with one string
v1 = v(1,0,0)
v2_5_1 = v('2.5.1')

-- When using one string one can skip the parenthesis:
v2_5_1 = v'2.5.1' -- valid in Lua

-- major, minor and patch attributes
v2_5_1.major -- 2
v2_5_1.minor -- 5
v2_5_1.patch -- 1

-- prereleases:
a = v(1,0,0,'alpha')
a.prerelease -- 'alpha'
b = v('1.0.0-beta')
b.prerelease -- 'beta'

-- builds
c = v(1,0,0,nil,'build-1')
c.build -- 'build-1'

d = v('0.9.5+no.extensions.22')
d.build -- 'no.extensions.22'

-- comparison & sorting
v'1.2.3' == v(1,2,3)         -- true
v'1.2.3' < v(4,5,6)          -- true
v'1.2.3-alpha' < v'1.2.3'    -- true
v'1.2.3' < v'1.2.3+build.1'  -- false, builds are ignored when comparing versions in semver
-- (see the "notes" section for more informaion about version comparison)

-- "pessimistic upgrade" operator: ^
-- a ^ b returns true if it's safe to update from a to b
v'2.0.1' ^ v'2.5.1' -- true - it's safe to upgrade from 2.0.1 to 2.5.1
v'1.0.0' ^ v'2.0.0' -- false - 2.0.0 is not supposed to be backwards-compatible
v'2.5.1' ^ v'2.0.1' -- false - 2.5.1 is more modern than 2.0.1.

-- getting newer versions
v(1,0,0):nextPatch() -- v1.0.1
v(1,2,3):nextMinor() -- v1.3.0 . Notice the patch resets to 0
v(1,2,3):nextMajor() -- v2.0.0 . Minor and patch are reset to 0
