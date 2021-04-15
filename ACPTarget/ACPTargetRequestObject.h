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
#import "ACPTargetPrefetchObject.h"
#import <AEPTarget/AEPTarget-Swift.h>

@class ACPTargetParameters;

/**
 *  @class ACPTargetRequestObject
 *  This class extends ACPTargetPrefetchObject, adding default content and a function pointer property which will be
 *  used as a callback when requesting content from Target
 *  @see loadRequests:withProfileParameters
 */
@interface ACPTargetRequestObject : ACPTargetPrefetchObject

@property(nonatomic, strong, nonnull) NSString* defaultContent; ///< The default content that will be returned if Target servers are unreachable
@property(nonatomic, strong, nullable) void (^callback)(NSString* __nullable content); ///< Optional. When batch requesting Target locations, callback will be invoked when content is available for this location.

/**
 * @brief Create an instance of a Target request object.
 *
 * Creates an instance of a Target request object which may be used to make batch requests to the configured
 * Target server for content for mbox locations.
 *
 * @param name NSString value representing the name for location/mbox to retrieve
 * @param targetParameters parameters to be associated with mbox
 * @param defaultContent NSString value returned by the callback if the SDK is unable to retrieve content for the given mbox/location
 * @param callback method which will be invoked once content is available for requested mbox/location
 * @return a pointer to an ACPTargetRequestObject containing pre-set values provided by the parameters
 *
 * @see ADBMobileMarketing::targetRequestObjectWithName()
 * @see ADBMobileMarketing::targetLoadRequests()
 */
+ (nonnull instancetype) targetRequestObjectWithName: (nonnull NSString*) name
                                    targetParameters: (nullable ACPTargetParameters*) targetParameters
                                      defaultContent: (nonnull NSString*) defaultContent
                                            callback: (nullable void (^) (NSString* __nullable content)) callback;

- (nonnull AEPTargetRequestObject* ) toAEPObject;

@end
