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

#import <Foundation/Foundation.h>
#import "ACPMedia.h"
#import "ACPCore.h"
#import "ACPExtension.h"
#import "ACPMediaTracker+Private.h"
#import <AEPCore/AEPCore-Swift.h>
#import <AEPServices/AEPServices-Swift.h>
#import "ACPMedia.h"
#import <AEPMedia/AEPMedia-Swift.h>
//@interface ACPMediaTracker() <MediaTracker>
//  
//@end

@implementation ACPMedia{
 
}

+ (void) registerExtension {
    [ACPCore registerExtension:[AEPMobileMedia class] error:nil];
}

+ (NSString* _Nonnull) extensionVersion {
    return [AEPMobileMedia extensionVersion];
}

+ (ACPMediaTracker* _Nullable) createTracker {
    return [self createTrackerWithConfig:nil];
}

+ (ACPMediaTracker* _Nullable) createTrackerWithConfig: (NSDictionary* _Nullable) config {

    id<AEPMediaTracker> tracker = [AEPMobileMedia createTrackerWithConfig:config];
    ACPMediaTracker* ret = NULL;

    if (tracker != nil) {
        ret = [[ACPMediaTracker alloc] initWithCoreTracker:tracker];
    }

    return ret;
}

+ (void) createTracker: (void (^ _Nonnull) (ACPMediaTracker* _Nullable)) callback {
    id<AEPMediaTracker> tracker = [self createTracker];
    callback(tracker);
}

+ (void) createTrackerWithConfig: (NSDictionary* _Nullable) config callback: (void (^ _Nonnull) (ACPMediaTracker* _Nullable)) callback {
    id<AEPMediaTracker> tracker = [self createTrackerWithConfig:config];
    callback(tracker);
}

+ (NSDictionary* _Nonnull) createMediaObjectWithName: (NSString* _Nonnull) name
                                             mediaId: (NSString* _Nonnull) mediaId
                                              length: (double) length
                                          streamType: (NSString* _Nonnull) streamType
                                           mediaType: (ACPMediaType) mediaType {

    return [AEPMobileMedia createMediaObjectWith:name id:mediaId length:length streamType:streamType mediaType:mediaType];
}

+ (NSDictionary* _Nonnull) createAdBreakObjectWithName: (NSString* _Nonnull) name
                                              position: (double) position
                                             startTime: (double) startTime {

    return [AEPMobileMedia createAdBreakObjectWith:name position:position startTime:startTime];
}

+ (NSDictionary* _Nonnull) createAdObjectWithName: (NSString* _Nonnull) name
                                             adId: (NSString* _Nonnull) adId
                                         position: (double) position
                                           length: (double) length {

    return [AEPMobileMedia createAdObjectWith:name id:adId position:position length:length];
}

+ (NSDictionary* _Nonnull) createChapterObjectWithName: (NSString* _Nonnull) name
                                              position: (double) position
                                                length: (double) length
                                             startTime: (double) startTime {
    return [AEPMobileMedia createChapterObjectWith:name position:position length:length startTime:startTime];
}


+ (NSDictionary* _Nonnull) createQoEObjectWithBitrate: (double) bitrate
                                          startupTime: (double) startupTime
                                                  fps: (double) fps
                                        droppedFrames: (double) droppedFrames {

    return [AEPMobileMedia createQoEObjectWith:bitrate startTime:startupTime fps:fps droppedFrames:droppedFrames];
}

+ (NSDictionary* _Nonnull) createStateObjectWithName: (NSString* _Nonnull) stateName {
    return [AEPMobileMedia createStateObjectWith:stateName];
}

@end
