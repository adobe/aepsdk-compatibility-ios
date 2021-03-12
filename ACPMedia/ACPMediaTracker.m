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

#import "ACPMediaTracker+Private.h"
#import <AEPMedia/AEPMedia-Swift.h>
#import <Foundation/Foundation.h>
#import "ACPMedia.h"
#import "ACPCore.h"
#import "ACPExtension.h"
#import <AEPCore/AEPCore-Swift.h>
#import <AEPServices/AEPServices-Swift.h>

@implementation ACPMediaTracker {
    id<AEPMediaTracker> core_tracker_;
}

- (instancetype _Nonnull) initWithCoreTracker: (id<AEPMediaTracker>) tracker {
    if (self = [super init]) {
        core_tracker_  = tracker;
    }
    
    return self;
}

- (void) trackSessionStart: (NSDictionary* _Nonnull) mediaObject data: (NSDictionary* _Nullable) data {
    [core_tracker_ trackSessionStart:mediaObject metadata:data];
}
    
- (void) trackPlay {
    [core_tracker_ trackPlay];
}

- (void) trackPause {
    [core_tracker_ trackPause];
}

- (void) trackComplete {
    [core_tracker_ trackComplete];
}

- (void) trackSessionEnd {
    [core_tracker_ trackSessionEnd];
}

- (void) trackError: (NSString* _Nonnull) errorId {
    [core_tracker_ trackError:errorId];
}

- (void) trackEvent: (ACPMediaEvent) event info: (NSDictionary* _Nullable) info data: (NSDictionary* _Nullable) data {
   //[core_tracker_ trackEvent:event info:info metadata:data];
}

- (void) updateCurrentPlayhead: (double) time {
    [core_tracker_ updateCurrentPlayhead:time];
}

- (void) updateQoEObject: (NSDictionary* _Nonnull) qoeObject {
    [core_tracker_ updateQoEObject:qoeObject];
}

- (NSString*) eventToString: (ACPMediaEvent) event {
    //EventName = MediaConstants::EventKeys::EventName;

//    switch (event) {
//    case ACPMediaEventAdBreakStart:
//         return AEPMobileMedia

//    case ACPMediaEventAdBreakComplete:
//            return AEPMediaEventAdBreakComplete;
//
//    case ACPMediaEventAdStart:
//        return AEPMediaEventAdStart;
//
//    case ACPMediaEventAdComplete:
//        return AEPMediaEventAEPMediaEventAdComplete;
//
//    case ACPMediaEventAdSkip:
//        return AEPMediaEventAEPMediaEventAdSkip;
//
//    case ACPMediaEventChapterStart:
//        return AEPMediaEventAEPMediaEventChapterStart;
//
//    case ACPMediaEventChapterComplete:
//        return AEPMediaEventAEPMediaEventChapterComplete;
//
//    case ACPMediaEventChapterSkip:
//        return AEPMediaEventAEPMediaEventChapterSkip;
//
//    case ACPMediaEventSeekStart:
//        return AEPMediaEventAEPMediaEventSeekStart;
//
//    case ACPMediaEventSeekComplete:
//        return AEPMediaEventAEPMediaEventSeekComplete;
//
//    case ACPMediaEventBufferStart:
//        return AEPMediaEventAEPMediaEventBufferStart;
//
//    case ACPMediaEventBufferComplete:
//        return AEPMediaEventAEPMediaEventBufferComplete;
//
//    case ACPMediaEventBitrateChange:
//        return AEPMediaEventAEPMediaEventBitrateChange;
//
//    case ACPMediaEventStateStart:
//        return AEPMediaEventAEPMediaEventStateStart;
//
//    case ACPMediaEventStateEnd:
//        return AEPMediaEventAEPMediaEventStateEnd;

//    default:
        return nil;
    }
//}

@end





