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
//#include "MediaConstants.h"
#import <AEPMedia/AEPMedia-Swift.h>
#import <Foundation/Foundation.h>
#import "ACPMedia.h"
#import "ACPCore.h"
#import "ACPExtension.h"
#import <AEPCore/AEPCore-Swift.h>
#import <AEPServices/AEPServices-Swift.h>

@implementation ACPMediaTracker {
    MediaPublicTracker* core_tracker_;
}

- (instancetype _Nonnull) initWithCoreTracker: (MediaPublicTracker*) tracker {
    if (self = [super init]) {
        core_tracker_  = tracker;
    }
    
    return self;
}

- (void) trackSessionStart: (NSDictionary* _Nonnull) mediaObject data: (NSDictionary* _Nullable) data {
    [core_tracker_ trackSessionStartWithInfo:mediaObject metadata:data];
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
    [core_tracker_ trackErrorWithErrorId: errorId];
}

- (void) trackEvent: (ACPMediaEvent) event info: (NSDictionary* _Nullable) info data: (NSDictionary* _Nullable) data {
    //[core_tracker_ trackEventWithEvent:event info:info metadata:data];
}

- (void) updateCurrentPlayhead: (double) time {
    [core_tracker_ updateCurrentPlayheadWithTime:time];
}

- (void) updateQoEObject: (NSDictionary* _Nonnull) qoeObject {
    [core_tracker_ updateQoEObjectWithQoe:qoeObject];
}

//- (std::string) eventToString: (ACPMediaEvent) event {
//    using EventName = MediaConstants::EventKeys::EventName;
//
//    switch (event) {
//    case ACPMediaEventAdBreakStart:
//        return EventName::ADBREAK_START;
//
//    case ACPMediaEventAdBreakComplete:
//        return EventName::ADBREAK_COMPLETE;
//
//    case ACPMediaEventAdStart:
//        return EventName::AD_START;
//
//    case ACPMediaEventAdComplete:
//        return EventName::AD_COMPLETE;
//
//    case ACPMediaEventAdSkip:
//        return EventName::AD_SKIP;
//
//    case ACPMediaEventChapterStart:
//        return EventName::CHAPTER_START;
//
//    case ACPMediaEventChapterComplete:
//        return EventName::CHAPTER_COMPLETE;
//
//    case ACPMediaEventChapterSkip:
//        return EventName::CHAPTER_SKIP;
//
//    case ACPMediaEventSeekStart:
//        return EventName::SEEK_START;
//
//    case ACPMediaEventSeekComplete:
//        return EventName::SEEK_COMPLETE;
//
//    case ACPMediaEventBufferStart:
//        return EventName::BUFFER_START;
//
//    case ACPMediaEventBufferComplete:
//        return EventName::BUFFER_COMPLETE;
//
//    case ACPMediaEventBitrateChange:
//        return EventName::BITRATE_CHANGE;
//
//    case ACPMediaEventStateStart:
//        return EventName::STATE_START;
//
//    case ACPMediaEventStateEnd:
//        return EventName::STATE_END;
//
//    default:
//        return "";
//    }
//}

@end





