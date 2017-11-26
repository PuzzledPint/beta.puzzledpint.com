# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased][unreleased]
- Relax dependency on `ActiveSupport` to allow Rails 3 applications to use the
  gem: [#54](https://github.com/jamesmartin/inline_svg/issues/54)

## [0.11.1] - 2016-11-22
### Fixed
- Dasherize data attribute names:
  [#51](https://github.com/jamesmartin/inline_svg/issues/51)
- Prevent ID collisions between `desc` and `title` attrs:
  [#52](https://github.com/jamesmartin/inline_svg/pull/52)

## [0.11.0] - 2016-07-24
### Added
- Priority ordering for transformations

### Fixed
- Prevent duplicate desc elements being created
  [#46](https://github.com/jamesmartin/inline_svg/issues/46)
- Prevent class attributes being replaced
  [#44](https://github.com/jamesmartin/inline_svg/issues/44)

## [0.10.0] - 2016-07-24
### Added
- Rails 5 support [#43](https://github.com/jamesmartin/inline_svg/pull/43)
- Support for `Sprockets::Asset`
  [#45](https://github.com/jamesmartin/inline_svg/pull/45)

## [0.9.1] - 2016-07-18
### Fixed
- Provide a hint when the .svg extension is omitted from the filename
  [#41](https://github.com/jamesmartin/inline_svg/issues/41)

## [0.9.0] - 2016-06-30
### Fixed
- Hashed IDs for desc and title elements in aria-labeled-by attribute
  [#38](https://github.com/jamesmartin/inline_svg/issues/38)

## [0.8.0] - 2016-05-23
### Added
- Default values for custom transformations
  [#36](https://github.com/jamesmartin/inline_svg/issues/36). Thanks,
  [@andrewaguiar](https://github.com/andrewaguiar)

## [0.7.0] - 2016-05-03
### Added
- Aria attributes transform (aria-labelledby / role etc.) Addresses issue
  [#28](https://github.com/jamesmartin/inline_svg/issues/28)

## [0.6.4] - 2016-04-23
### Fixed
- Don't duplicate the `title` element. Addresses issue
  [#31](https://github.com/jamesmartin/inline_svg/issues/31)
- Make the `title` element the first child node of the SVG document

## [0.6.3] - 2016-04-19
### Added
- Accept `IO` objects as arguments to `inline_svg`. Thanks,
  [@ASnow](https://github.com/ASnow).

## [0.6.2] - 2016-01-24
### Fixed
- Support Sprockets >= 3.0 and config.assets.precompile = false

## [0.6.1] - 2015-08-06
### Fixed
- Support Rails versions back to 4.0.4. Thanks, @walidvb.

## [0.6.0] - 2015-07-07
### Added
- Apply user-supplied [custom
transformations](https://github.com/jamesmartin/inline_svg/blob/master/README.md#custom-transformations) to a document.

## [0.5.3] - 2015-06-22
### Added
- `preserveAspectRatio` transformation on SVG root node. Thanks, @paulozoom.

## [0.5.2] - 2015-04-03
### Fixed
- Support Sprockets v2 and v3 (Sprockets::Asset no longer to_s to a filename)

## [0.5.1] - 2015-03-30
### Warning
*** This version is NOT comaptible with Sprockets >= 3.***

### Fixed
- Support for ActiveSupport (and hence, Rails) 4.2.x. Thanks, @jmarceli.

## [0.5.0] - 2015-03-29
### Added
- A new option: `id` adds an id attribute to the SVG.
- A new option: `data` adds data attributes to the SVG.

### Changed
- New options: `height` and `width` override `size` and can be set independently.

## [0.4.0] - 2015-03-22
### Added
- A new option: `size` adds width and height attributes to an SVG. Thanks, @2metres.

### Changed
- Dramatically simplified the TransformPipeline and Transformations code.
- Added tests for the pipeline and new size transformations.

### Fixed
- Transformations can no longer be created with a nil value.

## [0.3.0] - 2015-03-20
### Added
- Use Sprockets to find canonical asset paths (fingerprinted, post asset-pipeline).

## [0.2.0] - 2014-12-31
### Added
- Optionally remove comments from SVG files. Thanks, @jmarceli.

## [0.1.0] - 2014-12-15
### Added
- Optionally add a title and description to a document. Thanks, ludwig.schubert@qlearning.de.
- Add integration tests for main view helper. Thanks, ludwig.schubert@qlearning.de.

## 0.0.1 - 2014-11-24
### Added
- Basic Railtie and view helper to inline SVG documents to Rails views.

[unreleased]: https://github.com/jamesmartin/inline_svg/compare/v0.11.1...HEAD
[0.11.1]: https://github.com/jamesmartin/inline_svg/compare/v0.11.0...v0.11.1
[0.11.0]: https://github.com/jamesmartin/inline_svg/compare/v0.10.0...v0.11.0
[0.10.0]: https://github.com/jamesmartin/inline_svg/compare/v0.9.1...v0.10.0
[0.9.1]: https://github.com/jamesmartin/inline_svg/compare/v0.9.0...v0.9.1
[0.9.0]: https://github.com/jamesmartin/inline_svg/compare/v0.8.0...v0.9.0
[0.8.0]: https://github.com/jamesmartin/inline_svg/compare/v0.7.0...v0.8.0
[0.7.0]: https://github.com/jamesmartin/inline_svg/compare/v0.6.4...v0.7.0
[0.6.4]: https://github.com/jamesmartin/inline_svg/compare/v0.6.3...v0.6.4
[0.6.3]: https://github.com/jamesmartin/inline_svg/compare/v0.6.2...v0.6.3
[0.6.2]: https://github.com/jamesmartin/inline_svg/compare/v0.6.1...v0.6.2
[0.6.1]: https://github.com/jamesmartin/inline_svg/compare/v0.6.0...v0.6.1
[0.6.0]: https://github.com/jamesmartin/inline_svg/compare/v0.5.3...v0.6.0
[0.5.3]: https://github.com/jamesmartin/inline_svg/compare/v0.5.2...v0.5.3
[0.5.2]: https://github.com/jamesmartin/inline_svg/compare/v0.5.1...v0.5.2
[0.5.1]: https://github.com/jamesmartin/inline_svg/compare/v0.5.0...v0.5.1
[0.5.0]: https://github.com/jamesmartin/inline_svg/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/jamesmartin/inline_svg/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/jamesmartin/inline_svg/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/jamesmartin/inline_svg/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/jamesmartin/inline_svg/compare/v0.0.1...v0.1.0
