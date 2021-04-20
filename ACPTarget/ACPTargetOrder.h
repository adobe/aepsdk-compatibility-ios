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

@interface ACPTargetOrder : NSObject <NSCoding, NSCopying>
@property(nonatomic, strong, nonnull) NSString* orderId;
@property(nonatomic, strong, nullable) NSNumber* total;
@property(nonatomic, strong, nullable) NSArray<NSString*>* purchasedProductIds;

/**
 * @brief Create an instance of a Target Order object.
 *
 * @param orderId order id associated with the order
 * @param total value of the order
 * @param purchasedProductIds an array of pucharsed product ids
 */
+ (nonnull instancetype) targetOrderWithId: (nonnull NSString*) orderId
                                     total: (nullable NSNumber*) total
                       purchasedProductIds: (nullable NSArray <NSString*>*) purchasedProductIds;

/**
 * @brief Converts the current instance to an AEPTargetOrder object
 */
- (nonnull AEPTargetOrder* ) toAEPObject;

@end
