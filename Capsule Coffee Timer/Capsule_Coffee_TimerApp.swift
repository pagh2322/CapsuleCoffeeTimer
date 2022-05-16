//
//  Capsule_Coffee_TimerApp.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI
import AppTrackingTransparency
import GoogleMobileAds

@main
struct Capsule_Coffee_TimerApp: App {
    @StateObject private var viewModel = ViewModel()
    
    //Use init() in place of ApplicationDidFinishLaunchWithOptions in App Delegate
        init() {
            if ATTrackingManager.trackingAuthorizationStatus == .notDetermined {
                //User has not indicated their choice for app tracking
                //You may want to show a pop-up explaining why you are collecting their data
                //Toggle any variables to do this here
            } else {
                ATTrackingManager.requestTrackingAuthorization { status in
                    //Whether or not user has opted in initialize GADMobileAds here it will handle the rest
                                                                
                    GADMobileAds.sharedInstance().start(completionHandler: nil)
                }
            }
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.viewModel)
        }
    }
}
