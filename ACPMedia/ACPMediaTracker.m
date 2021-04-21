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
    NSDictionary* sanitizedContextData = [self sanitizeContextData:data];
    [core_tracker_ trackSessionStart:mediaObject metadata:sanitizedContextData];
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
    AEPMediaEvent event_name = [self getAepEvent:event];
    NSDictionary* sanitizedContextData = [self sanitizeContextData:data];
    [core_tracker_ trackEvent:event_name info:info metadata:sanitizedContextData];
}

- (void) updateCurrentPlayhead: (double) time {
    [core_tracker_ updateCurrentPlayhead:time];
}

- (void) updateQoEObject: (NSDictionary* _Nonnull) qoeObject {
    [core_tracker_ updateQoEObject:qoeObject];
}

- (AEPMediaEvent) getAepEvent: (ACPMediaEvent) event {

    switch (event) {
    case ACPMediaEventAdBreakStart:
            return AEPMediaEventAdBreakStart;

    case ACPMediaEventAdBreakComplete:
            return AEPMediaEventAdBreakComplete;

    case ACPMediaEventAdStart:
        return AEPMediaEventAdStart;

    case ACPMediaEventAdComplete:
        return AEPMediaEventAdComplete;

    case ACPMediaEventAdSkip:
        return AEPMediaEventAdSkip;

    case ACPMediaEventChapterStart:
        return AEPMediaEventChapterStart;

    case ACPMediaEventChapterComplete:
        return AEPMediaEventChapterComplete;

    case ACPMediaEventChapterSkip:
        return AEPMediaEventChapterSkip;

    case ACPMediaEventSeekStart:
        return AEPMediaEventSeekStart;

    case ACPMediaEventSeekComplete:
        return AEPMediaEventSeekComplete;

    case ACPMediaEventBufferStart:
        return AEPMediaEventBufferStart;

    case ACPMediaEventBufferComplete:
        return AEPMediaEventBufferComplete;

    case ACPMediaEventBitrateChange:
        return AEPMediaEventBitrateChange;

    case ACPMediaEventStateStart:
        return AEPMediaEventStateStart;

    case ACPMediaEventStateEnd:
        return AEPMediaEventStateEnd;

    default:
        return 0;
    }
}
-   (NSDictionary * _Nullable) sanitizeContextData:(nullable NSDictionary *)inputData {
        NSMutableDictionary *sanitizedDictionary = [NSMutableDictionary dictionaryWithCapacity:inputData.count];
        for (id key in inputData.allKeys) {
            if (![key isKindOfClass:NSString.class]) {
                NSString *errorMessage = [NSString stringWithFormat:@"Removing entry with non-string key: %@", key];
                [ACPCore log:ACPMobileLogLevelWarning tag:@"ACPMedia Compatibility" message:errorMessage];
                continue;
            }
            id value = inputData[key];
            if (![value isKindOfClass:NSString.class]) {
                NSString *errorMessage = [NSString stringWithFormat:@"Removing entry for key '%@' with non-string value: %@", key, value];
                [ACPCore log:ACPMobileLogLevelWarning tag:@"ACPMedia Compatibility" message:errorMessage];
                continue;
            }
            sanitizedDictionary[key] = value;
        }
        return sanitizedDictionary;
}
@end





