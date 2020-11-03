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

@interface ACPUserProfile : NSObject {}

/**
 * @brief Returns the current version of the ACPUserProfile Extension.
 */
+ (nonnull NSString*) extensionVersion;

/**
 * @brief Registers the UserProfile extension
 *
 * This method should be called before any other User Profile API is called
 */
+ (void) registerExtension;

/**
 * UserProfile API to remove the give attribute name
 *
 * If the attribute does not exist, this API has no effects
 * If the attribute exists, then the User Attribute will be removed
 *
 * @param attributeName Attribute key which has to be removed.
 */
+ (void) removeUserAttribute: (nonnull NSString*) attributeName;

/**
 * UserProfile API to remove the give attribute names
 *
 * If the attribute does not exist, this API has no effects
 * If the attribute exists, then the User Attribute will be removed
 *
 * @param attributeNames Attribute keys which have to be removed.
 */
+ (void) removeUserAttributes: (nullable NSArray <NSString*>*) attributeNames;

/**
 * UserProfile API to set user profile attributes keys and values.
 *
 * If the attribute does not exist, it will be created. If the attribute
 * already exists, then the value will be updated. An empty attribute value will remove the attribute.
 *
 * @param attributeName  Attribute key.
 * @param attributeValue Attribute value corresponding to the key.
 */
+ (void) updateUserAttribute: (nonnull NSString*) attributeName withValue: (nullable NSString*) attributeValue;

/**
 * UserProfile API to set user profile attributes keys and values.
 *
 * If the attribute does not exist, it will be created. If the attribute
 * already exists, then the value will be updated. A empty attribute value will remove the attribute.
 *
 * @param attributeMap of profile attributes key-value pairs to be set.
 */
+ (void) updateUserAttributes: (nonnull NSDictionary*) attributeMap;

/**
 * Get user profile attribute entries for the specific keys.
 *
 * If a specific key name does not exist in the user profile, the returned map will not include an entry for it. If none of the attributes exists for all the keys, an empty dictionary will be returned.
 *
 * @param attributNames  Attribute keys which will be used to retrieve user attributes
 * @param completionHandler Method which will be called with user attributes, and an NSError param if the request failed
*/
+ (void) getUserAttributes: (nullable NSArray <NSString*>*) attributNames withCompletionHandler: (nonnull void (^) (NSDictionary* __nullable userAttributes, NSError* _Nullable error)) completionHandler;

@end
