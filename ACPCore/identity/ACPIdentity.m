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
#import <AEPIdentity/AEPIdentity-Swift.h>
#import "ACPIdentity.h"
#import "ACPCore.h"
#import "ACPMobileVisitorId.h"
#import "NSError+AEPError.h"

@implementation ACPIdentity

#pragma mark - Identity

+ (nonnull NSString*) extensionVersion {
    return [AEPMobileIdentity extensionVersion];
}

+ (void) registerExtension {
    [ACPCore registerExtension:[AEPMobileIdentity class] error:nil];
}

+ (void) appendToUrl: (nullable NSURL*) baseUrl withCallback: (nullable void (^) (NSURL* __nullable urlWithVisitorData)) callback {
    [AEPMobileIdentity appendToUrl:baseUrl completion:^(NSURL * _Nullable url, NSError * _Nullable error) {
        callback(url);
    }];
}

+ (void) appendToUrl: (NSURL*) baseUrl withCompletionHandler: (void (^) (NSURL* _Nullable, NSError* _Nullable)) completionHandler {
    [AEPMobileIdentity appendToUrl:baseUrl completion:^(NSURL * _Nullable url, NSError * _Nullable error) {
        completionHandler(url, error);
    }];
}

+ (void) getIdentifiers: (nonnull void (^) (NSArray<ACPMobileVisitorId*>* __nullable visitorIDs)) callback {
    [AEPMobileIdentity getIdentifiers:^(NSArray<id<AEPIdentifiable>> * _Nullable visitorIDs, NSError * _Nullable error) {
        callback(convertVisitorIds(visitorIDs));
    }];
}

+ (void) getIdentifiersWithCompletionHandler: (void (^) (NSArray<ACPMobileVisitorId*>* _Nullable, NSError* _Nullable)) completionHandler {
    [AEPMobileIdentity getIdentifiers:^(NSArray<id<AEPIdentifiable>> * _Nullable visitorIDs, NSError * _Nullable error) {
       completionHandler(convertVisitorIds(visitorIDs), error);
    }];
}

+ (void) getExperienceCloudId: (nonnull void (^) (NSString* __nullable experienceCloudId)) callback {
    [AEPMobileIdentity getExperienceCloudId:^(NSString * _Nullable experienceCloudId, NSError * _Nullable error) {
        callback(experienceCloudId);
    }];
}

+ (void) getExperienceCloudIdWithCompletionHandler: (void (^) (NSString* _Nullable, NSError* _Nullable)) completionHandler {
    [AEPMobileIdentity getExperienceCloudId:^(NSString * _Nullable experienceCloudId, NSError * _Nullable error) {
        completionHandler(experienceCloudId, error);
    }];
}

+ (void) syncIdentifier: (nonnull NSString*) identifierType
    identifier: (nonnull NSString*) identifier
         authentication: (ACPMobileVisitorAuthenticationState) authenticationState {
}

+ (void) syncIdentifiers: (nullable NSDictionary*) identifiers {
    [AEPMobileIdentity syncIdentifiers:identifiers];
}

+ (void) syncIdentifiers: (nullable NSDictionary*) identifiers authentication: (ACPMobileVisitorAuthenticationState) authenticationState {
    [AEPMobileIdentity syncIdentifiers:identifiers authenticationState:authenticationState];
}

+ (void) getUrlVariables: (nonnull void (^) (NSString* __nullable urlVariables)) callback {
    [AEPMobileIdentity getUrlVariables:^(NSString * _Nullable variables, NSError * _Nullable error) {
        callback(variables);
    }];
}

+ (void) getUrlVariablesWithCompletionHandler: (void (^) (NSString* _Nullable, NSError* _Nullable)) completionHandler {
    [AEPMobileIdentity getUrlVariables:^(NSString * _Nullable variables, NSError * _Nullable error) {
        completionHandler(variables, error);
    }];
}

#pragma MARK: Private Helpers
static NSMutableArray *convertVisitorIds(NSArray<id<AEPIdentifiable>> * _Nullable visitorIDs) {
    NSMutableArray *arr = [NSMutableArray array];
    
    for (id<AEPIdentifiable> visitorID in visitorIDs) {
        ACPMobileVisitorId *convertedId = [[ACPMobileVisitorId alloc] initWithOrigin:visitorID.origin
                                                                                type:visitorID.type id:visitorID.identifier
                                                                      authentication:visitorID.authenticationState];
        [arr addObject:convertedId];
    }
    
    return arr;
}

@end
