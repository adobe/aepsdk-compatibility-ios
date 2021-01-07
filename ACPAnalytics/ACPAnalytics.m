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

#import <Foundation/Foundation.h>
#import <AEPCore/AEPCore-Swift.h>
#import <AEPServices/AEPServices-Swift.h>
#import <AEPAnalytics/AEPAnalytics-Swift.h>
#import "ACPExtension.h"
#import "ACPCore.h"
#import "ACPAnalytics.h"
#import "NSError+AEPError.h"

@implementation ACPAnalytics

#pragma mark - Analytics

+ (nonnull NSString*) extensionVersion {
    return [AEPMobileAnalytics extensionVersion];
}

+ (void) registerExtension {
    [ACPCore registerExtension:[AEPMobileAnalytics class] error:nil];
}

+ (void) clearQueue {
    [AEPMobileAnalytics clearQueue];
}

+ (void) getQueueSize: (nonnull void (^) (NSUInteger queueSize)) callback {
    [AEPMobileAnalytics getQueueSize:^(NSInteger queueSize, enum AEPError error) {
        callback(queueSize);
    }];
}

+ (void) getQueueSizeWithCompletionHandler: (void (^) (NSUInteger, NSError* _Nullable)) completionHandler {
    [AEPMobileAnalytics getQueueSize:^(NSInteger queueSize, enum AEPError error) {
       completionHandler(queueSize, [NSError errorFromAEPError:error]);
    }];
}

+ (void) getTrackingIdentifier: (nonnull void (^) (NSString* __nullable trackingIdentifier)) callback {
    [AEPMobileAnalytics getTrackingIdentifier:^(NSString * _Nullable trackingIdentifier, enum AEPError error) {
        callback(trackingIdentifier);
    }];
}

+ (void) getTrackingIdentifierWithCompletionHandler: (void (^) (NSString* _Nullable, NSError* _Nullable)) completionHandler {
    [AEPMobileAnalytics getTrackingIdentifier:^(NSString * _Nullable trackingIdentifier , enum AEPError error) {
        completionHandler(trackingIdentifier, [NSError errorFromAEPError:error]);
    }];
}

+ (void) sendQueuedHits {
    [AEPMobileAnalytics sendQueuedHits];
}

+ (void) getVisitorIdentifier: (nonnull void (^) (NSString* __nullable visitorIdentifier)) callback {
    [AEPMobileAnalytics getVisitorIdentifier:^(NSString * _Nullable visitorIdentifier, enum AEPError error) {
        callback(visitorIdentifier);
    }];
}

+ (void) getVisitorIdentifierWithCompletionHandler: (void (^) (NSString* _Nullable, NSError* _Nullable)) completionHandler {
    [AEPMobileAnalytics getVisitorIdentifier:^(NSString * _Nullable visitorIdentifier, enum AEPError error){
        completionHandler(visitorIdentifier, [NSError errorFromAEPError:error]);
    }];
}

+ (void) setVisitorIdentifier: (nonnull NSString*) visitorIdentifier {
    [AEPMobileAnalytics setVisitorIdentifier:(NSString * _Nonnull) visitorIdentifier];
}

@end

