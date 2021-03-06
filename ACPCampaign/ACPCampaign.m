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
#import <AEPCore/AEPCore-Swift.h>
#import <AEPIdentity/AEPIdentity-Swift.h>
#import <AEPServices/AEPServices-Swift.h>
#import <AEPRulesEngine/AEPRulesEngine-Swift.h>
#import <AEPCampaign/AEPCampaign-Swift.h>
#import "ACPExtension.h"
#import "ACPCore.h"
#import "ACPCampaign.h"

@implementation ACPCampaign

#pragma mark - Campaign

+ (nonnull NSString*) extensionVersion {
    return [AEPMobileCampaign extensionVersion];
}

+ (void) registerExtension {
    [ACPCore registerExtension:[AEPMobileCampaign class] error:nil];
}

+ (void) resetLinkageFields {
    [AEPMobileCampaign resetLinkageFields];
}

+ (void) setLinkageFields:(NSDictionary<NSString *,NSString *> *)linkageFields {
    [AEPMobileCampaign setLinkageFields: linkageFields];
}

@end
