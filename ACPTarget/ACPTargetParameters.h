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

@class ACPTargetOrder, ACPTargetProduct;

@interface ACPTargetParameters : NSObject <NSCoding, NSCopying>

@property(nonatomic, strong, nullable) NSDictionary<NSString*, NSString*>* parameters;  //Dictionary containing key-value pairs of parameters
@property(nonatomic, strong, nullable) NSDictionary<NSString*, NSString*>* profileParameters;  //Dictionary containing key-value pairs of profile parameters
@property(nonatomic, strong, nullable) ACPTargetOrder* order;  //ACPTargetOrder object
@property(nonatomic, strong, nullable) ACPTargetProduct* product;  //ACPTargetProduct object

/**
 * @brief Create an instance of a Target Parameters object.
 *
 * @param parameters generic parameters
 * @param profileParameters profile parameters
 * @param product target product object associated with the object
 * @param order target order object associated with the object
 */
+ (nonnull instancetype) targetParametersWithParameters: (nullable NSDictionary*) parameters
                                      profileParameters: (nullable NSDictionary*) profileParameters
                                                product: (nullable ACPTargetProduct*) product
                                                  order: (nullable ACPTargetOrder*) order;

/**
 * @brief Converts the current instance to an AEPTargetParameters object
 */
- (nonnull AEPTargetParameters* ) toAEPObject;

@end
