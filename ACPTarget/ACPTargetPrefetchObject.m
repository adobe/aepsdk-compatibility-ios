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
#import "ACPTargetParameters.h"
#import "ACPTargetPrefetchObject.h"

@implementation ACPTargetPrefetchObject

#pragma mark - convenience constructor

+ (instancetype) targetPrefetchObjectWithName: (NSString*) name
                             targetParameters: (ACPTargetParameters*) targetParameters {
    ACPTargetPrefetchObject* me = [[ACPTargetPrefetchObject alloc] init];

    me.name = name;
    me.targetParameters = targetParameters;

    return me;
}

- (nonnull AEPTargetPrefetchObject* ) toAEPObject {
    return [[AEPTargetPrefetchObject alloc] initWithName: self.name targetParameters: [self.targetParameters toAEPObject]];
}

@end

