# Affise Attribution Flutter library

- [Affise Attribution Flutter library](#affise-attribution-flutter-library)
- [Description](#description)
  - [Quick start](#quick-start)
  - [Integration](#integration)
    - [Integrate as dependency](#integrate-as-dependency)
    - [Initialize](#initialize)
    - [Requirements](#requirements)
      - [Android](#android)
- [Features](#features)
    - [Device identifiers collection](#device-identifiers-collection)
    - [Events tracking](#events-tracking)
    - [Custom events tracking](#custom-events-tracking)
    - [Predefined event parameters](#predefined-event-parameters)
    - [Events buffering](#events-buffering)
    - [Advertising Identifier (google) tracking](#advertising-identifier-google-tracking)
    - [Open Advertising Identifier (huawei) tracking](#open-advertising-identifier-huawei-tracking)
    - [Install referrer tracking](#install-referrer-tracking)
    - [Push token tracking](#push-token-tracking)
    - [Reinstall Uninstall tracking](#reinstall-uninstall-tracking)
    - [APK preinstall tracking](#apk-preinstall-tracking)
    - [Deeplinks](#deeplinks)
      - [Android](#android-1)
      - [iOS](#ios)
    - [Offline mode](#offline-mode)
    - [Disable tracking](#disable-tracking)
    - [Disable background tracking](#disable-background-tracking)
    - [GDPR right to be forgotten](#gdpr-right-to-be-forgotten)
    - [Platform specific](#platform-specific)
      - [Get referrer](#get-referrer)
      - [Get referrer value](#get-referrer-value)
  - [Licence](#licence)

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
      url: git://github.com/affise/flutter-sdk.git
```


### Initialize

After dependency is added, sync project with `flutter pub get` and initialize.


```dart
import 'package:flutter/foundation.dart';
import 'package:affise_attribution_lib/affise.dart';

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    AffiseInitProperties properties = AffiseInitProperties(
      affiseAppId: "Your appId", //Change to your app id
      isProduction: kReleaseMode, //Add your custom rule to determine if this is a production build
      secretId: "Your secretId", //Change to your appToken
      partParamName: null, //Change to your partParamName
      partParamNameToken: null, //Change to your partParamNameToken
      appToken: null, //Change to your appToken
    );
    
    Affise.init(properties);
  }
}
```


### Requirements

#### Android
Minimal Android SDK version is 21 
Example `example/android/app/build.gradle`
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

OAID certificate in your project
`example/android/app/src/assets/oaid.cert.pem`


# Features

### Device identifiers collection

To match users with events and data library is sending, these identifiers are collected:

- `AFFISE_APP_ID`
- `AFFISE_PKG_APP_NAME`
- `AFFISE_APP_NAME_DASHBOARD`
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
- `INSTALL_BEGIN_TIME`
- `INSTALL_FINISH_TIME`
- `REFERRAL_TIME`
- `CREATED_TIME`
- `CREATED_TIME_MILLI`
- `CREATED_TIME_HOUR`
- `UNINSTALL_TIME`
- `REINSTALL_TIME`
- `LAST_SESSION_TIME`
- `CONNECTION_TYPE`
- `CPU_TYPE`
- `HARDWARE_NAME`
- `NETWORK_TYPE`
- `DEVICE_MANUFACTURER`
- `PROXY_IP_ADDRESS`
- `DEEPLINK_CLICK`
- `DEVICE_ATLAS_ID`
- `AFFISE_DEVICE_ID`
- `AFFISE_ALT_DEVICE_ID`
- `ADID`
- `ANDROID_ID`
- `ANDROID_ID_MD5`
- `MAC_SHA1`
- `MAC_MD5`
- `GAID_ADID`
- `GAID_ADID_MD5`
- `OAID`
- `OAID_MD5`
- `REFTOKEN`
- `REFTOKENS`
- `REFERRER`
- `USER_AGENT`
- `MCCODE`
- `MNCODE`
- `ISP`
- `REGION`
- `COUNTRY`
- `LANGUAGE`
- `DEVICE_NAME`
- `DEVICE_TYPE`
- `OS_NAME`
- `PLATFORM`
- `API_LEVEL_OS`
- `AFFISE_SDK_VERSION`
- `OS_VERSION`
- `RANDOM_USER_ID`
- `AFFISE_SDK_POS`
- `TIMEZONE_DEV`
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
- `EVENTS`
- `AFFISE_EVENTS_COUNT`

### Events tracking

For example, we want to track what items usually user adds to shopping cart. To send event first create it with
following code

```dart
import 'package:affise_attribution_lib/affise.dart';

class Presenter {
  void onUserAddsItemsToCart(String item) {
    Map<String, dynamic> items = {
      "items": "cookies, potato, milk",
    };
    
    Affise.sendEvent(
      AddToCartEvent(
        addToCartObject: items,
        timeStampMillis: DateTime.now().millisecondsSinceEpoch,
        userData: "groceries",
      )
    );
  }
}
```

With above example you can implement other events:

- `AchieveLevelEvent`
- `AddPaymentInfoEvent`
- `AddToCartEvent`
- `AddToWishlistEvent`
- `ClickAdvEvent`
- `CompleteRegistrationEvent`
- `CompleteStreamEvent`
- `CompleteTrialEvent`
- `CompleteTutorialEvent`
- `ContentItemsViewEvent`
- `ConvertedOfferEvent`
- `ConvertedOfferFromRetryEvent`
- `ConvertedTrialEvent`
- `ConvertedTrialFromRetryEvent`
- `DeepLinkedEvent`
- `FailedOfferFromRetryEvent`
- `FailedOfferiseEvent`
- `FailedSubscriptionEvent`
- `FailedSubscriptionFromRetryEvent`
- `FailedTrialEvent`
- `FailedTrialFromRetryEvent`
- `InitialOfferEvent`
- `InitialSubscriptionEvent`
- `InitialTrialEvent`
- `InitiatePurchaseEvent`
- `InitiateStreamEvent`
- `InviteEvent`
- `LastAttributedTouchEvent`
- `ListViewEvent`
- `LoginEvent`
- `OfferInRetryEvent`
- `OpenedFromPushNotificationEvent`
- `PurchaseEvent`
- `RateEvent`
- `ReEngageEvent`
- `ReactivatedSubscriptionEvent`
- `RenewedSubscriptionEvent`
- `RenewedSubscriptionFromRetryEvent`
- `ReserveEvent`
- `SalesEvent`
- `SearchEvent`
- `ShareEvent`
- `SpendCreditsEvent`
- `StartRegistrationEvent`
- `StartTrialEvent`
- `StartTutorialEvent`
- `SubscribeEvent`
- `SubscriptionEvent`
- `SubscriptionInRetryEvent`
- `TravelBookingEvent`
- `TrialInRetryEvent`
- `UnlockAchievementEvent`
- `UnsubscribeEvent`
- `UnsubscriptionEvent`
- `UpdateEvent`
- `ViewAdvEvent`
- `ViewCartEvent`
- `ViewItemEvent`
- `ViewItemsEvent`

### Custom events tracking

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

### Predefined event parameters

To enrich your event with another dimension, you can use predefined parameters for most common cases.
Add it to any event:

```dart
import 'package:affise_attribution_lib/affise.dart';

class Presenter {
  void onUserAddsItemsToCart(String item) {
    Map<String, dynamic> items = {
      "items": "cookies, potato, milk",
    };

    AddToCartEvent event = AddToCartEvent(
      addToCartObject: items,
      timeStampMillis: DateTime.now().millisecondsSinceEpoch,
    );

    event.addPredefinedParameter(PredefinedParameters.DESCRIPTION, "best before 2029");

    Affise.sendEvent(event);
  }
}
```


In examples above `PredefinedParameters.DESCRIPTION` is used, but many others is available:
- `ADREV_AD_TYPE`
- `CITY`
- `COUNTRY`
- `REGION`
- `CLASS`
- `CONTENT`
- `CONTENT_ID`
- `CONTENT_LIST`
- `CONTENT_TYPE`
- `CURRENCY`
- `CUSTOMER_USER_ID`
- `DATE_A`
- `DATE_B`
- `DEPARTING_ARRIVAL_DATE`
- `DEPARTING_DEPARTURE_DATE`
- `DESCRIPTION`
- `DESTINATION_A`
- `DESTINATION_B`
- `DESTINATION_LIST`
- `HOTEL_SCORE`
- `LEVEL`
- `MAX_RATING_VALUE`
- `NUM_ADULTS`
- `NUM_CHILDREN`
- `NUM_INFANTS`
- `ORDER_ID`
- `PAYMENT_INFO_AVAILABLE`
- `PREFERRED_NEIGHBORHOODS`
- `PREFERRED_NUM_STOPS`
- `PREFERRED_PRICE_RANGE`
- `PREFERRED_STAR_RATINGS`
- `PRICE`
- `PURCHASE_CURRENCY`
- `QUANTITY`
- `RATING_VALUE`
- `RECEIPT_ID`
- `REGISTRATION_METHOD`
- `RETURNING_ARRIVAL_DATE`
- `RETURNING_DEPARTURE_DATE`
- `REVENUE`
- `SCORE`
- `SEARCH_STRING`
- `SUBSCRIPTION_ID`
- `SUCCESS`
- `SUGGESTED_DESTINATIONS`
- `SUGGESTED_HOTELS`
- `TRAVEL_START`
- `TRAVEL_END`
- `USER_SCORE`
- `VALIDATED`
- `ACHIEVEMENT_ID`
- `COUPON_CODE`
- `CUSTOMER_SEGMENT`
- `DEEP_LINK`
- `EVENT_START`
- `EVENT_END`
- `LAT`
- `LONG`
- `NEW_VERSION`
- `OLD_VERSION`
- `REVIEW_TEXT`
- `TUTORIAL_ID`
- `VIRTUAL_CURRENCY_NAME`
- `PARAM_01`
- `PARAM_02`
- `PARAM_03`
- `PARAM_04`
- `PARAM_05`
- `PARAM_06`
- `PARAM_07`
- `PARAM_08`
- `PARAM_09`


### Events buffering

Affise library will send any pending events with first opportunity,
but if there is no network connection or device is disabled, events are kept locally for 7 days before deletion.


### Advertising Identifier (google) tracking

Advertising Identifier (google) tracking is supported automatically, no actions needed

### Open Advertising Identifier (huawei) tracking

Open Advertising Identifier is supported automatically, no actions needed

### Install referrer tracking

Install referrer tracking is supported automatically, no actions needed

### Push token tracking

To let affise track push token you need to receive it from your push service provider, and pass to Affise library.
First add firebase integration to your app completing theese steps: https://firebase.google.com/docs/cloud-messaging/android/client

After you have done with firebase inegration, add to your cloud messaging service `onNewToken` method `Affise.addPushToken(token)`

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

### Reinstall Uninstall tracking

Affise automaticly track reinstall events by using silent-push technology, to make this feature work, pass push token when it is recreated by user and on you application starts up
```dart
Affise.addPushToken(token);
```

### APK preinstall tracking

SDK is also supports scenario when APK is installed not from one of application markets, such as google play, huawei appgallery or amazon appstore
To use this feature, create file with name `partner_key` in your app assets directory, and write unique identifier inside, this key will be passed to our backend so you can track events by partner later in your Affise console.

### Deeplinks

Register deeplink callback right after Affise.init(..)

```dart
void init() {
  Affise.init(..);
  Affise.registerDeeplinkCallback((uri) {
    String? screen = uri.queryParameters["screen"];
    if(screen == "special_offer") {
      // open special offer
    } else {
      // open another
    }
  });
}
```

#### Android

To integrate deeplink support in android you need:

Add intent filter to `AndroidManifest.xml` as in `example/android/app/src/main/AndroidManifest.xml`, 

```xml
<meta-data android:name="flutter_deeplinking_enabled" android:value="true" />
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    
    <data
        android:host="YOUR_AFFISE_APP_ID.affattr.com"
        android:scheme="flutter" />
</intent-filter>
```

#### iOS

To integrate deeplink support in iOS you need:

Add key `CFBundleURLTypes` to `Info.plist` as in `example/ios/Runner/Info.plist`

```html
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLName</key>
        <string>YOUR_AFFISE_APP_ID.affattr.com</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>react</string>
        </array>
    </dict>
</array>
```

### Offline mode

In some scenarious you would want to limit Affise network usage, to pause that activity call anywhere in your application following code after Affise init:

```dart
Affise.init(..);
Affise.setOfflineModeEnabled(true); // to enable offline mode
Affise.setOfflineModeEnabled(false); // to disable offline mode
```
While offline mode is enabled, your metrics and other events are kept locally, and will be delivered once offline mode is disabled.
Offline mode is persistent as Application lifecycle, and will be disabled with process termination automaticly.
To check current offline mode status call:

```dart
Affise.isOfflineModeEnabled(); // returns true or false describing current tracking state
```

### Disable tracking

To disable any tracking activity, storing events and gathering device identifiers and metrics call anywhere in your application following code after Affise init:

```dart
Affise.init(..);
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

### Disable background tracking

To disable any background tracking activity, storing events and gathering device identifiers and metrics call anywhere in your application following code after Affise init:

```dart
Affise.init(..);
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

### GDPR right to be forgotten

Under the EU's General Data Protection Regulation (GDPR): An individual has the right to have their personal data erased.
To provide this functionality to user, as the app developer, you can call

```dart
Affise.init(..);
Affise.forget(); // to forget users data
```
After processing such request our backend servers will delete all users data.
To prevent library from generating new events, disable tracking just before calling Affise.forget:

```dart
Affise.init(..);
Affise.setTrackingEnabled(false);
Affise.forget(); // to forget users data
```

### Platform specific

#### Get referrer
> `Android Only`

Use the next public method of SDK

```dart
Affise.android.getReferrer().then((value) {

});
```

#### Get referrer value
> `Android Only`

Use the next public method of SDK to get referrer value by

```dart
Affise.android.getReferrerValue(ReferrerKey.CLICK_ID, (value) {

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

## Licence
The Affise SDK is licensed under the MIT License.

Copyright (c) 2022 Affise, Inc. | https://affise.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
