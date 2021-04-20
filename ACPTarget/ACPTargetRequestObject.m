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
#import "ACPTargetParameters.h"
#import "ACPTargetRequestObject.h"

@implementation ACPTargetRequestObject

+ (nonnull instancetype) targetRequestObjectWithName: (NSString*) name
                                    targetParameters: (ACPTargetParameters*) targetParameters
                                      defaultContent: (NSString*) defaultContent
                                            callback: (void (^) (NSString* _Nullable)) callback {
    ACPTargetRequestObject* me = [[ACPTargetRequestObject alloc] init];

    me.name = name;
    me.defaultContent = defaultContent;
    me.targetParameters = targetParameters;
    me.callback = callback;

    return me;
}

- (nonnull AEPTargetRequestObject* ) toAEPObject {
    return [[AEPTargetRequestObject alloc] initWithMboxName: self.name defaultContent: self.defaultContent targetParameters: [self.targetParameters toAEPObject] contentCallback: self.callback];
}
@end
