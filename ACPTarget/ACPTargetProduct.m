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

#import "ACPTargetProduct.h"

@implementation ACPTargetProduct

static NSString* const KEY_PRODUCT_ID = @"id";
static NSString* const KEY_CATEGORY_ID = @"categoryId";

+ (instancetype) targetProductWithId: (NSString*) productId categoryId: (NSString*) categoryId {
    ACPTargetProduct* me = [[ACPTargetProduct alloc] init];

    me.productId = productId;
    me.categoryId = categoryId;

    return me;
}

- (nonnull AEPTargetProduct* ) toAEPObject {
    return[[AEPTargetProduct alloc] initWithProductId:self.productId categoryId:self.categoryId];
}

- (instancetype) initWithCoder: (NSCoder*) aDecoder {
    if (self = [super init]) {
        self.productId = [aDecoder decodeObjectForKey:KEY_PRODUCT_ID];
        self.categoryId = [aDecoder decodeObjectForKey:KEY_CATEGORY_ID];
    }

    return self;
}

- (void) encodeWithCoder: (NSCoder*) aCoder {
    [aCoder encodeObject:_productId forKey:KEY_PRODUCT_ID];
    [aCoder encodeObject:_categoryId forKey:KEY_CATEGORY_ID];
}

- (instancetype) copyWithZone: (NSZone*) zone {
    return [ACPTargetProduct targetProductWithId:_productId categoryId:_categoryId];
}

@end
