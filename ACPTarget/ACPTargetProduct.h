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

@interface ACPTargetProduct : NSObject<NSCoding, NSCopying>

@property(nonatomic, strong, nullable) NSString* productId;
@property(nonatomic, strong, nullable) NSString* categoryId;

/**
 * @brief Create an instance of a Target Product object.
 * @param productId product id associated with the product
 * @param categoryId category id associated with the product
 */
+ (nonnull instancetype) targetProductWithId: (nonnull NSString*) productId
                                  categoryId: (nullable NSString*) categoryId;

- (nonnull AEPTargetProduct* ) toAEPObject;

@end
