## 0.5.0+2

 - **FIX**: add branch main because to Cargo.toml because it won't use that by default for some godforsaken reason.

## 0.5.0+1

 - **FIX**: I found out how melos works (hopefully).

## 0.4.1+1

 - **FIX**: rename Image to Picture to resolve name conflict with material Image.
 - **FIX**: export Image type.
 - **FIX**: hide internal api getter.
 - **FIX**: build file release tag version.

## 0.4.1

 - **FIX**: rename `Image` to `Picture` to resolve name conflict with material Image.
 - **FIX**: export `Picture` type.
 - **FIX**: hide internal `api` getter.

### [0.4.0](https://github.com/KRTirtho/metadata_god/compare/v0.3.1...v0.4.0) (2023-01-05)

* use dart ffi instead of package registry to initialize the library
* add `MetadataGod.initialize` method to initialize the before `runApp`
* use macos and iOS XCFrameworks instead of podspec include (static assets)
  
> **BREAKING CHANGES**:
> * `MetadataGod.initialize` must be called before `runApp`

### [0.3.2](https://github.com/KRTirtho/metadata_god/compare/v0.3.1...v0.3.2) (2023-01-05)


### Bug Fixes

* no implementation of WireSyncRust build error ([0c755e2](https://github.com/KRTirtho/metadata_god/commit/0c755e26564d37d18ee401d7080ce48689a43a33))

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