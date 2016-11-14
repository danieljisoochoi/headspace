//
//  Analytics.swift
//  ios-interview
//
//  Created by Daniel Jisoo Choi on 11/12/16.
//  Copyright © 2016 Headspace. All rights reserved.
//

import Foundation

class Analytics {
    static let sharedInstance = Analytics()
    
    private init() {}
    
    let loginService = LoginServiceImpl()
    let meditationService = MeditationServiceImpl()
}

protocol AnalyticsService {
    func sendEvent(event: String, user: String, data: [String:String]?)
}

protocol LoginService: AnalyticsService {
    func login(user: String)
}

class LoginServiceImpl: LoginService {
    let textColor = "blue"
    
    func sendEvent(event: String, user: String, data: [String:String]? = nil) {
        switch event {
        case "login":
            login(user: user)
        default:
            break
        }
    }
    
    private func login(user: String) {
        // Send login event to the following SDKs
        GoogleAnalyticsSDK.sharedInstance.sendEvent("login", forUser: user, withData: ["buttonColor" : textColor])
        SnowplowSDK.sharedInstance.dispatchEvent("log_in", withPayload: [
            "userID": user
            ])
    }
}

protocol MeditationService: AnalyticsService {
    func completedMeditation(user: String, data: [String:String]?)
}

class MeditationServiceImpl: MeditationService {
    func sendEvent(event: String, user: String, data: [String : String]? = nil) {
        switch event {
        case "started":
            break
        case "completed":
            completedMeditation(user: user, data: data)
        default:
            break
        }
    }
    private func completedMeditation(user: String, data: [String : String]? = nil) {
        // Send meditation completion event to Google Analytics
        GoogleAnalyticsSDK.sharedInstance.sendEvent("completeMeditation", forUser: user, withData: data ?? [:])
    }
}
