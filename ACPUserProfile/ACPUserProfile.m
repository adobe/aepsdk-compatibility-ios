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
#import <AEPUserProfile/AEPUserProfile-Swift.h>
#import "ACPUserProfile.h"
#import "ACPExtension.h"
#import "ACPCore.h"
#import "NSError+AEPError.h"


@implementation ACPUserProfile

#pragma mark - User Profile

+ (nonnull NSString*) extensionVersion {
    return [AEPMobileUserProfile extensionVersion];
}

+ (void) registerExtension {
    [ACPCore registerExtension:[AEPMobileUserProfile class] error:nil];
}

+ (void) removeUserAttribute: (nonnull NSString*)  attributeName{
    NSArray *attributeNames = @[attributeName];
    [AEPMobileUserProfile removeUserAttributesWithAttributeNames:attributeNames];
}

+ (void) removeUserAttributes: (nullable NSArray <NSString*>*) attributeNames {
    [AEPMobileUserProfile removeUserAttributesWithAttributeNames:attributeNames];
}

+ (void) updateUserAttribute: (nonnull NSString*) attributeName withValue: (nullable NSString*) attributeValue {
    NSDictionary *attributeMap = @{attributeName:attributeValue};
    [AEPMobileUserProfile updateUserAttributesWithAttributeDict:attributeMap];
}

+ (void) updateUserAttributes: (nonnull NSDictionary*) attributeMap {
    [AEPMobileUserProfile updateUserAttributesWithAttributeDict:attributeMap];
}

+ (void) getUserAttributes: (nullable NSArray <NSString*>*) attributNames withCompletionHandler: (nonnull void (^) (NSDictionary* __nullable userAttributes, NSError* _Nullable error)) completionHandler {
    [AEPMobileUserProfile getUserAttributesWithAttributeNames:attributNames completion:^(NSDictionary<NSString *,id> * _Nullable userAttributes, enum AEPError error) {
        completionHandler(userAttributes, [NSError errorFromAEPError:error]);
    }];
}

@end
