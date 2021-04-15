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
#import <AEPTarget/AEPTarget-Swift.h>

@class ACPTargetParameters;

/**
 *  @class ACPTargetPrefetchObject
 *  This class contains the name of the Target location/mbox and a dictionary of mbox parameters to be used in a prefetch
 *  @see prefetchContentForObjects:withProfileParameters:callback:
 */
@interface ACPTargetPrefetchObject : NSObject

@property(nonatomic, strong, nullable) NSString* name; ///< The name of the Target location/mbox
@property(nonatomic, strong, nullable) ACPTargetParameters* targetParameters; ///target parameters associated with the prefetch object. You can set all other parameters in this object

/**
 * @brief Create an instance of a Target prefetch object.
 *
 * Create an instance of a Target prefetch object which may be used to make a batch request to the configured
 * Target server to prefetch content for mbox locations.
 *
 * @param name NSString value representing the name for location/mbox to prefetch
 * @param targetParameters parameters to be associated with mbox
 * @return a pointer to an ACPTargetPrefetchObject containing values provided by the parameters
 *
 * @see ADBMobileMarketing::targetPrefetchObjectWithName()
 * @see ADBMobileMarketing::targetPrefetchContent()
 */
+ (nonnull instancetype) targetPrefetchObjectWithName: (nonnull NSString*) name
                                     targetParameters: (nullable ACPTargetParameters*) targetParameters;


- (nonnull AEPTargetPrefetchObject* ) toAEPObject;

@end

