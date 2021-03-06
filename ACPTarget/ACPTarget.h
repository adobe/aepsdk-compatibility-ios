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
#import "ACPTargetOrder.h"
#import "ACPTargetParameters.h"
#import "ACPTargetPrefetchObject.h"
#import "ACPTargetProduct.h"
#import "ACPTargetRequestObject.h"

@interface ACPTarget : NSObject {}

#pragma mark - Target

/**
 *  @brief Clears prefetched mboxes.
 *
 *  Clears the cached prefetched ACPTargetPrefetchObject array.
 *
 *  @see ACPTarget::prefetchContent:withProfileParameters:callback:
 */
+ (void) clearPrefetchCache;

/**
 * @brief Returns the current version of the ACPTarget Extension.
 */
+ (nonnull NSString*) extensionVersion;

/**
 *  @brief Gets the custom visitor ID for Target
 *  @param callback will be invoked to return the thirdPartyId value or `nil` if
 *  no third-party ID is set
 */
+ (void) getThirdPartyId: (nonnull void (^) (NSString* __nullable thirdPartyId)) callback;

/**
 *  @brief Gets the Test and Target user identifier.
 *
 *  Retrieves the TnT ID returned by the Target server for this visitor. The TnT ID is set to the
 *  Mobile SDK after a successful call to prefetch content or load requests.
 *
 *  This ID is preserved between app upgrades, is saved and restored during the standard application
 *  backup process, and is removed at uninstall or when ACPTarget::resetExperience is called.
 *
 *  @param callback invoked with the current tnt id or `nil` if no tnt id is set.
 *
 *  @see ACPTarget::prefetchContent:withProfileParameters:callback:
 *  @see ACPTarget::resetExperience
 */
+ (void) getTntId: (nonnull void (^) (NSString* __nullable tntId)) callback;

/**
 * @brief Registers the ACPTarget extension with the Core Event Hub.
 */
+ (void) registerExtension;

/**
 *  @brief Resets the user's experience
 *
 *  Resets the user's experience by removing the visitor identifiers.
 *  Removes previously set third-party and TnT IDs from persistent storage.
 */
+ (void) resetExperience;

/**
 *  @brief Sets the Target preview restart deep link.
 *
 *  Set the Target preview URL to be displayed when the preview mode is restarted.
 *
 *  @param deeplink the URL which will be set for preview restart
 */
+ (void) setPreviewRestartDeeplink: (nonnull NSURL*) deeplink;

/**
 *  @brief Sets the custom visitor ID for Target.
 *
 *  Sets a custom ID to identify visitors (profiles). This ID is preserved between app upgrades,
 *  is saved and restored during the standard application backup process, and is removed at uninstall or
 *  when ACPTarget::resetExperience is called.
 *
 *  @param thirdPartyId a string pointer containing the value of the third party id (custom visitor id)
 *  @see ACPTarget::resetExperience
 */
+ (void) setThirdPartyId: (nullable NSString*) thirdPartyId;

/**
 *  @brief Retrieves content for multiple Target mbox locations at once.
 *
 *  Executes a batch request to your configured Target server for multiple mbox locations. Any prefetched content
 *  which matches a given mbox location is returned and not included in the batch request to the Target server.
 *  Each object in the array contains a callback function, which will be invoked when content is available for
 *  its given mbox location.
 *
 *  @param requests An array of ACPTargetRequestObject objects to retrieve content
 *  @param parameters a TargetParameters object containing parameters for all locations in the requests array
 *
 *  @see ACPTargetRequestObject
 */
+ (void) retrieveLocationContent: (nonnull NSArray<ACPTargetRequestObject*>*) requests
                  withParameters: (nullable ACPTargetParameters*) parameters;

/**
 *  @brief Prefetch multiple Target mboxes simultaneously.
 *
 *  Executes a prefetch request to your configured Target server with the ACPTargetPrefetchObject list provided
 *  in the \p prefetchObjectArray parameter. This prefetch request will use the provided parameters for all of
 *  the prefetches made in this request. The \p callback will be executed when the prefetch has been completed, returning
 *  an error object, nil if the prefetch was successful or error description if the prefetch was unsuccessful.
 *  The prefetched mboxes are cached in memory for the current application session and returned when requested.
 *
 *  @param prefetchObjectArray an array of ACPTargetPrefetchObject representing the desired mboxes to prefetch
 *  @param parameters a TargetParameters object containing parameters for all the mboxes in the request array
 *  @param callback a function pointer which will be called after the prefetch is complete.  The error parameter
 *         in the callback will be nil if the prefetch completed successfully, or will contain error message otherwise
 *
 *  @see ACPTargetPrefetchObject
 */
+ (void) prefetchContent: (nonnull NSArray<ACPTargetPrefetchObject*>*) prefetchObjectArray
          withParameters: (nullable ACPTargetParameters*) parameters
                callback: (nullable void (^) (NSError* _Nullable error)) callback;

/**
 * Sends a display notification to Target for given prefetched mboxes. This helps Target record location display events.
 *
 * @param mboxNames (required) an array of displayed location names
 * @param parameters {@link TargetParameters} for the displayed location
 */
+ (void) locationsDisplayed: (nonnull NSArray<NSString*>*) mboxNames
       withTargetParameters: (nullable ACPTargetParameters*) parameters;

/**
 * @brief Sends a click notification to Target if a click metric is defined for the provided location name.
 *
 * Click notification can be sent for a location provided a load request has been executed for that prefetched or regular mbox
 * location before, indicating that the mbox was viewed. This request helps Target record the clicked event for the given location or mbox.
 *
 * @param name NSString value representing the name for location/mbox
 * @param parameters a TargetParameters object containing parameters for the location clicked
 */
+ (void) locationClickedWithName: (nonnull NSString*) name
                targetParameters: (nullable ACPTargetParameters*) parameters;

@end
