import 'package:affise_attribution_lib/affise.dart';
import 'package:intl/intl.dart';

import 'events_factory.dart';

class DefaultEventsFactory implements EventsFactory {
  @override
  List<Event> createEvents() {
    return [
      createAchieveLevelEvent(),
      createAddPaymentInfoEvent(),
      createAddToCartEvent(),
      createAddToWishlistEvent(),
      createClickAdvEvent(),
      createCompleteRegistrationEvent(),
      createCompleteStreamEvent(),
      createCompleteTrialEvent(),
      createCompleteTutorialEvent(),
      createContactEvent(),
      createContentItemsViewEvent(),
      createCustomId01Event(),
      createCustomId02Event(),
      createCustomId03Event(),
      createCustomId04Event(),
      createCustomId05Event(),
      createCustomId06Event(),
      createCustomId07Event(),
      createCustomId08Event(),
      createCustomId09Event(),
      createCustomId10Event(),
      createCustomizeProductEvent(),
      createDeepLinkedEvent(),
      createDonateEvent(),
      createFindLocationEvent(),
      createInitiateCheckoutEvent(),
      createInitiatePurchaseEvent(),
      createInitiateStreamEvent(),
      createInviteEvent(),
      createLastAttributedTouchEvent(),
      createLeadEvent(),
      createListViewEvent(),
      createLoginEvent(),
      createOpenedFromPushNotificationEvent(),
      createOrderCancelEvent(),
      createOrderEvent(),
      createOrderReturnRequestCancelEvent(),
      createOrderReturnRequestEvent(),
      createPurchaseEvent(),
      createRateEvent(),
      createReEngageEvent(),
      createReserveEvent(),
      createSalesEvent(),
      createScheduleEvent(),
      createSearchEvent(),
      createShareEvent(),
      createSpendCreditsEvent(),
      createStartRegistrationEvent(),
      createStartTrialEvent(),
      createStartTutorialEvent(),
      createSubmitApplicationEvent(),
      createSubscribeEvent(),
      createTravelBookingEvent(),
      createUnlockAchievementEvent(),
      createUnsubscribeEvent(),
      createUpdateEvent(),
      createViewAdvEvent(),
      createViewCartEvent(),
      createViewContentEvent(),
      createViewItemEvent(),
      createViewItemsEvent(),
      createInitialSubscriptionEvent(),
      createInitialTrialEvent(),
      createInitialOfferEvent(),
      createFailedTrialEvent(),
      createFailedOfferiseEvent(),
      createFailedSubscriptionEvent(),
      createFailedTrialFromRetryEvent(),
      createFailedOfferFromRetryEvent(),
      createFailedSubscriptionFromRetryEvent(),
      createTrialInRetryEvent(),
      createOfferInRetryEvent(),
      createSubscriptionInRetryEvent(),
      createConvertedTrialEvent(),
      createConvertedOfferEvent(),
      createReactivatedSubscriptionEvent(),
      createRenewedSubscriptionEvent(),
      createConvertedTrialFromRetryEvent(),
      createConvertedOfferFromRetryEvent(),
      createRenewedSubscriptionFromRetryEvent(),
      createUnsubscriptionEvent(),
    ];
  }

  Event createAchieveLevelEvent() {
    Map<String, dynamic> level = {
      "old_level": 69,
      "new_level": 70,
    };
    AchieveLevelEvent event = AchieveLevelEvent(
      userData: "warlock",
    );
    event.addPredefinedString(
      PredefinedString.DEEP_LINK,
      "https://new-game.lt",
    );
    event.addPredefinedLong(
      PredefinedLong.SCORE,
      25013,
    );
    event.addPredefinedLong(
      PredefinedLong.LEVEL,
      70,
    );
    event.addPredefinedString(
      PredefinedString.SUCCESS,
      "true",
    );
    event.addPredefinedString(
      PredefinedString.TUTORIAL_ID,
      "12",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      level,
    );
    return event;
  }

  Event createAddPaymentInfoEvent() {
    Map<String, dynamic> data = {
      "card": 4138,
      "type": "phone",
    };
    AddPaymentInfoEvent event = AddPaymentInfoEvent(
      userData: "taxi",
    );
    event.addPredefinedString(
      PredefinedString.PURCHASE_CURRENCY,
      "USD",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createAddToCartEvent() {
    List products = ["milk", "cookies", "meat", "vegetables"];
    Map<String, dynamic> items = {
      "items": products,
    };
    AddToCartEvent event = AddToCartEvent();
    event.addPredefinedString(
      PredefinedString.DESCRIPTION,
      "best before 2029",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      items,
    );
    return event;
  }

  Event createAddToWishlistEvent() {
    List wishes = ["car", "house", "sdk"];
    Map<String, dynamic> items = {
      "items": wishes,
    };
    AddToWishlistEvent event = AddToWishlistEvent(
      userData: "next year",
    );
    event.addPredefinedString(
      PredefinedString.COUNTRY,
      "Russia",
    );
    event.addPredefinedString(
      PredefinedString.CITY,
      "Voronezh",
    );
    event.addPredefinedFloat(
      PredefinedFloat.LAT,
      42.0,
    );
    event.addPredefinedFloat(
      PredefinedFloat.LONG,
      24.0,
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      items,
    );
    return event;
  }

  Event createClickAdvEvent() {
    ClickAdvEvent event = ClickAdvEvent(
      userData: "header",
    );

    event.addPredefinedString(
      PredefinedString.DESCRIPTION,
      "facebook-meta",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "PARAM_01",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_02,
      "PARAM_02",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_03,
      "PARAM_03",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_04,
      "PARAM_04",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_05,
      "PARAM_05",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_06,
      "PARAM_06",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_07,
      "PARAM_07",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_08,
      "PARAM_08",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_09,
      "PARAM_09",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_10,
      "PARAM_10",
    );

    return event;
  }

  Event createCompleteRegistrationEvent() {
    Map<String, dynamic> data = {
      "email": "dog@gmail.com",
    };
    CompleteRegistrationEvent event = CompleteRegistrationEvent(
      userData: "promo",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    event.addPredefinedString(
      PredefinedString.VALIDATED,
      "02.11.2021",
    );
    event.addPredefinedString(
      PredefinedString.REVIEW_TEXT,
      "approve",
    );
    event.addPredefinedString(
      PredefinedString.CUSTOMER_SEGMENT,
      "DOG",
    );

    return event;
  }

  Event createCompleteStreamEvent() {
    Map<String, dynamic> data = {
      "streamer": "cat",
      "max_viewers": "29",
    };
    CompleteStreamEvent event = CompleteStreamEvent(
      userData: "23 hours",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );

    return event;
  }

  Event createCompleteTrialEvent() {
    Map<String, dynamic> data = {
      "player": "ghost",
    };
    CompleteTrialEvent event = CompleteTrialEvent(
      userData: "time",
    );
    event.addPredefinedString(
      PredefinedString.REGISTRATION_METHOD,
      "SMS",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );

    return event;
  }

  Event createCompleteTutorialEvent() {
    Map<String, dynamic> data = {
      "name": "intro",
    };
    CompleteTutorialEvent event = CompleteTutorialEvent(
      userData: "intro",
    );
    event.addPredefinedString(
      PredefinedString.REGISTRATION_METHOD,
      "SMS",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );

    return event;
  }

  Event createContactEvent() {
    Map<String, dynamic> data = {
      "name": "intro",
    };
    Event event = ContactEvent(
      userData: "contact",
    );
    event.addPredefinedString(
      PredefinedString.REGISTRATION_METHOD,
      "SMS",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );

    return event;
  }

  Event createContentItemsViewEvent() {
    List<Map<String, dynamic>> data = [
      {
        "item": "book",
      },
      {
        "item": "guitar",
      },
    ];

    ContentItemsViewEvent event = ContentItemsViewEvent(
      userData: "personal",
    );

    event.addPredefinedListObject(
      PredefinedListObject.CONTENT_LIST,
      data,
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      {
        "name": "Greatest Hits",
      },
    );
    event.addPredefinedString(
      PredefinedString.CONTENT_ID,
      "2561",
    );
    event.addPredefinedString(
      PredefinedString.CONTENT_TYPE,
      "MATURE",
    );
    event.addPredefinedString(
      PredefinedString.CURRENCY,
      "USD",
    );
    return event;
  }

  Event createCustomId01Event() {
    CustomId01Event event = CustomId01Event(
      userData: "custom",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createCustomId02Event() {
    CustomId02Event event = CustomId02Event(
      userData: "custom",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createCustomId03Event() {
    CustomId03Event event = CustomId03Event(
      userData: "custom",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createCustomId04Event() {
    CustomId04Event event = CustomId04Event(
      userData: "custom",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createCustomId05Event() {
    CustomId05Event event = CustomId05Event(
      userData: "custom",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createCustomId06Event() {
    CustomId06Event event = CustomId06Event(
      userData: "custom",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createCustomId07Event() {
    CustomId07Event event = CustomId07Event(
      userData: "custom",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createCustomId08Event() {
    CustomId08Event event = CustomId08Event(
      userData: "custom",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createCustomId09Event() {
    CustomId09Event event = CustomId09Event(
      userData: "custom",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createCustomId10Event() {
    CustomId10Event event = CustomId10Event(
      userData: "custom",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createCustomizeProductEvent() {
    Event event = CustomizeProductEvent(
      userData: "customize",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createDeepLinkedEvent() {
    DeepLinkedEvent event = DeepLinkedEvent(
      userData: "referrer: google",
    );

    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      {"isLinked": true},
    );
    event.addPredefinedString(
      PredefinedString.ADREV_AD_TYPE,
      "interstitial",
    );
    event.addPredefinedString(
      PredefinedString.REGION,
      "ASIA",
    );
    event.addPredefinedString(
      PredefinedString.CLASS,
      "student",
    );
    return event;
  }

  Event createDonateEvent() {
    Event event = DonateEvent(
      userData: "donate",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createFindLocationEvent() {
    Event event = FindLocationEvent(
      userData: "FindLocation",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createInitiateCheckoutEvent() {
    Event event = InitiateCheckoutEvent(
      userData: "checkout",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createInitiatePurchaseEvent() {
    Map<String, dynamic> data = {
      "payment": "card",
    };
    InitiatePurchaseEvent event = InitiatePurchaseEvent(
      userData: "best price",
    );
    event.addPredefinedString(
      PredefinedString.ORDER_ID,
      "23123",
    );
    event.addPredefinedFloat(
      PredefinedFloat.PRICE,
      2.19,
    );
    event.addPredefinedLong(
      PredefinedLong.QUANTITY,
      1,
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createInitiateStreamEvent() {
    Map<String, dynamic> data = {
      "streamer": "car",
      "date": "02.03.2021",
    };
    InitiateStreamEvent event = InitiateStreamEvent(
      userData: "shooter",
    );
    event.addPredefinedString(
      PredefinedString.COUPON_CODE,
      "25XLKM",
    );
    event.addPredefinedString(
      PredefinedString.VIRTUAL_CURRENCY_NAME,
      "BTC",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createInviteEvent() {
    Map<String, dynamic> data = {
      "invitation": "mail",
      "date": "02.03.2021",
    };
    InviteEvent event = InviteEvent(
      userData: "dancing",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createLastAttributedTouchEvent() {
    Map<String, dynamic> data = {
      "touchType": TouchType.CLICK,
      "touchData": {
        "header": 2,
      },
    };
    LastAttributedTouchEvent event = LastAttributedTouchEvent(
      userData: "tablet",
    );
    event.addPredefinedString(
      PredefinedString.SUBSCRIPTION_ID,
      "lasAK22",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createLeadEvent() {
    Event event = LeadEvent(
      userData: "Lead",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createListViewEvent() {
    Map<String, dynamic> data = {
      "clothes": 2,
    };
    ListViewEvent event = ListViewEvent(
      userData: "items",
    );
    event.addPredefinedString(
      PredefinedString.PAYMENT_INFO_AVAILABLE,
      "card",
    );
    event.addPredefinedString(
      PredefinedString.SEARCH_STRING,
      "best car wash",
    );
    event.addPredefinedString(
      PredefinedString.SUGGESTED_DESTINATIONS,
      "crete, spain",
    );
    event.addPredefinedString(
      PredefinedString.SUGGESTED_HOTELS,
      "beach resort, marina spa",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createLoginEvent() {
    Map<String, dynamic> data = {
      "email": "cat@gmail.com",
    };
    LoginEvent event = LoginEvent(
      userData: "web",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createOpenedFromPushNotificationEvent() {
    OpenedFromPushNotificationEvent event = OpenedFromPushNotificationEvent(
      userData: "active",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      {
        "details": "silent",
      },
    );
    return event;
  }

  Event createOrderCancelEvent() {
    Event event = OrderCancelEvent(
      userData: "OrderCancel",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createOrderEvent() {
    Event event = OrderCancelEvent(
      userData: "OrderCancel",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createOrderReturnRequestCancelEvent() {
    Event event = OrderReturnRequestCancelEvent(
      userData: "OrderReturnRequestCancel",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createOrderReturnRequestEvent() {
    Event event = OrderReturnRequestEvent(
      userData: "OrderReturnRequest",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createPurchaseEvent() {
    Map<String, dynamic> data = {
      "phone": 1,
      "case": 1,
    };
    PurchaseEvent event = PurchaseEvent(
      userData: "apple",
    );
    event.addPredefinedString(
      PredefinedString.ORDER_ID,
      "23123",
    );
    event.addPredefinedFloat(
      PredefinedFloat.PRICE,
      2.19,
    );
    event.addPredefinedLong(
      PredefinedLong.QUANTITY,
      1,
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createRateEvent() {
    Map<String, dynamic> data = {
      "rating": 5,
    };
    RateEvent event = RateEvent(
      userData: "no bugs",
    );
    event.addPredefinedString(
      PredefinedString.PREFERRED_NEIGHBORHOODS,
      "2",
    );
    event.addPredefinedLong(
      PredefinedLong.PREFERRED_NUM_STOPS,
      4,
    );
    event.addPredefinedFloat(
      PredefinedFloat.PREFERRED_PRICE_RANGE,
      10.22,
    );
    event.addPredefinedLong(
      PredefinedLong.PREFERRED_STAR_RATINGS,
      6,
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createReEngageEvent() {
    ReEngageEvent event = ReEngageEvent(
      userData: "web",
    );
    event.addPredefinedString(
      PredefinedString.CUSTOMER_USER_ID,
      "4",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      {
        "reEngage": "data",
      },
    );
    return event;
  }

  Event createReserveEvent() {
    Map<String, dynamic> data = {
      "ticket": "movie",
    };
    Map<String, dynamic> data2 = {
      "food": "coke",
    };
    ReserveEvent event = ReserveEvent(
      userData: "discount",
    );
    event.addPredefinedString(
      PredefinedString.ORDER_ID,
      "23123",
    );
    event.addPredefinedFloat(
      PredefinedFloat.PRICE,
      2.19,
    );
    event.addPredefinedLong(
      PredefinedLong.QUANTITY,
      1,
    );
    event.addPredefinedListObject(
      PredefinedListObject.CONTENT_LIST,
      [data, data2],
    );
    return event;
  }

  Event createSalesEvent() {
    Event event = SalesEvent(
      userData: "Sales",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createScheduleEvent() {
    Event event = ScheduleEvent(
      userData: "Schedule",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createSearchEvent() {
    List<String> data = [
      "a16",
      "milk",
      "grass",
    ];
    SearchEvent event = SearchEvent(
      userData: "browser",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    event.addPredefinedListString(
      PredefinedListString.CONTENT_IDS,
      data,
    );
    return event;
  }

  Event createShareEvent() {
    Map<String, dynamic> data = {
      "post_id": "252242",
      "post_img": "img.webp",
    };

    ShareEvent event = ShareEvent(
      userData: "telegram",
    );
    event.addPredefinedString(
      PredefinedString.RECEIPT_ID,
      "22",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createSpendCreditsEvent() {
    SpendCreditsEvent event = SpendCreditsEvent(
      userData: "boosters",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      {
        "credits": 2142,
      },
    );
    return event;
  }

  Event createStartRegistrationEvent() {
    Map<String, dynamic> data = {
      "time": "19:22:11",
    };
    StartRegistrationEvent event = StartRegistrationEvent(
      userData: "referrer",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createStartTrialEvent() {
    Map<String, dynamic> data = {
      "time": "19:22:11",
    };
    StartTrialEvent event = StartTrialEvent(
      userData: "30-days",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createStartTutorialEvent() {
    Map<String, dynamic> data = {
      "time": "19:22:11",
      "reward": "22",
    };

    StartTutorialEvent event = StartTutorialEvent(
      userData: "video-feature",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createSubmitApplicationEvent() {
    Event event = SubmitApplicationEvent(
      userData: "SubmitApplication",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createSubscribeEvent() {
    Map<String, dynamic> data = {
      "streamer": "cat",
    };
    SubscribeEvent event = SubscribeEvent(
      userData: "wire",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createTravelBookingEvent() {
    List<String> data = [
      "may",
      "august",
    ];
    TravelBookingEvent event = TravelBookingEvent(
      userData: "booking",
    );
    event.addPredefinedLong(
      PredefinedLong.NUM_ADULTS,
      1,
    );
    event.addPredefinedLong(
      PredefinedLong.NUM_CHILDREN,
      2,
    );
    event.addPredefinedLong(
      PredefinedLong.NUM_INFANTS,
      1,
    );
    event.addPredefinedLong(
      PredefinedLong.DATE_A,
      "30.12.2020".timestamp,
    );
    event.addPredefinedLong(
      PredefinedLong.DATE_B,
      "01.01.2021".timestamp,
    );
    event.addPredefinedLong(
      PredefinedLong.DEPARTING_ARRIVAL_DATE,
      "01.01.2021".timestamp,
    );
    event.addPredefinedLong(
      PredefinedLong.DEPARTING_DEPARTURE_DATE,
      "30.12.2020".timestamp,
    );
    event.addPredefinedString(
      PredefinedString.DESTINATION_A,
      "usa",
    );
    event.addPredefinedString(
      PredefinedString.DESTINATION_B,
      "mexico",
    );
    event.addPredefinedString(
      PredefinedString.DESTINATION_LIST,
      "usa, mexico",
    );
    event.addPredefinedLong(
      PredefinedLong.HOTEL_SCORE,
      5,
    );
    event.addPredefinedLong(
      PredefinedLong.TRAVEL_START,
      "01.12.2020".timestamp,
    );
    event.addPredefinedLong(
      PredefinedLong.TRAVEL_END,
      "01.12.2021".timestamp,
    );
    return event;
  }

  Event createUnlockAchievementEvent() {
    Map<String, dynamic> data = {
      "achievement": "new level",
    };
    UnlockAchievementEvent event = UnlockAchievementEvent(
      userData: "best damage",
    );
    event.addPredefinedLong(
      PredefinedLong.USER_SCORE,
      12552,
    );
    event.addPredefinedString(
      PredefinedString.ACHIEVEMENT_ID,
      "1334-1225-ASDZ",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createUnsubscribeEvent() {
    Map<String, dynamic> data = {
      "reason": "span",
    };
    UnsubscribeEvent event = UnsubscribeEvent(
      userData: "02.01.2021",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createUpdateEvent() {
    List<String> data = ["com.facebook"];
    UpdateEvent event = UpdateEvent(
      userData: "firmware",
    );
    event.addPredefinedLong(
      PredefinedLong.EVENT_START,
      "01.02.2021".timestamp,
    );
    event.addPredefinedLong(
      PredefinedLong.EVENT_END,
      "01.01.2022".timestamp,
    );
    event.addPredefinedString(
      PredefinedString.NEW_VERSION,
      "8",
    );
    event.addPredefinedString(
      PredefinedString.OLD_VERSION,
      "1.8",
    );
    event.addPredefinedListString(
      PredefinedListString.CONTENT_IDS,
      data,
    );
    return event;
  }

  Event createViewAdvEvent() {
    Map<String, dynamic> data = {
      "source": "amazon",
    };
    ViewAdvEvent event = ViewAdvEvent(
      timeStampMillis: DateTime.now().millisecondsSinceEpoch,
      userData: "skip",
    );
    event.addPredefinedLong(
      PredefinedLong.RETURNING_ARRIVAL_DATE,
      "01.12.2021".timestamp,
    );
    event.addPredefinedLong(
      PredefinedLong.RETURNING_DEPARTURE_DATE,
      "01.12.2020".timestamp,
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createViewCartEvent() {
    Map<String, dynamic> data = {
      "cart_value": "25.22\$",
      "cart_items": "2",
    };
    ViewCartEvent event = ViewCartEvent(
      userData: "main",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createViewContentEvent() {
    Event event = ViewContentEvent(
      userData: "ViewContent",
    );
    event.addPredefinedString(
      PredefinedString.PARAM_01,
      "param1",
    );
    return event;
  }

  Event createViewItemEvent() {
    Map<String, dynamic> data = {
      "section_name": "header",
    };
    ViewItemEvent event = ViewItemEvent(
      userData: "main",
    );
    event.addPredefinedLong(
      PredefinedLong.MAX_RATING_VALUE,
      5,
    );
    event.addPredefinedLong(
      PredefinedLong.RATING_VALUE,
      4,
    );
    event.addPredefinedObject(
      PredefinedObject.CONTENT,
      data,
    );
    return event;
  }

  Event createViewItemsEvent() {
    List<Map<String, dynamic>> data = [
      {
        "section_name": "header",
      },
      {
        "section_name": "section-1",
      },
      {
        "section_name": "section-2",
      },
      {
        "section_name": "footer",
      },
    ];
    ViewItemsEvent event = ViewItemsEvent(
      userData: "main",
    );
    event.addPredefinedLong(
      PredefinedLong.MAX_RATING_VALUE,
      5,
    );
    event.addPredefinedLong(
      PredefinedLong.RATING_VALUE,
      4,
    );
    event.addPredefinedListObject(
      PredefinedListObject.CONTENT_LIST,
      data,
    );
    return event;
  }

  Event createInitialSubscriptionEvent() {
    Event event = InitialSubscriptionEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createInitialTrialEvent() {
    Event event = InitialTrialEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createInitialOfferEvent() {
    Event event = InitialOfferEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createFailedTrialEvent() {
    Event event = FailedTrialEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createFailedOfferiseEvent() {
    Event event = FailedOfferiseEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createFailedSubscriptionEvent() {
    Event event = FailedSubscriptionEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createFailedTrialFromRetryEvent() {
    Event event = FailedTrialFromRetryEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createFailedOfferFromRetryEvent() {
    Event event = FailedOfferFromRetryEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createFailedSubscriptionFromRetryEvent() {
    Event event = FailedSubscriptionFromRetryEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createTrialInRetryEvent() {
    Event event = TrialInRetryEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createOfferInRetryEvent() {
    Event event = OfferInRetryEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createSubscriptionInRetryEvent() {
    Event event = SubscriptionInRetryEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createConvertedTrialEvent() {
    Event event = ConvertedTrialEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createConvertedOfferEvent() {
    Event event = ConvertedOfferEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createReactivatedSubscriptionEvent() {
    Event event = ReactivatedSubscriptionEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createRenewedSubscriptionEvent() {
    Event event = RenewedSubscriptionEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createConvertedTrialFromRetryEvent() {
    Event event = ConvertedTrialFromRetryEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createConvertedOfferFromRetryEvent() {
    Event event = ConvertedOfferFromRetryEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createRenewedSubscriptionFromRetryEvent() {
    Event event = RenewedSubscriptionFromRetryEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }

  Event createUnsubscriptionEvent() {
    Event event = UnsubscriptionEvent(
      data: {
        "affise_event_revenue": 2.99,
        "affise_event_currency": "USD",
        "affise_event_product_id": 278459628375,
      },
      userData: "Subscription Plus",
    );
    event.addPredefinedFloat(
      PredefinedFloat.REVENUE,
      225522.0,
    );
    return event;
  }
}

extension _StringExt on String {
  int get timestamp {
    try {
      return DateFormat('dd.MM.y').parse(this).millisecondsSinceEpoch;
    } catch (e) {
      return DateTime.now().millisecondsSinceEpoch;
    }
  }
}
