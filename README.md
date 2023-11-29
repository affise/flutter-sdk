# Affise Attribution Flutter Library

| Package                  |                         Version                         |
|--------------------------|:-------------------------------------------------------:|
| `affise_attribution_lib` | [`1.6.7`](https://github.com/affise/sdk-react/releases) |

- [Affise Attribution Flutter Library](#affise-attribution-flutter-library)
- [Description](#description)
  - [Quick start](#quick-start)
  - [Integration](#integration)
    - [Integrate as dependency](#integrate-as-dependency)
    - [Add platform modules](#add-platform-modules)
      - [Android](#android)
      - [iOS](#ios)
    - [Initialize](#initialize)
      - [Domain](#domain)
    - [Requirements](#requirements)
      - [Android](#android-1)
      - [iOS](#ios-1)
- [Features](#features)
  - [ProviderType identifiers collection](#providertype-identifiers-collection)
    - [Attribution](#attribution)
    - [Advertising](#advertising)
    - [Network](#network)
    - [Phone](#phone)
  - [Events tracking](#events-tracking)
  - [Custom events tracking](#custom-events-tracking)
  - [Predefined event parameters](#predefined-event-parameters)
    - [PredefinedString](#predefinedstring)
    - [PredefinedLong](#predefinedlong)
    - [PredefinedFloat](#predefinedfloat)
    - [PredefinedObject](#predefinedobject)
    - [PredefinedListObject](#predefinedlistobject)
    - [PredefinedListString](#predefinedliststring)
  - [Events buffering](#events-buffering)
  - [Advertising Identifier (google) tracking](#advertising-identifier-google-tracking)
  - [Open Advertising Identifier (huawei) tracking](#open-advertising-identifier-huawei-tracking)
  - [Install referrer tracking](#install-referrer-tracking)
  - [Push token tracking](#push-token-tracking)
  - [Reinstall Uninstall tracking](#reinstall-uninstall-tracking)
  - [APK preinstall tracking](#apk-preinstall-tracking)
  - [Deeplinks](#deeplinks)
    - [Android](#android-2)
    - [iOS](#ios-2)
  - [Offline mode](#offline-mode)
  - [Disable tracking](#disable-tracking)
  - [Disable background tracking](#disable-background-tracking)
  - [Get random user Id](#get-random-user-id)
  - [Get random device Id](#get-random-device-id)
  - [Get providers](#get-providers)
  - [Get module state](#get-module-state)
  - [Platform specific](#platform-specific)
    - [GDPR right to be forgotten](#gdpr-right-to-be-forgotten)
    - [Get referrer](#get-referrer)
    - [Get referrer value](#get-referrer-value)
      - [Referrer keys](#referrer-keys)
    - [StoreKit Ad Network](#storekit-ad-network)
- [SDK to SDK integrations](#sdk-to-sdk-integrations)
- [Debug](#debug)
  - [Validate credentials](#validate-credentials)
- [Troubleshoots](#troubleshoots)
  - [iOS](#ios-3)

# Description

Affise SDK is a software you can use to collect app usage statistics, device identifiers, deeplink usage, track install
referrer.

## Quick start

## Integration

### Integrate as dependency

Add [git](https://github.com/affise/flutter-sdk) dependency to `pubspec.yaml` in your flutter application

```yaml
dependencies:
  flutter:
    sdk: flutter

  affise_attribution_lib:
    git:
      url: https://github.com/affise/flutter-sdk
```

### Add platform modules

#### Android

Add modules to android project

| Module               | Version                                                                                                                                                                      |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `module-advertising` | [![module-advertising](https://img.shields.io/maven-central/v/com.affise/module-advertising?label=latest)](https://mvnrepository.com/artifact/com.affise/module-advertising) |
| `module-network`     | [![module-network](https://img.shields.io/maven-central/v/com.affise/module-network?label=latest)](https://mvnrepository.com/artifact/com.affise/module-network)             |
| `module-phone`       | [![module-phone](https://img.shields.io/maven-central/v/com.affise/module-phone?label=latest)](https://mvnrepository.com/artifact/com.affise/module-phone)                   |
| `module-status`      | [![module-status](https://img.shields.io/maven-central/v/com.affise/module-status?label=latest)](https://mvnrepository.com/artifact/com.affise/module-status)                |

Example [`example/android/app/build.gradle`](example/android/app/build.gradle)

```gradle
dependencies {
    // Affise modules
    implementation 'com.affise:module-advertising:1.6.+'
    implementation 'com.affise:module-network:1.6.+'
    implementation 'com.affise:module-phone:1.6.+'
    implementation 'com.affise:module-status:1.6.+'
}
```

#### iOS

Add modules to iOS project

| Module                |                                       Version                                        |
|-----------------------|:------------------------------------------------------------------------------------:|
| `AffiseModule/Status` | [`1.6.17`](https://github.com/CocoaPods/Specs/tree/master/Specs/0/3/d/AffiseModule/) |

Example [example/ios/Podfile](example/ios/Podfile)

```ruby
target 'Runner' do
  # ...
  
  # Affise Module
  pod 'AffiseModule/Status', `1.6.17`
end
```

### Initialize

After dependency is added, sync project with `flutter pub get` and initialize.

> Demo app [`main.dart`](example/lib/main.dart)

```dart
import 'package:flutter/foundation.dart';
import 'package:affise_attribution_lib/affise.dart';

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Affise
      .settings(
        affiseAppId: "Your appId", //Change to your app id
        secretKey: "Your SDK secretKey", //Change to your SDK secretKey
      )
      .start(); // Start Affise SDK
  }
}
```

Check if library is initialized

```dart
Affise.isInitialized();
```

#### Domain

Set SDK server domain:

```dart
Affise
  .settings(
    affiseAppId: "Your appId", 
    secretKey: "Your SDK secretKey",
  )
  .setProduction(false)
  .setDomain("https://YoureCustomDomain/") // Set custom domain
  .start(); // Start Affise SDK
```

### Requirements

#### Android

Minimal Android SDK version is 21
Example [`example/android/app/build.gradle`](example/android/app/build.gradle)

```groovy
android {
  defaultConfig {
    minSdkVersion Math.max(flutter.minSdkVersion, 21)
  }
}
```

For a minimal working functionality your app needs to declare internet permission:

```xml
<manifest>
    <uses-permission android:name="android.permission.INTERNET"/>
</manifest>
```

OAID certificate in your project [`example/android/app/src/main/assets/oaid.cert.pem`](example/android/app/src/main/assets/oaid.cert.pem)

#### iOS

Affise SDK uses `AppTrackingTransparency` framework to get `advertisingIdentifier`
For working functionality your app needs to declare [`NSUserTrackingUsageDescription` permission](https://developer.apple.com/documentation/bundleresources/information_property_list/nsusertrackingusagedescription):

Open XCode project `info.plist` and add key `NSUserTrackingUsageDescription` with string value

Example [`info.plist`](example/ios/Runner/Info.plist):

```xml
<plist version="1.0">
<dict>
    ...
	<key>NSUserTrackingUsageDescription</key>
	<string>Youre permission text</string>
</dict>
```

# Features

## ProviderType identifiers collection

To match users with events and data library is sending, these `ProviderType` identifiers are collected:

### Attribution

- `AFFISE_APP_ID`
- `AFFISE_PKG_APP_NAME`
- `AFF_APP_NAME_DASHBOARD`
- `APP_VERSION`
- `APP_VERSION_RAW`
- `STORE`
- `TRACKER_TOKEN`
- `TRACKER_NAME`
- `FIRST_TRACKER_TOKEN`
- `FIRST_TRACKER_NAME`
- `LAST_TRACKER_TOKEN`
- `LAST_TRACKER_NAME`
- `OUTDATED_TRACKER_TOKEN`
- `INSTALLED_TIME`
- `FIRST_OPEN_TIME`
- `INSTALLED_HOUR`
- `FIRST_OPEN_HOUR`
- `INSTALL_FIRST_EVENT`
- `INSTALL_BEGIN_TIME`
- `INSTALL_FINISH_TIME`
- `REFERRER_INSTALL_VERSION`
- `REFERRAL_TIME`
- `REFERRER_CLICK_TIME`
- `REFERRER_CLICK_TIME_SERVER`
- `REFERRER_GOOGLE_PLAY_INSTANT`
- `CREATED_TIME`
- `CREATED_TIME_MILLI`
- `CREATED_TIME_HOUR`
- `UNINSTALL_TIME`
- `REINSTALL_TIME`
- `LAST_SESSION_TIME`
- `CPU_TYPE`
- `HARDWARE_NAME`
- `DEVICE_MANUFACTURER`
- `DEEPLINK_CLICK`
- `DEVICE_ATLAS_ID`
- `AFFISE_DEVICE_ID`
- `AFFISE_ALT_DEVICE_ID`
- `ANDROID_ID`
- `ANDROID_ID_MD5`
- `REFTOKEN`
- `REFTOKENS`
- `REFERRER`
- `USER_AGENT`
- `MCCODE`
- `MNCODE`
- `REGION`
- `COUNTRY`
- `LANGUAGE`
- `DEVICE_NAME`
- `DEVICE_TYPE`
- `OS_NAME`
- `PLATFORM`
- `SDK_PLATFORM`
- `API_LEVEL_OS`
- `AFFISE_SDK_VERSION`
- `OS_VERSION`
- `RANDOM_USER_ID`
- `AFFISE_SDK_POS`
- `TIMEZONE_DEV`
- `AFFISE_EVENT_NAME`
- `AFFISE_EVENT_TOKEN`
- `LAST_TIME_SESSION`
- `TIME_SESSION`
- `AFFISE_SESSION_COUNT`
- `LIFETIME_SESSION_COUNT`
- `AFFISE_DEEPLINK`
- `AFFISE_PART_PARAM_NAME`
- `AFFISE_PART_PARAM_NAME_TOKEN`
- `AFFISE_APP_TOKEN`
- `LABEL`
- `AFFISE_SDK_SECRET_ID`
- `UUID`
- `AFFISE_APP_OPENED`
- `PUSHTOKEN`
- `AFFISE_EVENTS_COUNT`
- `AFFISE_SDK_EVENTS_COUNT`
- `AFFISE_METRICS_EVENTS_COUNT`
- `AFFISE_INTERNAL_EVENTS_COUNT`
- `IS_ROOTED`
- `IS_EMULATOR`

### Advertising

- `GAID_ADID`
- `GAID_ADID_MD5`
- `OAID`
- `OAID_MD5`
- `ADID`
- `ALTSTR_ADID`
- `FIREOS_ADID`
- `COLOROS_ADID`

### Network

- `MAC_SHA1`
- `MAC_MD5`
- `CONNECTION_TYPE`
- `PROXY_IP_ADDRESS`

### Phone

- `NETWORK_TYPE`
- `ISP`

## Events tracking

For example, we want to track what items usually user adds to shopping cart. To send event first create it with
following code

```dart
import 'package:affise_attribution_lib/affise.dart';

class Presenter {
  void onUserAddsItemsToCart(String item) {
    Map<String, dynamic> items = {
      "items": "cookies, potato, milk",
    };

    AddToCartEvent(userData: "groceries")
      .addPredefinedObject(PredefinedObject.CONTENT, items)
      .send(); // Send event
  }
}
```

With above example you can implement other events:

- `AchieveLevel`
- `AddPaymentInfo`
- `AddToCart`
- `AddToWishlist`
- `AdRevenue`
- `ClickAdv`
- `CompleteRegistration`
- `CompleteStream`
- `CompleteTrial`
- `CompleteTutorial`
- `Contact`
- `ContentItemsView`
- `CustomizeProduct`
- `DeepLinked`
- `Donate`
- `FindLocation`
- `InitiateCheckout`
- `InitiatePurchase`
- `InitiateStream`
- `Invite`
- `LastAttributedTouch`
- `Lead`
- `ListView`
- `Login`
- `OpenedFromPushNotification`
- `Order`
- `OrderItemAdded`
- `OrderItemRemove`
- `OrderCancel`
- `OrderReturnRequest`
- `OrderReturnRequestCancel`
- `Purchase`
- `Rate`
- `ReEngage`
- `Reserve`
- `Sales`
- `Schedule`
- `Search`
- `Share`
- `SpendCredits`
- `StartRegistration`
- `StartTrial`
- `StartTutorial`
- `SubmitApplication`
- `Subscribe`
- `TravelBooking`
- `UnlockAchievement`
- `Unsubscribe`
- `Update`
- `ViewAdv`
- `ViewCart`
- `ViewContent`
- `ViewItem`
- `ViewItems`
- `InitialSubscription`
- `InitialTrial`
- `InitialOffer`
- `ConvertedTrial`
- `ConvertedOffer`
- `TrialInRetry`
- `OfferInRetry`
- `SubscriptionInRetry`
- `RenewedSubscription`
- `FailedSubscriptionFromRetry`
- `FailedOfferFromRetry`
- `FailedTrialFromRetry`
- `FailedSubscription`
- `FailedOfferise`
- `FailedTrial`
- `ReactivatedSubscription`
- `RenewedSubscriptionFromRetry`
- `ConvertedOfferFromRetry`
- `ConvertedTrialFromRetry`
- `Unsubscription`

## Custom events tracking

Use any of custom events if default doesn't fit your scenario:

- `CustomId01Event`
- `CustomId02Event`
- `CustomId03Event`
- `CustomId04Event`
- `CustomId05Event`
- `CustomId06Event`
- `CustomId07Event`
- `CustomId08Event`
- `CustomId09Event`
- `CustomId10Event`

## Predefined event parameters

To enrich your event with another dimension, you can use predefined parameters for most common cases.
Add it to any event:

```dart
import 'package:affise_attribution_lib/affise.dart';

class Presenter {
  void onUserAddsItemsToCart(String item) {
    Map<String, dynamic> items = {
      "items": "cookies, potato, milk",
    };

    AddToCartEvent(
      timeStampMillis: DateTime.now().millisecondsSinceEpoch,
    )
      .addPredefinedString(PredefinedString.DESCRIPTION, "best before 2029")
      .addPredefinedObject(PredefinedObject.CONTENT, items)
      .send(); // Send event
  }
}
```

In examples above `PredefinedParameters.DESCRIPTION` and `PredefinedObject.CONTENT` is used, but many others is available:

| PredefinedParameter                           | Type                                   | Event Method              |
|-----------------------------------------------|----------------------------------------|---------------------------|
| [PredefinedString](#predefinedstring)         | String                                 | addPredefinedString()     |
| [PredefinedLong](#predefinedlong)             | int                                    | addPredefinedLong()       |
| [PredefinedFloat](#predefinedfloat)           | double                                 | addPredefinedFloat()      |
| [PredefinedObject](#predefinedobject)         | Map&lt;String, dynamic&gt;             | addPredefinedObject()     |
| [PredefinedListObject](#predefinedlistobject) | List&lt;Map&lt;String, dynamic&gt;&gt; | addPredefinedListObject() |
| [PredefinedListString](#predefinedliststring) | List&lt;String&gt;                     | addPredefinedListString() |

### PredefinedString

- `ACHIEVEMENT_ID`
- `ADREV_AD_TYPE`
- `BRAND`
- `BRICK`
- `CAMPAIGN_ID`
- `CATALOGUE_ID`
- `CHANNEL_TYPE`
- `CITY`
- `CLASS`
- `CLICK_ID`
- `CONTENT_ID`
- `CONTENT_NAME`
- `CONTENT_TYPE`
- `CONVERSION_ID`
- `COUNTRY`
- `COUPON_CODE`
- `CURRENCY`
- `CUSTOMER_SEGMENT`
- `CUSTOMER_TYPE`
- `CUSTOMER_USER_ID`
- `DEEP_LINK`
- `DESCRIPTION`
- `DESTINATION_A`
- `DESTINATION_B`
- `DESTINATION_LIST`
- `EVENT_NAME`
- `NEW_VERSION`
- `NETWORK`
- `OLD_VERSION`
- `ORDER_ID`
- `PARAM_01`
- `PARAM_02`
- `PARAM_03`
- `PARAM_04`
- `PARAM_05`
- `PARAM_06`
- `PARAM_07`
- `PARAM_08`
- `PARAM_09`
- `PARAM_10`
- `PAYMENT_INFO_AVAILABLE`
- `PID`
- `PLACEMENT`
- `PREFERRED_NEIGHBORHOODS`
- `PRODUCT_ID`
- `PRODUCT_NAME`
- `PURCHASE_CURRENCY`
- `RECEIPT_ID`
- `REGION`
- `REGISTRATION_METHOD`
- `REVIEW_TEXT`
- `SEARCH_STRING`
- `SEGMENT`
- `SOURCE`
- `STATUS`
- `SUBSCRIPTION_ID`
- `SUCCESS`
- `SUGGESTED_DESTINATIONS`
- `SUGGESTED_HOTELS`
- `TUTORIAL_ID`
- `UNIT`
- `UTM_CAMPAIGN`
- `UTM_MEDIUM`
- `UTM_SOURCE`
- `VALIDATED`
- `VERTICAL`
- `VIRTUAL_CURRENCY_NAME`
- `VOUCHER_CODE`

### PredefinedLong

- `AMOUNT`
- `DATE_A`
- `DATE_B`
- `DEPARTING_ARRIVAL_DATE`
- `DEPARTING_DEPARTURE_DATE`
- `HOTEL_SCORE`
- `LEVEL`
- `MAX_RATING_VALUE`
- `NUM_ADULTS`
- `NUM_CHILDREN`
- `NUM_INFANTS`
- `PREFERRED_NUM_STOPS`
- `PREFERRED_STAR_RATINGS`
- `QUANTITY`
- `RATING_VALUE`
- `RETURNING_ARRIVAL_DATE`
- `RETURNING_DEPARTURE_DATE`
- `SCORE`
- `TRAVEL_START`
- `TRAVEL_END`
- `USER_SCORE`
- `EVENT_START`
- `EVENT_END`

### PredefinedFloat

- `PREFERRED_PRICE_RANGE`
- `PRICE`
- `REVENUE`
- `LAT`
- `LONG`

### PredefinedObject

- `CONTENT`

### PredefinedListObject

- `CONTENT_LIST`

### PredefinedListString

- `CONTENT_IDS`

## Events buffering

Affise library will send any pending events with first opportunity,
but if there is no network connection or device is disabled, events are kept locally for 7 days before deletion.

## Advertising Identifier (google) tracking

Advertising Identifier (google) tracking is supported automatically, no actions needed

## Open Advertising Identifier (huawei) tracking

Open Advertising Identifier is supported automatically, no actions needed

## Install referrer tracking

Install referrer tracking is supported automatically, no actions needed

## Push token tracking

To let affise track push token you need to receive it from your push service provider, and pass to Affise library.
First add firebase integration to your app completing these steps: Firebase [iOS](https://firebase.google.com/docs/cloud-messaging/ios/client) or [Android](https://firebase.google.com/docs/cloud-messaging/android/client) Docs

After you have done with firebase integration, add to your cloud messaging service `onNewToken` method `Affise.addPushToken(token)`

```dart
import 'package:affise_attribution_lib/affise.dart';

void saveToken(String token) {
  Affise.addPushToken(token);
}

class _Application extends State<Application> {
  String _token;

  Future<void> setupToken() async {
    // Get the token each time the application loads
    String? token = await FirebaseMessaging.instance.getToken();

    // Any time the token refreshes, store this in the database too.
    FirebaseMessaging.instance.onTokenRefresh.listen(saveToken);
  }

  @override
  void initState() {
    super.initState();

    setupToken();
  }

  @override
  Widget build(BuildContext context) {
    return Text("...");
  }
}
```

## Reinstall Uninstall tracking

Affise automatically track reinstall events by using silent-push technology, to make this feature work, pass push token when it is recreated by user and on you application starts up

```dart
Affise.addPushToken("token");
```

## APK preinstall tracking

SDK is also supports scenario when APK is installed not from one of application markets, such as google play, huawei appgallery or amazon appstore
To use this feature, create file with name `partner_key` in your app assets directory, and write unique identifier inside, this key will be passed to our backend so you can track events by partner later in your Affise console.

## Deeplinks

Register deeplink callback right after `Affise.settings(..).start()`

```dart
void init() {
  Affise.settings(affiseAppId, secretKey).start(); // Start Affise SDK

  Affise.registerDeeplinkCallback((uri) {
    // Handle deeplink
  });
}
```

### Android

To integrate deeplink support in android you need:

Add intent filter to `AndroidManifest.xml` as in `example/android/app/src/main/AndroidManifest.xml`, 

```xml
<meta-data android:name="flutter_deeplinking_enabled" android:value="true" />
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    
    <data
        android:host="YOUR_DOMAIN"
        android:scheme="flutter" />
</intent-filter>
```

### iOS

To integrate deeplink support in iOS you need:

Add key `CFBundleURLTypes` to `Info.plist`

Example: [`example/ios/Runner/Info.plist`](example/ios/Runner/Info.plist)

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLName</key>
        <string>YOUR_DOMAIN</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>react</string>
        </array>
    </dict>
</array>
```

## Offline mode

In some scenarios you would want to limit Affise network usage, to pause that activity call anywhere in your application following code after Affise init:

```dart
Affise.settings(affiseAppId, secretKey).start(); // Start Affise SDK

Affise.setOfflineModeEnabled(true); // to enable offline mode
Affise.setOfflineModeEnabled(false); // to disable offline mode
```

While offline mode is enabled, your metrics and other events are kept locally, and will be delivered once offline mode is disabled.
Offline mode is persistent as Application lifecycle, and will be disabled with process termination automatically.
To check current offline mode status call:

```dart
Affise.isOfflineModeEnabled(); // returns true or false describing current tracking state
```

## Disable tracking

To disable any tracking activity, storing events and gathering device identifiers and metrics call anywhere in your application following code after Affise init:

```dart
Affise.settings(affiseAppId, secretKey).start(); // Start Affise SDK

Affise.setTrackingEnabled(true); // to enable tracking
Affise.setTrackingEnabled(false); // to disable tracking
```

By default tracking is enabled.

While tracking mode is disabled, metrics and other identifiers is not generated locally.
Keep in mind that this flag is persistent until app reinstall, and don't forget to reactivate tracking when needed.
To check current status of tracking call:

```dart
Affise.isTrackingEnabled(); // returns true or false describing current tracking state
```

## Disable background tracking

To disable any background tracking activity, storing events and gathering device identifiers and metrics call anywhere in your application following code after Affise init:

```dart
Affise.settings(affiseAppId, secretKey).start(); // Start Affise SDK

Affise.setBackgroundTrackingEnabled(true); // to enable background tracking
Affise.setBackgroundTrackingEnabled(false); // to disable background tracking
```

By default background tracking is enabled.

While background tracking mode is disabled, metrics and other identifiers is not generated locally.
Background tracking mode is persistent as Application lifecycle, and will be re-enabled with process termination automatically.
To check current status of background tracking call:

```dart
Affise.isBackgroundTrackingEnabled(); // returns true or false describing current background tracking state
```

## Get random user Id

```dart
Affise.getRandomUserId();
```

## Get random device Id

```dart
Affise.getRandomDeviceId();
```

## Get providers

Returns providers map with [ProviderType](#providertype-identifiers-collection) as key

```dart
Affise.getProviders().then((providers) {
  var key = ProviderType.AFFISE_APP_TOKEN;
  var value = providers[key];
});
```

## Get module state

```dart
Affise.getStatus(AffiseModules.STATUS, (response) {
    // handle status response
});
```

## Platform specific

### GDPR right to be forgotten

> `Android Only`

Under the EU's General Data Protection Regulation (GDPR): An individual has the right to have their personal data erased.
To provide this functionality to user, as the app developer, you can call

```dart
Affise.settings(affiseAppId, secretKey).start(); // Start Affise SDK

Affise.android.forget(); // to forget users data
```

After processing such request our backend servers will delete all users data.
To prevent library from generating new events, disable tracking just before calling Affise.forget:

```dart
Affise.settings(affiseAppId, secretKey).start(); // Start Affise SDK

Affise.setTrackingEnabled(false);
Affise.android.forget(); // to forget users data
```

### Get referrer

> `Android Only`

Use the next public method of SDK

```dart
Affise.android.getReferrer((value) {
  // handle referrer
});
```

### Get referrer value

> `Android Only`

Use the next public method of SDK to get referrer value by

```dart
Affise.android.getReferrerValue(ReferrerKey.CLICK_ID, (value) {
  // handle referrer
});
```

#### Referrer keys

In examples above `ReferrerKey.CLICK_ID` is used, but many others is available:

- `AD_ID`
- `CAMPAIGN_ID`
- `CLICK_ID`
- `AFFISE_AD`
- `AFFISE_AD_ID`
- `AFFISE_AD_TYPE`
- `AFFISE_ADSET`
- `AFFISE_ADSET_ID`
- `AFFISE_AFFC_ID`
- `AFFISE_CHANNEL`
- `AFFISE_CLICK_LOOK_BACK`
- `AFFISE_COST_CURRENCY`
- `AFFISE_COST_MODEL`
- `AFFISE_COST_VALUE`
- `AFFISE_DEEPLINK`
- `AFFISE_KEYWORDS`
- `AFFISE_MEDIA_TYPE`
- `AFFISE_MODEL`
- `AFFISE_OS`
- `AFFISE_PARTNER`
- `AFFISE_REF`
- `AFFISE_SITE_ID`
- `AFFISE_SUB_SITE_ID`
- `AFFC`
- `PID`
- `SUB_1`
- `SUB_2`
- `SUB_3`
- `SUB_4`
- `SUB_5`

### StoreKit Ad Network

> `iOS Only`

For ios prior `16.1` first call

```dart
Affise.ios.registerAppForAdNetworkAttribution((error) { 
  // Handle error
});
```

Updates the fine and coarse conversion values, and calls a completion handler if the update fails.
Second argument coarseValue is available in iOS 16.1+

```dart
Affise.ios.updatePostbackConversionValue(1, SKAdNetwork.CoarseConversionValue.medium, (error) { 
  // Handle error
});
```

Configure your app to send postback copies to Affise:

Add key `NSAdvertisingAttributionReportEndpoint` to `Info.plist`
Set key value to `https://affise-skadnetwork.com/`

Example: [`example/ios/Runner/Info.plist`](example/ios/Runner/Info.plist)

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
      <key>NSAdvertisingAttributionReportEndpoint</key>
      <string>https://affise-skadnetwork.com/</string>
    </dict>
</array>
```

# SDK to SDK integrations

```dart
// Send AdRevenue info
AffiseAdRevenue(AffiseAdSource.ADMOB)
  .setRevenue(2.5, "ImpressionData_Currency")
  .setNetwork("ImpressionData_Network")
  .setUnit("ImpressionData_Unit")
  .setPlacement("ImpressionData_Placement")
  .send();
```

# Debug

## Validate credentials

> **Warning**
>
> 🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥
> 
> Debug methods WON'T work on Production
>
> 🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥

Validate your credentials by receiving `ValidationStatus` values:

- `VALID` - your credentials are valid
- `INVALID_APP_ID` - your app id is not valid
- `INVALID_SECRET_KEY` - your SDK secretKey is not valid
- `PACKAGE_NAME_NOT_FOUND` - your application package name not found
- `NOT_WORKING_ON_PRODUCTION` - you using debug method on production
- `NETWORK_ERROR` - network or server not available (for example `Airoplane mode` is active)

```dart
Affise
  .settings(
    affiseAppId: "Your appId",
    secretKey: "Your SDK secretKey",
  )
  .setProduction(false) //To enable debug methods set Production to false
  .start(); // Start Affise SDK

Affise.debug.validate((status) {
    // Handle validation status
});
```

# Troubleshoots

## iOS

> **Warning**
>
> 🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥
> 
> This app has crashed because it attempted to access privacy-sensitive data without a usage description.
> 
> The app's `Info.plist` must contain an `NSUserTrackingUsageDescription` key with a string value explaining
> 
> to the user how the app uses this data.
>
> 🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥

Open `info.plist` and add key `NSUserTrackingUsageDescription` with string value. For more information [read requirements](#requirements)
