# Packages::Generic version 1.0.0

License: MIT
Tags: cfdc
Authors: Ben Heilman <bheilman@enova.com>

## Description
Control packages in a generic way

## Dependencies
CFEngine::dclib, CFEngine::stdlib

## API
### bundle: install
* parameter _environment_ *runenv* (default: none, description: none)

* parameter _metadata_ *metadata* (default: none, description: none)

* parameter _string_ *package* (default: none, description: package to install)

* parameter _string_ *version* (default: `null`, description: minimum version of the package required)

* parameter _string_ *release* (default: `null`, description: repository label to install from)

* returns _return_ *packages_verified* (default: none, description: none)


## SAMPLE USAGE
See `test.cf` or the example parameters provided

