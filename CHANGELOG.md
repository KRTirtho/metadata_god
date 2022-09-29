# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### 0.3.1 (2022-09-29)

### Bug Fixes
* macos binary not working for universal applications
* flutter windows unneeded librust.lib file remove ([e9fc90c](https://github.com/KRTirtho/metadata_god/commit/e9fc90cb8b0245f6537e1a49cd63105f8db068a0))

### 0.3.0 (2022-09-27)

### Features
* iOS support

### Fixes
* macOS unable to load shared dynamic library
## 0.2.0 (2022-09-01)

### Breaking

* `getMetadata` and `writeMetadata` now takes a path string instead of a `File` because of web compatibility.

### Fixes

* macos library not getting added due to glob path for `vendored_libraries`
* web can't be build because of FFI exception

## 0.1.1 (2022-09-13)
### Features

* macos support via  podspec ([073660c](https://github.com/KRTirtho/metadata_god/commit/073660cbe2485d92819cbd7b5cce6259b9bb556a))
* add macos support ([e8cc330](https://github.com/KRTirtho/metadata_god/commit/e8cc330d9468b9dee56d84d3c03c61f9386f3aee))


## 0.1.0 (2022-09-13)
### Features

* support for basic read/write audio tags via `getMetadata` and `writeMetadata`
