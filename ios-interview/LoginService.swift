//
//  LoginService.swift
//  ios-interview
//
//  Created by Daniel Jisoo Choi on 11/14/16.
//  Copyright © 2016 Headspace. All rights reserved.
//

import Foundation

protocol LoginService: AnalyticsService {
    func login(data: [String:String])
}

class LoginServiceImpl: LoginService {
    var analyticsData: [String: String] =
    [
        "buttonColor" : "blue"
    ]
    
    func sendEvent(event: String, data: [String:String]? = nil) {
        analyticsData.concatenate(with: data)
        switch event {
        case "login":
            login(data: analyticsData)
        default:
            break
        }
    }
    
    internal func login(data: [String: String]) {
        // Send login event to the following SDKs
        GoogleAnalyticsSDK.sharedInstance.sendEvent("login", forUser: user, withData: data)
        SnowplowSDK.sharedInstance.dispatchEvent("log_in", withPayload: [
            "userID": user
            ])
    }
}
