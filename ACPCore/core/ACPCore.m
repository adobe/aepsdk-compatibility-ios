/*
Copyright 2020 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.
*/

#import <objc/runtime.h>
#import <AEPCore/AEPCore-Swift.h>
#import <AEPServices/AEPServices-Swift.h>
#import "ACPCore.h"
#import "ACPExtensionEvent.h"
#import "ACPExtension.h"
#import "ACPBridgeExtension.h"
#import "NSError+AEPError.h"

#pragma mark - ACPCore Implementation

static NSMutableArray *_pendingExtensions;

@implementation ACPCore

#pragma mark - Configuration

+ (void) configureWithAppId: (NSString* __nullable) appid {
    [AEPMobileCore configureWithAppId:appid];
}

+ (void) configureWithFileInPath: (NSString* __nullable) filepath {
    [AEPMobileCore configureWithFilePath:filepath];
}

+ (void) getSdkIdentities: (nullable void (^) (NSString* __nullable content)) callback {
    [AEPMobileCore getSdkIdentities:^(NSString * _Nullable content, NSError * _Nullable error) {
        callback(content);
    }];
}

+ (void) getSdkIdentitiesWithCompletionHandler: (nullable void (^) (NSString* __nullable content, NSError* _Nullable error)) callback {
    [AEPMobileCore getSdkIdentities:^(NSString * _Nullable content, NSError * _Nullable error) {
        callback(content, error);
    }];
}

+ (void) getPrivacyStatus: (nonnull void (^) (ACPMobilePrivacyStatus status)) callback {
    [AEPMobileCore getPrivacyStatus:^(enum AEPPrivacyStatus status) {
        callback((ACPMobilePrivacyStatus) status);
    }];
}

+ (void) getPrivacyStatusWithCompletionHandler: (nonnull void (^) (ACPMobilePrivacyStatus status, NSError* _Nullable error)) callback {
    [AEPMobileCore getPrivacyStatus:^(enum AEPPrivacyStatus status) {
        callback((ACPMobilePrivacyStatus) status, nil);
    }];
}

+ (nonnull NSString*) extensionVersion {
    return [AEPMobileCore extensionVersion];
}

+ (void) setAppGroup: (nullable NSString*) appGroup {
    [AEPMobileCore setAppGroup:appGroup];
}

+ (void) setLogLevel: (ACPMobileLogLevel) logLevel {
    [AEPMobileCore setLogLevel:logLevel];
}

+ (void) setPrivacyStatus: (ACPMobilePrivacyStatus) status {
    [AEPMobileCore setPrivacyStatus:(AEPPrivacyStatus) status];
}

+ (void) updateConfiguration: (NSDictionary* __nullable) config {
    [AEPMobileCore updateConfiguration:config];
}

#pragma mark - Extensions

+ (void) registerExtensions: (NSArray* __nullable) extensions callback:(nullable void (^) (void)) callback {
    NSMutableArray *cleanedExtensions = [NSMutableArray arrayWithArray:_pendingExtensions];
    for (id extensionClass in extensions) {
        Class wrappedExtension = [self wrapExtensionClassIfNeeded:extensionClass];
        if (wrappedExtension) {
            [cleanedExtensions addObject:wrappedExtension];
        }
    }
    
    [AEPMobileCore registerExtensions:cleanedExtensions completion:callback];
    [_pendingExtensions removeAllObjects];
}

+ (BOOL) registerExtension: (nonnull Class) extensionClass
                     error: (NSError* _Nullable* _Nullable) error {
    // If registering a legacy 3rd party extension, we need to create a wrapper extension
    extensionClass = [self wrapExtensionClassIfNeeded:extensionClass];
    if (!extensionClass) {
        return nil;
    }
    
    if (!_pendingExtensions) {
        _pendingExtensions = [NSMutableArray array];
    }
    
    [_pendingExtensions addObject:extensionClass];
    
    return YES;
}

+ (void) start: (nullable void (^) (void)) callback {
    [AEPMobileCore registerExtensions:_pendingExtensions completion:^{
        [_pendingExtensions removeAllObjects];
        callback();
    }];
}

#pragma mark - Generic Methods
+ (void) collectPii: (nonnull NSDictionary<NSString*, NSString*>*) data {
    [AEPMobileCore collectPii:data];
}

+ (void) lifecyclePause {
    [AEPMobileCore lifecyclePause];
}

+ (void) lifecycleStart: (nullable NSDictionary<NSString*, NSString*>*) additionalContextData {
    [AEPMobileCore lifecycleStart:additionalContextData];
}

+ (void) setAdvertisingIdentifier: (nullable NSString*) adId {
    [AEPMobileCore setAdvertisingIdentifier:adId];
}

#if !TARGET_OS_WATCH
+ (void) registerURLHandler: (nonnull BOOL (^) (NSString* __nullable url)) callback {
    // TODO
}
#endif

+ (void) setPushIdentifier: (nullable NSData*) deviceToken {
    [AEPMobileCore setPushIdentifier:deviceToken];
}

+ (void) trackAction: (nullable NSString*) action data: (nullable NSDictionary<NSString*, NSString*>*) data {
    // clean the dictionary first, ensuring all key and value entries are strings
    NSDictionary *cleanedData = [ACPCore sanitizeTrackingDataDictionary:data];
    [AEPMobileCore trackAction:action data:cleanedData];
}

+ (void) trackState: (nullable NSString*) state data: (nullable NSDictionary<NSString*, NSString*>*) data {
    // clean the dictionary first, ensuring all key and value entries are strings
    NSDictionary *cleanedData = [ACPCore sanitizeTrackingDataDictionary:data];
    [AEPMobileCore trackState:state data:cleanedData];
}

+ (BOOL) dispatchEvent: (nonnull ACPExtensionEvent*) event
                 error: (NSError* _Nullable* _Nullable) error {
    AEPEvent *convertedEvent = [[AEPEvent alloc] initWithName:event.eventName type:event.eventType source:event.eventSource data:event.eventData];
    [AEPMobileCore dispatch:convertedEvent];
    return YES;
}

+ (BOOL) dispatchEventWithResponseCallback: (nonnull ACPExtensionEvent*) requestEvent
                          responseCallback: (nonnull void (^) (ACPExtensionEvent* _Nonnull responseEvent)) responseCallback
                                     error: (NSError* _Nullable* _Nullable) error {
    
    AEPEvent *convertedEvent = [[AEPEvent alloc] initWithName:requestEvent.eventName type:requestEvent.eventType source:requestEvent.eventSource data:requestEvent.eventData];
    [AEPMobileCore dispatch:convertedEvent timeout:1 responseCallback:^(AEPEvent * _Nullable responseEvent) {
        ACPExtensionEvent *convertedResponseEvent = [[ACPExtensionEvent alloc] initWithAEPEvent:responseEvent];
        responseCallback(convertedResponseEvent);
    }];
    
    return YES;
}

+ (BOOL) dispatchResponseEvent: (nonnull ACPExtensionEvent*) responseEvent
                  requestEvent: (nonnull ACPExtensionEvent*) requestEvent
                         error: (NSError* _Nullable* _Nullable) error {
    // TODO
    return NO;
}

+ (void) collectLaunchInfo: (nonnull NSDictionary*) userInfo {
    // TODO
}

+ (void) collectMessageInfo: (nonnull NSDictionary*) messageInfo {
    [AEPMobileCore collectMessageInfo:messageInfo];
}

#pragma mark - Logging Utilities

+ (ACPMobileLogLevel) logLevel {
    return [AEPLog logFilter];
}

+ (void) log: (ACPMobileLogLevel) logLevel tag: (nonnull NSString*) tag message: (nonnull NSString*) message {
    switch (logLevel) {
        case ACPMobileLogLevelVerbose:
            [AEPLog traceWithLabel:tag message:message];
            break;
        case ACPMobileLogLevelDebug:
            [AEPLog debugWithLabel:tag message:message];
            break;
        case ACPMobileLogLevelWarning:
            [AEPLog warningWithLabel:tag message:message];
            break;
        case ACPMobileLogLevelError:
            [AEPLog errorWithLabel:tag message:message];
            break;
        default:
            break;
    }
}

#pragma mark - Rules Engine

+ (void) downloadRules {
    // TODO
}

#pragma mark - Wrapper Support

+ (void) setWrapperType: (ACPMobileWrapperType) wrapperType {
    [AEPMobileCore setWrapperType:wrapperType];
}

#pragma mark - Private Helpers

/// This method determines if `extensionClass` is a descendent of `ACPExtension`, if so, it dynamically creates a new class derived from `ACPBridgeExtension`  to wrap the instance of `ACPExtension`
/// @param extensionClass the class which should be registered with the `EventHub`
+ (Class _Nonnull)wrapExtensionClassIfNeeded:(Class _Nonnull)extensionClass {
    // This extension is a legacy 3rd party extension if it inherits from `ACPExtension`
    if (class_getSuperclass(extensionClass) == [ACPExtension class]) {
        // attempting to register a legacy 3rd party extension, create a wrapper class
        NSString *wrapperClassName = [NSString stringWithFormat:@"Bridged%@", NSStringFromClass(extensionClass)];
        Class wrapperClass = objc_allocateClassPair([ACPBridgeExtension class], wrapperClassName.UTF8String, 0); // create a subclass of ACPBridgeExtension named wrapperClassName
        if (!wrapperClass) {
            NSString *errorMsg = [NSString stringWithFormat:@"Failed to created bridged extension for class %@, registration failed.", NSStringFromClass(extensionClass)];
            [ACPCore log:ACPMobileLogLevelError tag:@"wrapExtensionClassIfNeeded" message:errorMsg];
            return nil;
        }
        
        objc_registerClassPair(wrapperClass);
        [ACPBridgeExtension setExtensionClass:extensionClass withName:wrapperClassName]; // set the underlying extension class to the original extension class
        
        return wrapperClass;
    }
    
    return extensionClass;
}

/// Ensures that all keys and values of `inputData` are `NSString` type.
/// If a key or value is not of type NSString, the KVP will be removed from the sanitized result.
/// @param inputData The dictionary to be sanitized
/// @returns a sanitized dictionary of <NSString, NSString> key-value pairs
+ (NSDictionary * _Nullable) sanitizeTrackingDataDictionary:(nullable NSDictionary *)inputData {
    NSMutableDictionary *sanitizedDictionary = [NSMutableDictionary dictionaryWithCapacity:inputData.count];
    for (id key in inputData.allKeys) {
        if (![key isKindOfClass:NSString.class]) {
            NSString *errorMessage = [NSString stringWithFormat:@"Removing entry with non-string key: %@", key];
            [ACPCore log:ACPMobileLogLevelWarning tag:@"ACPCore Compatibility" message:errorMessage];
            continue;
        }
        id value = inputData[key];
        if (![value isKindOfClass:NSString.class]) {
            NSString *errorMessage = [NSString stringWithFormat:@"Removing entry for key '%@' with non-string value: %@", key, value];
            [ACPCore log:ACPMobileLogLevelWarning tag:@"ACPCore Compatibility" message:errorMessage];
            continue;
        }
        sanitizedDictionary[key] = value;
    }
    
    return sanitizedDictionary;
}

@end
