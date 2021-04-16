/*
Copyright 2021 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.
*/

#import "ACPCore.h"
#import "ACPTarget.h"
#import "ACPTargetPrefetchObject.h"
#import "ACPTargetRequestObject.h"
#import "ACPTargetParameters.h"
#import <AEPTarget/AEPTarget-Swift.h>

@implementation ACPTarget

#pragma mark - Target

+ (nonnull NSString*) extensionVersion {
    return [AEPMobileTarget extensionVersion];
}

+ (void) prefetchContent: (NSArray<ACPTargetPrefetchObject*>*) prefetchObjectArray
          withParameters: (ACPTargetParameters*) parameters
                callback: (nullable void (^) (NSError* _Nullable error)) callback {
    NSMutableArray *prefetchArray = [NSMutableArray array];
    for (ACPTargetPrefetchObject *prefetchObject in prefetchObjectArray) {
        [prefetchArray addObject: [prefetchObject toAEPObject]];
    }
    [AEPMobileTarget prefetchContent: prefetchArray withParameters: [parameters toAEPObject] callback: callback];
}

+ (void) retrieveLocationContent: (NSArray<ACPTargetRequestObject*>*) requests withParameters: (ACPTargetParameters*) parameters {
    NSMutableArray *requestArray = [NSMutableArray array];
    for (ACPTargetRequestObject *requestObject in requests) {
        [requestArray addObject: [requestObject toAEPObject]];
    }
    [AEPMobileTarget retrieveLocationContent: requestArray withParameters: [parameters toAEPObject]];
}

+ (void) locationsDisplayed: (nonnull NSArray<NSString*>*) mboxNames withTargetParameters: (ACPTargetParameters*) parameters {
    [AEPMobileTarget displayedLocations: mboxNames withTargetParameters: [parameters toAEPObject]];
}

+ (void) locationClickedWithName: (nonnull NSString*) name targetParameters: (nullable ACPTargetParameters*) parameters {
    [AEPMobileTarget clickedLocation: name withTargetParameters: [parameters toAEPObject]];
}

+ (void) clearPrefetchCache {
    [AEPMobileTarget clearPrefetchCache];
}

+ (void) registerExtension {
    [ACPCore registerExtension:[AEPMobileTarget class] error:nil];
}

+ (void) resetExperience {
    [AEPMobileTarget resetExperience];
}

+ (void) getThirdPartyId: (void (^) (NSString* __nullable thirdPartyId)) callback {
    [AEPMobileTarget getThirdPartyId:^(NSString *tntID, NSError *error){
        callback(tntID);
    }];
}

+ (void) setThirdPartyId: (NSString*) thirdPartyId {
    [AEPMobileTarget setThirdPartyId:thirdPartyId];
}

+ (void) getTntId: (void (^) (NSString* __nullable tntId)) callback {
    [AEPMobileTarget getThirdPartyId:^(NSString *tntID, NSError *error){
        callback(tntID);
    }];
}

+ (void) setPreviewRestartDeeplink: (nonnull NSURL*) deepLink {
    [AEPMobileTarget setPreviewRestartDeepLink:deepLink];
}

@end
