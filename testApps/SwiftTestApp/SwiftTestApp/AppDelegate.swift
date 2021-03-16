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

import UIKit
import ACPCore
import AEPIdentity
import AEPLifecycle
import AEPSignal
import ACPUserProfile
import AEPUserProfile
import ACPAudience
import AEPAudience
import ACPAnalytics
import AEPAnalytics
import AEPMedia
import ACPMedia

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ACPCore.setLogLevel(.verbose)
        ACPCore.configure(withAppId: "")
        ACPCore.configureWithFile(inPath: "")
        
        ACPCore.getSdkIdentities { (ids) in
            // handle
        }
        
        ACPCore.getSdkIdentities { (ids, error) in
            // handle
        }
        
        ACPCore.registerURLHandler { (url) -> Bool in
            return true
        }
        
        ACPCore.getPrivacyStatus { (status) in
            // handle
        }
        
        ACPCore.getPrivacyStatus { (status, error) in
            // handle
        }
        
        let version = ACPCore.extensionVersion()
        let version1 = ACPIdentity.extensionVersion()
        let version2 = ACPSignal.extensionVersion()
        let version3 = ACPLifecycle.extensionVersion()
        
        ACPCore.setAppGroup("")
        
        ACPCore.setLogLevel(.debug)
        
        ACPCore.updateConfiguration([:])
        
        ACPCore.collectPii([:])
        
        ACPCore.lifecyclePause()
        
        ACPCore.setAdvertisingIdentifier("")
        
        ACPCore.setPushIdentifier(Data())
        
        ACPCore.trackAction("", data: nil)
        
        ACPCore.trackState("", data: nil)
        
        let event = try! ACPExtensionEvent(name: "", type: "", source: "", data: nil)
        try? ACPCore.dispatchEvent(event)
        
        try? ACPCore.dispatchEvent(withResponseCallback: event) { (responseEvent) in
            // handle
        }
        
        try? ACPCore.dispatchResponseEvent(event, request: event)
        
        ACPCore.collectLaunchInfo([:])
        
        ACPCore.collectMessageInfo([:])
        
        ACPCore.downloadRules()
        
        let level = ACPCore.logLevel()
        
        ACPCore.log(level, tag: "", message: "")
        
        ACPCore.setWrapperType(.flutter)
        
        let extensionsToRegister = [Identity.self, Lifecycle.self, Signal.self, UserProfile.self, Analytics.self, Audience.self, Media.self]
        ACPCore.registerExtensions(extensionsToRegister) {
            ACPCore.lifecycleStart(nil)
        }
        
        ACPIdentity.append(to: URL(string: "https://test.com")!) { (url) in
            // handle
        }
        
        ACPIdentity.append(to: URL(string: "https://test.com")!) { (url, error) in
            // handle
        }
        
        ACPIdentity.getIdentifiers { (ids) in
            // handle
        }
        
        ACPIdentity.getIdentifiersWithCompletionHandler { (ids, error) in
            // handle
        }
        
        ACPIdentity.getExperienceCloudId { (id) in
            // handle
        }
        
        ACPIdentity.getExperienceCloudId { (id, error) in
            // handle
        }
        
        ACPIdentity.syncIdentifier("", identifier: "", authentication: .authenticated)
        
        ACPIdentity.syncIdentifiers([:])
        
        ACPIdentity.syncIdentifiers([:], authentication: .loggedOut)
        
        ACPIdentity.getUrlVariables { (vars) in
            // handle
        }
        
        ACPIdentity.getUrlVariables { (vars, error) in
            // handle
        }
        
        ACPUserProfile.updateUserAttribute("username", withValue: "Will Smith");
        var profileMap = [AnyHashable: Any]()
        profileMap["username"] = "will_smith"
        profileMap["usertype"] = "Actor"
        ACPUserProfile.updateUserAttributes(profileMap)
        ACPUserProfile.removeUserAttribute("itemsAddedToCart")
        ACPUserProfile.removeUserAttributes(["username","usertype"])
        ACPUserProfile.getUserAttributes(["itemsAddedToCart"], withCompletionHandler: {(dict: [AnyHashable: Any]?, error: Error?) -> Void in
                      // your customized code
        })
        
        // Audience Manager Testing
        ACPCore.setPrivacyStatus(.optIn)
        sleep(1)
        let traits = ["mykey":"myvalue"]
        ACPAudience.signal(withData: traits) { (profile) in
            print("Audience::#signalWithData - retrieved visitor profile: \(String(describing: profile))")
        }
        
        ACPAudience.signal(withData: traits) { (profile, error) in
            if error != nil {
                print("Audience::#signalWithDataWithCompletionHandler - error: \(String(describing: error?.localizedDescription))")
            }
            else {
                print("Audience::#signalWithDataWithCompletionHandler - retrieved visitor profile: \(String(describing: profile))")
            }
        }
        
        ACPAudience.getVisitorProfile { (retrievedProfile) in
            print("Audience::#getVisitorProfile - retrieved visitor profile: \(String(describing: retrievedProfile))")
        }
                                         
        ACPAudience.getVisitorProfile { (retrievedProfile, error) in
            if error != nil {
                print("Audience::#getVisitorProfileWithCompletionHandler - error : \(String(describing: error?.localizedDescription))")
            }
            else {
                print("Audience::#getVisitorProfileWithCompletionHandler - retrieved visitor profile: \(String(describing: retrievedProfile))")
            }
        }
        
        ACPAudience.reset()

        //Analytics Testing
        
        let analyticsVersion = ACPAnalytics.extensionVersion()
        
        ACPAnalytics.getQueueSize { (queueSize) in
            //handle
        }
        
        ACPAnalytics.getQueueSize { (queueSize, error) in
            //handle
        }
        
        ACPAnalytics.sendQueuedHits()
        
        ACPAnalytics.clearQueue()
        
        ACPAnalytics.getVisitorIdentifier { (visitorIdentifier) in
          //handle
        }
        
        ACPAnalytics.getVisitorIdentifier { (visitorIdentifier, error) in
          //handle
        }
        
        ACPAnalytics.getTrackingIdentifier { (trackingIdentifier) in
          //handle
        }
        
        ACPAnalytics.getTrackingIdentifier { (trackingIdentifier, error) in
          //handle
        }
        
        //Media Analytics Testing
        
        let mediaAnalyticsVersion = ACPMedia.extensionVersion()
        //test tracker
        var config: [String: Any] = [:]
        config[ACPMediaKeyConfigChannel] = "custom-channel"  // Override channel configured from launch
        config[ACPMediaKeyConfigDownloadedContent] = true
        
        guard let mediaTracker = ACPMedia.createTracker(withConfig:config) else {
            return (ACPMedia.createTracker(withConfig:config) != nil);
        }
        //test media object
        let mediaObject = ACPMedia.createMediaObject(withName: "media-name", mediaId: "media-id", length: 60, streamType: ACPMediaStreamTypeVod, mediaType:ACPMediaType.video)
        
        var mediaMetadata = [ACPVideoMetadataKeyShow: "Sample show", ACPVideoMetadataKeySeason: "Sample season"]
        mediaMetadata["isUserLoggedIn"] = "false"
        mediaMetadata["tvStation"] = "Sample TV station"
        
        //Media APIs
        mediaTracker.trackSessionStart(mediaObject, data: mediaMetadata)
        mediaTracker.trackPlay()
        mediaTracker.trackPause()
        mediaTracker.trackError("testError")
        mediaTracker.updateCurrentPlayhead(0.0)
        //track Event
        let stateObject = ACPMedia.createStateObject(withName: "fullscreen")
        mediaTracker.trackEvent(ACPMediaEvent.stateStart, info: stateObject, data: nil)

        mediaTracker.trackEvent(ACPMediaEvent.stateEnd, info: stateObject, data: nil)
    
        //QoE
        let qoeObject = ACPMedia.createQoEObject(withBitrate: 1000000, startupTime: 2, fps: 25, droppedFrames: 10)
        mediaTracker.updateQoEObject(qoeObject)
        mediaTracker.trackComplete()
        mediaTracker.trackSessionEnd()

        return true
    }
       
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

