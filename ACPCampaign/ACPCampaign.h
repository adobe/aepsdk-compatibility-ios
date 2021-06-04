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

@interface ACPCampaign : NSObject {}

/**
 * @brief Returns the current version of the ACPCampaign Extension.
 */
+ (nonnull NSString*) extensionVersion;

/**
 *  @brief Clears previously stored linkage fields in the mobile SDK and triggers Campaign rules download request to the configured Campaign server.
 */
+ (void) resetLinkageFields;

/**
 *  @brief Registers the ACPCampaign extension with the Core Event Hub.
 */
+ (void) registerExtension;

/**
 *  @brief Sets the Campaign linkage fields (CRM IDs) in the mobile SDK to be used for downloading personalized messages from Campaign.
 *
 *  @param linkageFields invoked with a NSDictionary containing linkage fields key value pairs.
 */
+ (void) setLinkageFields: (nonnull NSDictionary<NSString*, NSString*>*) linkageFields;

@end
