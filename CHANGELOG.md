# Changelog

## [1.6.29] - 2025-02-28

### Added

- New module `Persistent` for iOS.
- Persistent `AFFISE_DEVICE_ID`.
- Added `namespace` in the module's `build.gradle`

### Changed

- Update native iOS to [`1.6.45`](https://github.com/affise/sdk-ios/blob/1.6.45/CHANGELOG.md).
- Update native Android to [`1.6.53`](https://github.com/affise/sdk-android/blob/v1.6.53/CHANGELOG.md).

## [1.6.28] - 2025-02-11

### Added

- New event index `affise_event_id_index`.
- New postback index `uuid_index`.

### Fixed

- Fix `ProviderType.INSTALL_FIRST_EVENT`

### Changed

- Update native iOS to [`1.6.43`](https://github.com/affise/sdk-ios/blob/1.6.43/CHANGELOG.md).
- Update native Android to [`1.6.52`](https://github.com/affise/sdk-android/blob/v1.6.52/CHANGELOG.md).

## [1.6.27] - 2025-01-22

### Added

- Api `Affise.getReferrerOnServer`.
- Api `Affise.getReferrerOnServerValue`.

### Changed

- Update native Android to [`1.6.51`](https://github.com/affise/sdk-android/blob/v1.6.51/CHANGELOG.md).
  
## [1.6.26] - 2024-12-13

### Added

- New module `Huawei` for `AppGallery` install referrer.

### Changed

- Update native Android to [`1.6.50`](https://github.com/affise/sdk-android/blob/v1.6.50/CHANGELOG.md).

## [1.6.25] - 2024-11-26

### Added

- New module `RuStore`.

### Fixed

- Fix event writing to storage exception.

### Changed

- Update native Android to [`1.6.49`](https://github.com/affise/sdk-android/blob/v1.6.49/CHANGELOG.md).

## [1.6.24] - 2024-10-22

### Changed

- Update native Android to [`1.6.47`](https://github.com/affise/sdk-android/blob/v1.6.47/CHANGELOG.md).

### Removed

- Api `setEnabledMetrics`.
- Api `setAutoCatchingTypes`.

## [1.6.23] - 2024-10-08

### Fixed

- Fix `Affise.module.getStatus` timing retry.

### Changed

- Update native iOS to [`1.6.42`](https://github.com/affise/sdk-ios/blob/1.6.42/CHANGELOG.md).
- Update native Android to [`1.6.45`](https://github.com/affise/sdk-android/blob/v1.6.45/CHANGELOG.md).

## [1.6.22] - 2024-10-02

### Added

- Module `Subscription` StoreKit2 support.

### Changed

- Update native iOS to [`1.6.41`](https://github.com/affise/sdk-ios/blob/1.6.41/CHANGELOG.md).

## [1.6.21] - 2024-09-06

### Added

- Module `Subscription` support.

### Changed

- Update native iOS to [`1.6.40`](https://github.com/affise/sdk-ios/blob/1.6.40/CHANGELOG.md).
- Update native Android to [`1.6.44`](https://github.com/affise/sdk-android/blob/v1.6.44/CHANGELOG.md).

## [1.6.20] - 2024-08-19

### Added

- iOS only api `Affise.ios.getReferrerOnServer`.
- iOS only api `Affise.ios.getReferrerOnServerValue`.

### Changed

- Api `Affise.getReferrer` to `Affise.getReferrerUrl`.
- Api `Affise.getReferrerValue` to `Affise.getReferrerUrlValue`.
- Update native iOS to [`1.6.39`](https://github.com/affise/sdk-ios/blob/1.6.39/CHANGELOG.md).
- Update native Android to [`1.6.42`](https://github.com/affise/sdk-android/blob/v1.6.42/CHANGELOG.md).

## [1.6.19] - 2024-08-01

### Fixed

- Fix build ios.

## [1.6.18] - 2024-07-31

### Added

- Modules compatibility check.

### Fixed

- Api `Affise.Module.getStatus`.

### Changed

- Update native iOS to [`1.6.36`](https://github.com/affise/sdk-ios/blob/1.6.36/CHANGELOG.md).
- Update native Android to [`1.6.40`](https://github.com/affise/sdk-android/blob/v1.6.40/CHANGELOG.md).

## [1.6.17] - 2024-07-09

### Fixed

- AGP error
- Android Deeplink callback on open application
- Event timestamps

### Added

- New module `Link` support.
- New module `AndroidId` support.

### Changed

- Update native iOS to [`1.6.33`](https://github.com/affise/sdk-ios/blob/1.6.33/CHANGELOG.md).
- Update native Android to [`1.6.38`](https://github.com/affise/sdk-android/blob/v1.6.38/CHANGELOG.md).
- Update `registerDeeplinkCallback` change uri to convenient values.
- Update api `Affise.getStatus` moved to `Affise.module.getStatus`.
- Update api `Affise.moduleStart` moved to `Affise.module.moduleStart`.
- Update api `Affise.getModulesInstalled` moved to `Affise.module.getModulesInstalled`.

## [1.6.16] - 2024-06-14

### Fixed

- Build failure

### Changed

- Update native Android to [`1.6.35`](https://github.com/affise/sdk-android/blob/v1.6.35/CHANGELOG.md).

## [1.6.15] - 2024-06-03

### Changed

- Update native Android to [`1.6.34`](https://github.com/affise/sdk-android/blob/v1.6.34/CHANGELOG.md).

## [1.6.14] - 2024-05-30

### Added

- Event api `sendNow`.
- Affise `internal` library group callback support.

### Changed

- Update native iOS to [`1.6.32`](https://github.com/affise/sdk-ios/blob/1.6.32/CHANGELOG.md).
- Update native Android to [`1.6.33`](https://github.com/affise/sdk-android/blob/v1.6.33/CHANGELOG.md).

## [1.6.13] - 2024-03-13

### Added

- Api `isFirstRun`.

### Changed

- Update native iOS to `1.6.27`.
- Update native Android to `1.6.32`.

## [1.6.12] - 2024-02-06

### Changed

- Update native iOS to `1.6.25`.
- Update native Android to `1.6.23`.

## [1.6.11] - 2024-01-10

### Added

- Api `getModulesInstalled`.
- New values in `ReferrerKey`.

### Removed

- Event api `sendEvents`.

### Changed

- Update native iOS to `1.6.20`.
- Update native Android to `1.6.22`.

## [1.6.10] - 2023-12-19

### Removed

- Api `init`.

### Changed

- Api `Affise.android.getReferrer` to `Affise.getReferrer`
- Api `Affise.android.getReferrerValue` to  `Affise.getReferrerValue`
  
[1.6.29]: https://github.com/affise/flutter-sdk/compare/1.6.28...1.6.29
[1.6.28]: https://github.com/affise/flutter-sdk/compare/1.6.27...1.6.28
[1.6.27]: https://github.com/affise/flutter-sdk/compare/1.6.26...1.6.27
[1.6.26]: https://github.com/affise/flutter-sdk/compare/1.6.25...1.6.26
[1.6.25]: https://github.com/affise/flutter-sdk/compare/1.6.24...1.6.25
[1.6.24]: https://github.com/affise/flutter-sdk/compare/1.6.23...1.6.24
[1.6.23]: https://github.com/affise/flutter-sdk/compare/1.6.22...1.6.23
[1.6.22]: https://github.com/affise/flutter-sdk/compare/1.6.21...1.6.22
[1.6.21]: https://github.com/affise/flutter-sdk/compare/1.6.20...1.6.21
[1.6.20]: https://github.com/affise/flutter-sdk/compare/1.6.19...1.6.20
[1.6.19]: https://github.com/affise/flutter-sdk/compare/1.6.18...1.6.19
[1.6.18]: https://github.com/affise/flutter-sdk/compare/1.6.17...1.6.18
[1.6.17]: https://github.com/affise/flutter-sdk/compare/1.6.16...1.6.17
[1.6.16]: https://github.com/affise/flutter-sdk/compare/1.6.15...1.6.16
[1.6.15]: https://github.com/affise/flutter-sdk/compare/1.6.14...1.6.15
[1.6.14]: https://github.com/affise/flutter-sdk/compare/1.6.13...1.6.14
[1.6.13]: https://github.com/affise/flutter-sdk/compare/1.6.12...1.6.13
[1.6.12]: https://github.com/affise/flutter-sdk/compare/1.6.11...1.6.12
[1.6.11]: https://github.com/affise/flutter-sdk/compare/1.6.10...1.6.11
[1.6.10]: https://github.com/affise/flutter-sdk/compare/1.6.9...1.6.10
