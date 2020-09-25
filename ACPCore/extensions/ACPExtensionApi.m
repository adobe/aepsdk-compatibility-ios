/*
Copyright 2018 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.
*/

#import <Foundation/Foundation.h>
#import <AEPCore/AEPCore-Swift.h>
#import "ACPExtension.h"
#import "ACPExtensionApi.h"

@implementation ACPExtensionApi {
    ACPExtension* extension_;
    id<AEPExtensionRuntime> runtime_;
    NSMutableDictionary* listenerDict_; // maps listener classes to instances of those listeners
    NSLock* listenerDictLock_;
}

- (nonnull instancetype)initWithRuntime:(nonnull id<AEPExtensionRuntime>) runtime {
    if (self = [super init]) {
        runtime_ = runtime;
        listenerDict_ = [NSMutableDictionary dictionary];
        listenerDictLock_ = [[NSLock alloc] init];
    }
    
    return self;
}

- (BOOL) registerListener: (nonnull Class) listenerClass
                eventType: (nonnull NSString*) event_type
              eventSource: (nonnull NSString*) event_source
                    error: (NSError* _Nullable* _Nullable) error {
    if (!runtime_) {
        if (error) {
            *error = [[NSError alloc] initWithDomain:ACPExtensionErrorDomain
                                                code:ADBUnexpectedExtensionError
                                            userInfo:nil];
        }
        return NO;
    }
    
    if ([event_type length] == 0) {
        if (error) {
            *error = [[NSError alloc] initWithDomain:ACPExtensionErrorDomain
                                                code:ADBEventTypeNotSupportedExtensionError
                                            userInfo:nil];
        }

        return NO;
    } else if ([event_source length] == 0) {
        if (error) {
            *error = [[NSError alloc] initWithDomain:ACPExtensionErrorDomain
                                                code:ADBEventSourceNotSupportedExtensionError
                                            userInfo:nil];
        }

        return NO;
    }
    
    ACPExtensionListener *listener = [self getListenerForClass:listenerClass];
    
    [runtime_ registerListenerWithType:event_type source:event_source listener:^(AEPEvent * _Nonnull event) {
        ACPExtensionEvent *convertedEvent = [[ACPExtensionEvent alloc] initWithAEPEvent:event];
        [listener hear:convertedEvent];
    }];
    
    return YES;
}

- (BOOL) registerWildcardListener: (nonnull Class) listenerClass
                            error: (NSError* _Nullable* _Nullable) error {
    if (!runtime_) {
        if (error) {
            *error = [[NSError alloc] initWithDomain:ACPExtensionErrorDomain
                                                code:ADBUnexpectedExtensionError
                                            userInfo:nil];
        }
        return NO;
    }
    
    ACPExtensionListener *listener = [self getListenerForClass:listenerClass];
    
    [runtime_ registerListenerWithType:@"com.adobe.eventType._wildcard_" source:@"com.adobe.eventSource._wildcard_" listener:^(AEPEvent * _Nonnull event) {
        ACPExtensionEvent *convertedEvent = [[ACPExtensionEvent alloc] initWithAEPEvent:event];
        [listener hear:convertedEvent];
    }];
    
    return YES;
}

- (BOOL) setSharedEventState: (nullable NSDictionary*) state
                       event: (nullable ACPExtensionEvent*) event
                       error: (NSError* _Nullable* _Nullable) error {
    if (!runtime_) {
        if (error) {
            *error = [[NSError alloc] initWithDomain:ACPExtensionErrorDomain
                                                code:ADBUnexpectedExtensionError
                                            userInfo:nil];
        }
        return NO;
    }
    
    AEPEvent *convertedEvent = [[AEPEvent alloc] initWithName:event.eventName type:event.eventType source:event.eventSource data:event.eventData];
    [runtime_ createSharedStateWithData:state event:convertedEvent];
    return YES;
}

- (BOOL) clearSharedEventStates: (NSError* _Nullable* _Nullable) error {
    if (!runtime_) {
        if (error) {
            *error = [[NSError alloc] initWithDomain:ACPExtensionErrorDomain
                                                code:ADBUnexpectedExtensionError
                                            userInfo:nil];
        }
        return NO;
    }
    
    [runtime_ createSharedStateWithData:@{} event:nil];
    return YES;
}

- (nullable NSDictionary*) getSharedEventState: (nonnull NSString*) name
                                         event: (nullable ACPExtensionEvent*) event
                                         error: (NSError* _Nullable* _Nullable) error {
    AEPEvent *convertedEvent = [[AEPEvent alloc] initWithName:event.eventName type:event.eventType source:event.eventSource data:event.eventData];
    AEPSharedStateResult *result = [runtime_ getSharedStateWithExtensionName:name event:convertedEvent  barrier:false];
    return result.value;
}

- (void) unregisterExtension {
    extension_ = nil;
}

- (void)setExtension:(ACPExtension *) extension {
    extension_ = extension;
}

- (ACPExtensionListener *)getListenerForClass: (nonnull Class) listenerClass {
    [listenerDictLock_ lock];
    NSString *className = NSStringFromClass(listenerClass);
    
    if (!listenerDict_[className]) {
        ACPExtensionListener *listener = [[listenerClass alloc] initWithExtension:extension_];
        listenerDict_[className] = listener;
    }
    
    ACPExtensionListener *listener = listenerDict_[className];
    [listenerDictLock_ unlock];
    return listener;
}

@end

