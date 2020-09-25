/*
Copyright 2020 Adobe. All rights reserved.
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
        
        let extensionsToRegister = [Identity.self, Lifecycle.self, Signal.self]
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

