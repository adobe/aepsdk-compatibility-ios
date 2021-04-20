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

#import "ACPTargetParameters.h"
#import "ACPTargetProduct.h"
#import "ACPTargetOrder.h"

@implementation ACPTargetParameters

static NSString* const KEY_PARAMETERS = @"parameters";
static NSString* const KEY_MBOX_PARAMETERS = @"mboxparameters";
static NSString* const KEY_PROFILE_PARAMETERS = @"profileParameters";
static NSString* const KEY_ORDER = @"order";
static NSString* const KEY_PRODUCT = @"product";
static NSString* const KEY_ID = @"id";
static NSString* const KEY_ORDER_TOTAL = @"total";
static NSString* const KEY_PURCHASED_PRODUCT_IDS = @"purchasedProductIds";
static NSString* const KEY_CATEGORY_ID = @"categoryId";

+ (nonnull instancetype) targetParametersWithParameters: (NSDictionary*) parameters
                                      profileParameters: (NSDictionary*) profileParameters
                                                product: (ACPTargetProduct*) product
                                                  order: (ACPTargetOrder*) order {
    ACPTargetParameters* me = [[ACPTargetParameters alloc] init];

    me.parameters = [NSDictionary dictionaryWithDictionary:parameters];
    me.profileParameters = [NSDictionary dictionaryWithDictionary:profileParameters];
    me.product = product;
    me.order = order;

    return me;
}

- (nonnull AEPTargetParameters* ) toAEPObject {
    return [[AEPTargetParameters alloc] initWithParameters: self.parameters
                                         profileParameters: self.profileParameters
                                         order: [self.order toAEPObject]
                                         product: [self.product toAEPObject]];
}

- (instancetype) initWithCoder: (NSCoder*) aDecoder {
    if (self = [super init]) {
        self.parameters = [aDecoder decodeObjectForKey:KEY_PARAMETERS];
        self.profileParameters = [aDecoder decodeObjectForKey:KEY_PROFILE_PARAMETERS];
        self.order = [aDecoder decodeObjectForKey:KEY_ORDER];
        self.product = [aDecoder decodeObjectForKey:KEY_PRODUCT];
    }

    return self;
}

- (void) encodeWithCoder: (NSCoder*) aCoder {
    [aCoder encodeObject:_parameters forKey:KEY_PARAMETERS];
    [aCoder encodeObject:_profileParameters forKey:KEY_PROFILE_PARAMETERS];
    [aCoder encodeObject:_order forKey:KEY_ORDER];
    [aCoder encodeObject:_product forKey:KEY_PRODUCT];
}

- (instancetype) copyWithZone: (NSZone*) zone {
    ACPTargetProduct* productCopy = [_product copyWithZone:zone];
    ACPTargetOrder* orderCopy = [_order copyWithZone:zone];

    return [ACPTargetParameters targetParametersWithParameters:[NSDictionary dictionaryWithDictionary:_parameters]
                                             profileParameters:[NSDictionary dictionaryWithDictionary:_profileParameters]
                                                       product:productCopy
                                                         order:orderCopy];
}

@end
