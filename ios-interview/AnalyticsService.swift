//
//  AnalyticsService.swift
//  ios-interview
//
//  Created by Daniel Jisoo Choi on 11/12/16.
//  Copyright © 2016 Headspace. All rights reserved.
//

import Foundation

class Analytics {
    static let sharedInstance = Analytics()
    
    let loginService = LoginService()
    let completedMeditationService = CompletedMeditationService()
}

protocol AnalyticsService {
    func sendEvent(user: String, data: [String:String]?)
}

class LoginService: AnalyticsService {
    func sendEvent(user: String, data: [String:String]? = nil) {
        // Send login event to Google Analytics and Snowplow.
        GoogleAnalyticsSDK.sharedInstance.sendEvent("login", forUser: user, withData: data ?? [:])
        SnowplowSDK.sharedInstance.dispatchEvent("log_in", withPayload: [
            "userID": user
            ])
    }
}

class CompletedMeditationService: AnalyticsService {
    func sendEvent(user: String, data: [String : String]? = nil) {
        // Send meditation completion event to Google Analytics
    GoogleAnalyticsSDK.sharedInstance.sendEvent("completeMeditation", forUser: user, withData: data ?? [:])
    }
}
