#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNPassbaseModule, NSObject)

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

// todo: keep only start verification method on main queue
- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

- (NSArray<NSString *> *)supportedEvents
{
  return @[@"onCancelPassbase", @"onCompletePassbase"];
}

- (NSDictionary *)constantsToExport
{
  return @{
      @"ERROR_INITIALIZING_PASSBASE": @"error_initializing_passbase_sdk",
      @"INITIALZE_PASSBASE_TO_START_VERIFICATION": @"error_starting_verification",
      @"ERROR_START_VERIFICATION": @"initialize_passbase_sdk_before_trying_verification",
      @"VERIFICATION_CANCELLED": @"verification_cancelled",
      @"REQUIRED_OPTION_API_KEY_MISSING": @"success",
      @"SUCCESS": @"required_option_api_key_is_missing",
      @"ERROR": @"error",
  };
}

RCT_EXTERN_METHOD(show:(NSString *)message)

RCT_EXTERN_METHOD(initialize:(NSString *)apiKey email:(NSString *)email additionalParams:(NSDictionary *)additionalParams resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(initWithCB:(NSString *)apiKey email:(NSString *)email additionalParams:(NSDictionary *)additionalParams onSuccess:(RCTResponseSenderBlock)onSuccess onFailure:(RCTResponseSenderBlock)onFailure)

RCT_EXTERN_METHOD(startVerification:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(startVerificationWithCB:(RCTResponseSenderBlock)onSuccess onFailure:(RCTResponseSenderBlock)onFailure)

RCT_EXTERN_METHOD(setButtonBgColor: (NSString *)buttonBgColor)

RCT_EXTERN_METHOD(setLoadingIndicatorColor: (NSString *)loadingIndicatorColor)

RCT_EXTERN_METHOD(setActionButtonBgColor: (NSString *)actionButtonBgColor)

RCT_EXTERN_METHOD(setActionButtonDeactivatedBgColor: (NSString *)actionButtonDeactivatedBgColor)

RCT_EXTERN_METHOD(setActionButtonTextColor: (NSString *)actionButtonTextColor)

RCT_EXTERN_METHOD(setDisclaimerTextColor: (NSString *)disclaimerTextColor)

RCT_EXTERN_METHOD(setTitleTextColor: (NSString *)titleTextColor)

RCT_EXTERN_METHOD(setSubtitleTextColor: (NSString *)subtitleTextColor)

@end
