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

#import "ACPTargetOrder.h"

@implementation ACPTargetOrder

static NSString* const KEY_ORDER_ID = @"id";
static NSString* const KEY_ORDER_TOTAL = @"total";
static NSString* const KEY_PURCHASED_PRODUCT_IDS = @"purchasedProductIds";

+ (instancetype) targetOrderWithId: (NSString*) orderId
                             total: (NSNumber*) total
               purchasedProductIds: (NSArray<NSString*>*) purchasedProductIds {
    ACPTargetOrder* me = [[ACPTargetOrder alloc] init];

    me.orderId = orderId;
    me.total = total;
    me.purchasedProductIds = [NSArray arrayWithArray:purchasedProductIds];

    return me;
}

- (nonnull AEPTargetOrder* ) toAEPObject {
    return [[AEPTargetOrder alloc] initWithId:self.orderId total:[self.total doubleValue] purchasedProductIds:self.purchasedProductIds];
}

- (instancetype) initWithCoder: (NSCoder*) aDecoder {
    if (self = [super init]) {
        self.orderId = [aDecoder decodeObjectForKey:KEY_ORDER_ID];
        self.purchasedProductIds = [aDecoder decodeObjectForKey:KEY_PURCHASED_PRODUCT_IDS];
        self.total = [aDecoder decodeObjectForKey:KEY_ORDER_TOTAL];
    }

    return self;
}

- (void) encodeWithCoder: (NSCoder*) aCoder {
    [aCoder encodeObject:_orderId forKey:KEY_ORDER_ID];
    [aCoder encodeObject:_purchasedProductIds forKey:KEY_PURCHASED_PRODUCT_IDS];
    [aCoder encodeObject:_total forKey:KEY_ORDER_TOTAL];
}

- (instancetype) copyWithZone: (NSZone*) zone {
    return [ACPTargetOrder targetOrderWithId:_orderId
                                       total:_total
                         purchasedProductIds:[_purchasedProductIds copyWithZone:zone]];
}
@end
