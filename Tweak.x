#include <UIKit/UIKit.h>

%hook SSScreenCapturer
+ (void)playScreenshotSound {}
%end
#import <UIKit/UIKit.h>

%hook ADAccountMessagesManager
- (bool)isFreeUser {
	return NO;
}

- (bool)didSkippedAppleTrialAndEnteredFree {
	return NO;
}

- (void)setDidSkippedAppleTrialAndEnteredFree:(bool)arg1 {
	arg1 = NO;
	%orig;
}
%end

%hook ADUserPreferencesManager
- (bool)isFreeUserInsideSkipAppleTrialFlow {
	return YES;
}

- (void)setIsFreeUserInsideSkipAppleTrialFlow:(bool)arg1 {
	arg1 = YES;
	%orig;
}
%end

%hook AutoCAD360PatchedSwiftClassNameSubscriptionInfo
- (bool)isFreeUser {
	return NO;
}
%end

%ctor {
	%init(AutoCAD360PatchedSwiftClassNameSubscriptionInfo = objc_getClass("AutoCAD360.SubscriptionInfo"));

}
