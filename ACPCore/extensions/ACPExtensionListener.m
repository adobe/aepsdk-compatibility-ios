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
#import "ACPExtension.h"
#import "ACPExtensionListener.h"

@implementation ACPExtensionListener {
    ACPExtension* extension_;
}

/* @brief Initialize the ACPExtensionListener with the ACPExtension that created it
 * @private this initializer is only intended to be used by the bridge code
 */
- (nullable instancetype) initWithExtension: (ACPExtension*) extension {
    if (self = [super init]) {
        extension_ = extension;
    }
    
    return self;
}

- (nonnull instancetype) init {
    return self;
}

- (nonnull ACPExtension*) extension {
    return extension_;
}

- (void) hear: (nonnull ACPExtensionEvent*) event {
    // do nothing
}

@end
