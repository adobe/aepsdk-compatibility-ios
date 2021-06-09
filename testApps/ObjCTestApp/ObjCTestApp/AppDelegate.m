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

#import "AppDelegate.h"
#import <ACPCore/ACPCore.h>
#import <ACPCore/ACPIdentity.h>
#import <ACPCore/ACPLifecycle.h>
#import <ACPCore/ACPSignal.h>
#import <ACPCore/ACPExtensionEvent.h>
#import <ACPUserProfile/ACPUserProfile.h>
#import <ACPAudience/ACPAudience.h>
#import "AppsFlyerAdobeExtension/AppsFlyerAdobeExtension.h"
#import <AdformAdobeExtension/AdformAdobeExtension.h>
#import <AEPAssurance/AEPAssurance.h>
#import <ACPAnalytics/ACPAnalytics.h>
#import <ACPMedia/ACPMedia.h>
#import <ACPMedia/ACPMediaConstants.h>
#import <ACPCampaign/ACPCampaign.h>
#import "SkeletonExtension.h"


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [ACPCore setLogLevel:ACPMobileLogLevelVerbose];
    [ACPCore configureWithAppId:@"test-app-id"];
    [ACPCore configureWithFileInPath:@"path"];
    
    [ACPCore getSdkIdentities:^(NSString * _Nullable content) {
        // handle
    }];
    
    [ACPCore getSdkIdentitiesWithCompletionHandler:^(NSString * _Nullable content, NSError * _Nullable error) {
        // handle
    }];
    
    [ACPCore registerURLHandler:^BOOL(NSString * _Nullable url) {
        // handle
        return YES;
    }];
    
    [ACPCore getPrivacyStatus:^(ACPMobilePrivacyStatus status) {
        // handle
    }];
    
    [ACPCore getPrivacyStatusWithCompletionHandler:^(ACPMobilePrivacyStatus status, NSError * _Nullable error) {
        // handle
    }];
    
    NSString *version = [ACPCore extensionVersion];
    NSString *version1 = [ACPIdentity extensionVersion];
    NSString *version2 = [ACPSignal extensionVersion];
    NSString *version3 = [ACPLifecycle extensionVersion];
    
    [ACPCore setAppGroup:@"group"];
    
    [ACPCore setLogLevel:ACPMobileLogLevelDebug];
    
    [ACPCore updateConfiguration:@{}];
    
    // TODO: register extension
    
    [ACPCore collectPii:@{}];
    
    [ACPCore lifecyclePause];
    
    [ACPCore setAdvertisingIdentifier:@"test"];
    
    [ACPCore setPushIdentifier:nil];
    
    [ACPCore trackAction:@"" data:nil];
    
    [ACPCore trackState:@"" data:nil];
    
    ACPExtensionEvent *event = [ACPExtensionEvent extensionEventWithName:@"" type:@"" source:@"" data:nil error:nil];
    
    [ACPCore dispatchEvent:event error:nil];
    
    [ACPCore dispatchEventWithResponseCallback:event responseCallback:^(ACPExtensionEvent * _Nonnull responseEvent) {
        // handle
    } error:nil];
    
    [ACPCore dispatchResponseEvent:event requestEvent:event error:nil];
    
    [ACPCore collectLaunchInfo:@{}];
    
    [ACPCore collectMessageInfo:@{}];
    
    [ACPCore downloadRules];
    
    ACPMobileLogLevel level = [ACPCore logLevel];
    
    [ACPCore log:level tag:@"" message:@""];
    
    [ACPCore setWrapperType:ACPMobileWrapperTypeFlutter];
    
    [ACPIdentity registerExtension];
    [ACPLifecycle registerExtension];
    [ACPSignal registerExtension];
    [ACPCore registerExtension:[SkeletonExtension class] error:nil];
    [AppsFlyerAdobeExtension registerExtension];
    [AdformAdobeExtension registerExtension];
    [AEPAssurance registerExtension];
    [ACPUserProfile registerExtension];
    [ACPAudience registerExtension];
    [ACPAnalytics registerExtension];
    [ACPMedia registerExtension];
    [ACPCampaign registerExtension];

    [ACPCore start:^{
        [ACPCore lifecycleStart:nil];
    }];
    
    [ACPIdentity appendToUrl:[NSURL URLWithString:@""] withCallback:^(NSURL * _Nullable urlWithVisitorData) {
       // handle
    }];
    
    [ACPIdentity appendToUrl:[NSURL URLWithString:@""] withCompletionHandler:^(NSURL * _Nullable urlWithVersionData, NSError * _Nullable error) {
        // handle
    }];
    
    [ACPIdentity getIdentifiers:^(NSArray<ACPMobileVisitorId *> * _Nullable visitorIDs) {
        // handle
    }];
    
    [ACPIdentity getIdentifiersWithCompletionHandler:^(NSArray<ACPMobileVisitorId *> * _Nullable visitorIDs, NSError * _Nullable error) {
        // handle
    }];
    
    [ACPIdentity getExperienceCloudId:^(NSString * _Nullable experienceCloudId) {
        // handle
    }];
    
    [ACPIdentity getExperienceCloudIdWithCompletionHandler:^(NSString * _Nullable experienceCloudId, NSError * _Nullable error) {
        // handle
    }];
    
    [ACPIdentity syncIdentifier:@"" identifier:@"" authentication:ACPMobileVisitorAuthenticationStateLoggedOut];
    
    [ACPIdentity syncIdentifiers:@{}];
    
    [ACPIdentity syncIdentifiers:@{} authentication:ACPMobileVisitorAuthenticationStateLoggedOut];
    
    [ACPIdentity getUrlVariables:^(NSString * _Nullable urlVariables) {
        // handle
    }];
    
    [ACPIdentity getUrlVariablesWithCompletionHandler:^(NSString * _Nullable urlVariables, NSError * _Nullable error) {
        // handle
    }];
    
    [ACPUserProfile updateUserAttribute:@"username" withValue:@"Will Smith"];
    NSMutableDictionary *profileMap = [NSMutableDictionary dictionary];
    [profileMap setObject:@"username" forKey:@"will_smith"];
    [profileMap setObject:@"usertype" forKey:@"Actor"];
    [ACPUserProfile updateUserAttributes:profileMap];
    [ACPUserProfile removeUserAttribute:@"itemsAddedToCart"];
    [ACPUserProfile removeUserAttributes:@[@"username", @"usertype"]];
    NSArray *attributes;
    attributes = [NSArray arrayWithObjects: @"username", nil];
    [ACPUserProfile getUserAttributes:attributes withCompletionHandler:^(NSDictionary* dict, NSError* error){
    // your customized code
    }];
    
    // Audience Manager Testing
    [ACPCore setPrivacyStatus:ACPMobilePrivacyStatusOptIn];
    sleep(1);
    NSMutableDictionary *traits = [[NSMutableDictionary alloc] init];
        [traits setObject:@"myvalue" forKey:@"mykey"];
    
    [ACPAudience signalWithData:traits callback:^(NSDictionary * _Nullable visitorProfile) {
        NSLog(@"Audience::#signalWithData - visitor profile: %@",[visitorProfile descriptionInStringsFileFormat]);
    }];
    
    [ACPAudience signalWithData:traits withCompletionHandler:^(NSDictionary * _Nullable visitorProfile, NSError * _Nullable error) {
        if(error) {
            NSLog(@"Audience::#signalWithDataWithCompletionHandler - error occured: %@", [error localizedDescription]);
        }
        else{
            NSLog(@"Audience::#signalWithDataWithCompletionHandler - visitor profile: %@",[visitorProfile descriptionInStringsFileFormat]);
        }
    }];
    
    [ACPAudience getVisitorProfile:^(NSDictionary * _Nullable profile) {
        NSLog(@"Audience::#getVisitorProfile - retrieved visitor profile: %@",[profile descriptionInStringsFileFormat]);
    }];
    
    [ACPAudience getVisitorProfileWithCompletionHandler:^(NSDictionary * _Nullable visitorProfile, NSError * _Nullable error) {
        if(error) {
            NSLog(@"Audience::#getVisitorProfileWithCompletionHandler - error while retrieving visitor profile: %@", [error localizedDescription]);
        }
        else {
            NSLog(@"Audience::#getVisitorProfileWithCompletionHandler - retrieved visitor profile: %@",[visitorProfile descriptionInStringsFileFormat]);
        }
    }];
    
    [ACPAudience reset];

    //Analytics Testing

    NSString *analyticsVersion = [ACPAnalytics extensionVersion];
    
    [ACPAnalytics getQueueSize:^(NSUInteger queueSize) {
       //handle
    }];
    
    [ACPAnalytics getQueueSizeWithCompletionHandler:^(NSUInteger queueSize, NSError * _Nullable error) {
        //handle
    }];
    
    [ACPAnalytics sendQueuedHits];
    
    [ACPAnalytics clearQueue];
    
    [ACPAnalytics getTrackingIdentifier:^(NSString * _Nullable trackingIdentifier) {
        //handle
    }];
    
    [ACPAnalytics getTrackingIdentifierWithCompletionHandler:^(NSString * _Nullable trackingIdentifier, NSError * _Nullable error) {
        //handle
    }];
    
    [ACPAnalytics getVisitorIdentifier:^(NSString * _Nullable visitorIdentifier) {
        //handle
    }];

    [ACPAnalytics getVisitorIdentifierWithCompletionHandler:^(NSString * _Nullable visitorIdentifier, NSError * _Nullable error) {
        //handle
    }];
    
    //Media Analytics Testing
    NSString *mediaVersion = [ACPMedia extensionVersion];
    
    NSMutableDictionary* config = [NSMutableDictionary dictionary];
    config[ACPMediaKeyConfigChannel] = @"custom-channel";
    config[ACPMediaKeyConfigDownloadedContent] = @YES;
    
    ACPMediaTracker *mediaTracker = [ACPMedia createTrackerWithConfig:config];
    
    NSDictionary *mediaObject = [ACPMedia createMediaObjectWithName: @"video-name"
                                                            mediaId: @"video-id"
                                                             length: 60
                                                         streamType: ACPMediaStreamTypeVod
                                                          mediaType: ACPMediaTypeVideo];
    
    NSMutableDictionary *mediaMetadata = [[NSMutableDictionary alloc] init];
    [mediaMetadata setObject:@"Sample show" forKey:ACPVideoMetadataKeyShow];
    [mediaMetadata setObject:@"Sample season" forKey:ACPVideoMetadataKeySeason];

   
    [mediaMetadata setObject:@"false" forKey:@"isUserLoggedIn"];
    [mediaMetadata setObject:@"Sample TV station" forKey:@"tvStation"];

    [mediaTracker trackSessionStart:mediaObject data:mediaMetadata];
    [mediaTracker trackPlay];
    [mediaTracker trackPause];
    [mediaTracker updateCurrentPlayhead:(0.0)];
    NSDictionary* stateObject = [ACPMedia createStateObjectWithName:@"fullscreen"];
    [mediaTracker trackEvent:ACPMediaEventStateStart info:stateObject data:nil];
    [mediaTracker trackEvent:ACPMediaEventStateEnd info:stateObject data:nil];
    NSDictionary* qoeObject = [ACPMedia createQoEObjectWithBitrate:1000000 startupTime:2 fps:25 droppedFrames:10];
    [mediaTracker updateQoEObject:qoeObject];
    [mediaTracker trackError:@"errorId"];
    [mediaTracker trackComplete];
    [mediaTracker trackSessionEnd];
    
    // Campaign Testing
    [ACPCampaign setLinkageFields:@{@"cusFirstName" : @"John", @"cusLastName": @"Doe", @"cusEmail": @"john.doe@email.com"}];
    [ACPCampaign resetLinkageFields];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
